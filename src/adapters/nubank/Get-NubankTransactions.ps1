<#
.SYNOPSIS
    Parses Nubank CSV files into Canonical Transaction Objects.

.DESCRIPTION
    Reads a Nubank export CSV and converts each row into a standardized object
    ready for the Finance Vault pipeline.

.PARAMETER Path
    Path to the Nubank CSV file.

.PARAMETER Owner
    The owner of these transactions (e.g., 'joao').

.PARAMETER Ledger
    The context/ledger for these transactions (e.g., 'personal', 'family').

.EXAMPLE
    Get-NubankTransactions -Path .\NU.csv -Owner 'joao' -Ledger 'family'
#>
[CmdletBinding()]
param (
    [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
    [string]$Path,

    [Parameter(Mandatory = $true)]
    [string]$Owner,

    [Parameter(Mandatory = $true)]
    [string]$Ledger
)

process {
    $csvData = Import-Csv -Path $Path

    foreach ($row in $csvData) {
        # Parse Amount (European format 1.000,00 or US format? CSV seems to be US-ish based on '8.00')
        # Looking at data/NU_*.csv: '8.00', '-13.40'. It uses dot for decimal.
        $amount = [decimal]$row.Valor

        # Parse Date (DD/MM/YYYY)
        $dateObj = [datetime]::ParseExact($row.Data, 'dd/MM/yyyy', $null)
        $isoDate = $dateObj.ToString('yyyy-MM-dd')

        # Create Canonical Object
        [PSCustomObject]@{
            id          = $row.Identificador
            date        = $isoDate
            amount      = $amount
            currency    = 'BRL'
            description = $row.Descrição
            category    = $null
            tags        = @('nubank', 'import')
            account     = 'nubank'
            owner       = $Owner
            ledger      = $Ledger
            metadata    = @{
                raw_source = 'nubank_csv'
            }
        }
    }
}
