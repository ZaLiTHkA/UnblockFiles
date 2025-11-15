function Unblock-Files {
  param(
    [string]$Path = (Get-Location),
    [int]$Depth = [int]::0
  )

  Write-Host "Launching Unblock-Files Helper" -ForegroundColor Green

  $depthLabel = "$Depth levels"
  if ($Depth -eq -1) {
    $Depth = [int]::MaxValue
    $depthLabel = "infinitely"
  }
  Write-Host "looking for files, going $depthLabel deep from '$Path'..." -ForegroundColor Gray

  $files = Get-ChildItem -Path $Path -File -Recurse -Depth $Depth
  if (-not $files) {
    Write-Host "no files found to process, please check your command and try again..." -ForegroundColor Red
    return
  }

  Write-Host "located $($files.Count) files worth checking..." -ForegroundColor Gray
  if (-not (Read-Host "would you like to continue? (y/N)").ToLower().StartsWith('y')) {
    Write-Host "exiting script, no changes were made." -ForegroundColor Red
    return
  }

  $files | Unblock-File
  Write-Host "successfully executed 'Unblock-File' on $($files.Count) files." -ForegroundColor Green
}

Export-ModuleMember -Function 'Unblock-Files'
