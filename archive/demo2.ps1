Write-Host "--- 1. Initializing Vault ---" -ForegroundColor Cyan
loam init . --nover

Write-Host "`n--- Importing CSV ---" -ForegroundColor Cyan

# Import, Transform, and Save
Import-Csv .\data\NU_33881380_01MAI2025_31MAI2025.csv | 
Select-Object @{N = 'id'; E = { $_.Identificador } }, 
@{N = 'date'; E = { $_.Data } }, 
@{N = 'value'; E = { $_.Valor } },
@{N = 'content'; E = { $_.Descrição } } | ForEach-Object {
    $id = "output/$($_.id)"
    $content = $_.content
        
    # Build YAML Frontmatter dynamically from other properties
    $yaml = "---`n"
    $_.PSObject.Properties | Where-Object { $_.Name -notin 'content' } | ForEach-Object {
        $yaml += "$($_.Name): $($_.Value)`n"
    }
    $yaml += "tags: [finance, nubank]`n"
    $yaml += "---`n`n"
        
    $doc = $yaml + $content
        
    # We explicitly use .md extension so loam parses the frontmatter we just built
    $doc | loam write --id "$id.md" --raw --nover
    Write-Host "Imported $id"
}

Write-Host "`n--- Demo Complete ---" -ForegroundColor Cyan
