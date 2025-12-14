Write-Host "--- 1. Initializing Vault ---" -ForegroundColor Cyan
loam init . --nover

Write-Host "`n--- Importing CSV ---" -ForegroundColor Cyan

Import-Csv .\data\NU_33881380_01MAI2025_31MAI2025.csv | ForEach-Object {
    $id = "output/$($_.Identificador)"
    loam write --id "$id.md" --set "date=$($_.Data)" --set "value=$($_.Valor)" --content "$($_.Descrição)`n" --nover
    Write-Host "Imported $id"
}

Write-Host "`n--- Demo Complete ---" -ForegroundColor Cyan
