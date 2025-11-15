function Unblock-Files {
  param(
    [string]$Path = (Get-Location),
    [int]$Depth = [int]::0
  )

  $depthLabel = "$Depth levels"
  if ($Depth -eq -1) {
    $Depth = [int]::MaxValue
    $depthLabel = "infinitely"
  }
  Write-Host "looking for files, going $depthLabel deep from '$Path'..."

  $files = Get-ChildItem -Path $Path -File -Recurse -Depth $Depth
  if (-not $files) {
    Write-Host "no files found to process, please check your command and try again..."
    return
  }

  Write-Host "located $($files.Count) files worth checking..."
  if (-not (Read-Host "would you like to continue? (y/N)").ToLower().StartsWith('y')) {
    Write-Host "exiting script, no changes will be made."
    return
  }

  $files | Unblock-File
  Write-Host "successfully executed 'Unblock-File' on $($files.Count) files."
}

Export-ModuleMember -Function 'Unblock-Files'
