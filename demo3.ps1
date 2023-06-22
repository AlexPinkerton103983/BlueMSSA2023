@(1,2,3,4) | ForEach-Object {
  Write-Host $_
}

foreach ($Number in @(1,2,3,4)) {
  Write-Host $Number
}