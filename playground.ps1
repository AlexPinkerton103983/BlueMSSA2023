Get-Volume | Select-Object -Property DriveLetter,@{n='PercentUsed';e={($_.SizeRemaining / $_.Size)*100}}

get-volume | Get-Member

Get-Process | Where-Object

get-process | Where-Object {$_.CPU -gt 50}

get-service | Where-Object {$_.DependentServices -le 1}

get-service | Where-Object {$_.DependentServices.count -le 1} | Select-Object -Property Name,DependentServices

get-command | 

$myarray = 1, 2, 3

#$myarray | Get-Member
Get-Member -InputObject $myarray

Get-process | 

Get-Process -typename *object*

Get-Help Typename -showonline

get-command Get-o*

get-help tee-object

get-process

