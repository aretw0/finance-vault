<#
.SYNOPSIS
    Persists Canonical Transaction Objects to the Vault using Loam.

.DESCRIPTION
    Takes canonical objects from the pipeline, determines the correct file path
    based on the multi-tenancy strategy, and writes the file using 'loam write'.

.PARAMETER InputObject
    The Canonical Transaction Object.

.EXAMPLE
    Get-NubankTransactions ... | Save-ToVault
#>
[CmdletBinding()]
param (
    [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
    [PSCustomObject]$InputObject
)

process {
    $txn = $InputObject
    
    # 1. Parse Date for Directory Structure
    $dateObj = [datetime]::ParseExact($txn.date, 'yyyy-MM-dd', $null)
    $year = $dateObj.ToString('yyyy')
    $month = $dateObj.ToString('MM')
    
    # 2. Determine File Path: vault/{ledger}/{owner}/{year}/{month}/{id}.md
    # We rely on 'loam write' to handle the file creation, but we need to pass the ID relative to the root or absolute?
    # Loam treats ID as the file path if it ends in .md, or appends .md if not.
    # We should output to 'vault/...'
    
    $dirPath = "vault/$($txn.ledger)/$($txn.owner)/$year/$month"
    # Ensure directory exists? Loam might do it, but to be safe/explicit:
    if (-not (Test-Path $dirPath)) {
        New-Item -ItemType Directory -Force -Path $dirPath | Out-Null
    }

    $filePath = "$dirPath/$($txn.id).md"

    # 3. Construct YAML Frontmatter
    # We want to exclude 'id', 'ledger', 'owner' from the frontmatter since they are in the path? 
    # Or keep them for redundancy/searchability? keeping them is safer for 'grep' or Loam queries.
    
    # We use --set for Loam to handle metadata, or construct raw content.
    # Constructing raw content gives us more control over the specific YAML format if needed,
    # but 'loam write --set' is the "Unix way" of using the tool.
    # However, passing nested objects (metadata) via CLI flags might be tricky.
    # Let's use the --raw approach from demo2.ps1 for maximum flexibility.

    $yaml = "---`n"
    $txn.PSObject.Properties | ForEach-Object {
        if ($_.Name -eq 'metadata') {
            # Handle metadata object simple serialization
            $yaml += "metadata:`n"
            $_.Value.Keys | ForEach-Object { 
                $k = $_; $v = $txn.metadata[$k]
                $yaml += "  ${k}: $v`n" 
            }
        }
        elseif ($_.Name -eq 'tags') {
            $tagStr = $_.Value -join ', '
            $yaml += "tags: [$tagStr]`n"
        }
        else {
            $yaml += "$($_.Name): $($_.Value)`n"
        }
    }
    $yaml += "---`n`n"
    
    # Content body (could be description or empty)
    $content = "# $($txn.description)`n"
    
    $fullDoc = $yaml + $content
    
    # 4. Call Loam
    $fullDoc | loam write --id $filePath --raw --nover
    
    Write-Host "Saved: $filePath" -ForegroundColor Green
}
