Get-Service | 
Where-Object {$_.Name -like 'a*'} | 
Select-Object -property status, displayname |
ConvertTo-Csv |
Out-File -FilePath e:\services.csv

get-service | get-member

$CSS = @'

'@

get-help convertto-html

get-help convertto-html

Get-Service -Name s* |
  Out-GridView -OutputMode Multiple -Title 'Choose some services to be stopped' |
  Stop-Service -WhatIf 
