# verify_pipeline.ps1

Write-Host "--- 1. Setup Environment ---" -ForegroundColor Cyan
$vaultDir = "verify_vault"
if (Test-Path $vaultDir) { Remove-Item $vaultDir -Recurse -Force }
New-Item -ItemType Directory -Path $vaultDir | Out-Null
Set-Location $vaultDir

# Initialize Loam
Write-Host "Initializing Loam..."
loam init . --nover

# Path to scripts (relative to vaultDir)
$srcDir = "..\src"
$adapter = "$srcDir\adapters\nubank\Get-NubankTransactions.ps1"
$loader = "$srcDir\utils\Save-ToVault.ps1"
$dataFile = "..\data\NU_33881380_01MAI2025_31MAI2025.csv"

Write-Host "--- 2. Running Pipeline ---" -ForegroundColor Cyan
# Execution
& $adapter -Path $dataFile -Owner "teste" -Ledger "personal" | & $loader

Write-Host "--- 3. Verification ---" -ForegroundColor Cyan
$files = Get-ChildItem -Recurse -Filter "*.md"
if ($files.Count -gt 0) {
    Write-Host "Success! Created $($files.Count) notes." -ForegroundColor Green
    $files | Select-Object -First 3 | Format-Table Name, FullName
}
else {
    Write-Host "Error: No files created." -ForegroundColor Red
    exit 1
}

# Cleanup
Set-Location ..
# Remove-Item $vaultDir -Recurse -Force # Keep for inspection if needed
