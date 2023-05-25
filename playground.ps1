Get-Volume | Select-Object -Property DriveLetter,@{n='PercentUsed';e={($_.SizeRemaining / $_.Size)*100}}

get-volume | Get-Member