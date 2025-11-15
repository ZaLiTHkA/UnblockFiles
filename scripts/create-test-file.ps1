if (-not $IsWindows) {
    Write-Warning "This test script only applies on Windows. Other OSes do not support Zone.Identifier ADS."
    return
}

$targetDir = Join-Path (Get-Location) "test-files"
$targetFile = Join-Path $targetDir "dummy.pdf"

if (-not (Test-Path $targetDir)) {
    Write-Host "Creating directory: $targetDir"
    New-Item -Path $targetDir -ItemType Directory | Out-Null
}

Write-Host "Creating dummy file: $targetFile"
"Hello world" | Set-Content -Path $targetFile -Encoding UTF8

$zoneData = @"
[ZoneTransfer]
ZoneId=3
"@

Write-Host "Attaching Zone.Identifier ADS..."
Set-Content -Path $targetFile -Stream Zone.Identifier -Value $zoneData

Write-Host "Test file created and marked as blocked." -ForegroundColor Green
