$repoUrl = "https://github.com/ZaLiTHkA/UnblockFiles/archive/refs/heads/main.zip"

$zipPath      = "$env:TEMP\UnblockFiles.zip"
$extractPath  = "$env:TEMP\UnblockFilesExtracted"
$moduleTarget = "$env:USERPROFILE\Documents\PowerShell\Modules\UnblockFiles"

Write-Host "Downloading UnblockFiles module..." -ForegroundColor Cyan
Invoke-WebRequest -Uri $repoUrl -OutFile $zipPath

Write-Host "Extracting..." -ForegroundColor Cyan
if (Test-Path $extractPath) { Remove-Item $extractPath -Recurse -Force }
Expand-Archive -Path $zipPath -DestinationPath $extractPath -Force

Write-Host "Installing module..." -ForegroundColor Cyan

if (Test-Path $moduleTarget) {
  Remove-Item $moduleTarget -Recurse -Force
}

Copy-Item "$extractPath\UnblockFiles-main" $moduleTarget -Recurse -Force

Write-Host "Importing module..." -ForegroundColor Cyan

Import-Module UnblockFiles -Force

Write-Host "`nInstallation complete!" -ForegroundColor Green
Write-Host "You can now run the helper using:" -ForegroundColor Green
Write-Host "  Unblock-Files" -ForegroundColor Yellow
