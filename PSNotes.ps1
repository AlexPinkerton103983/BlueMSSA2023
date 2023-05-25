<#  #>
Select-Object <# selects subset of objects passed into pipeline #>
Where-Object <# denotes which object you want to see based on a condition ie. test #>

#Example
Get-Process | Sort-Object -Property VM | Select-Object -First 10
<# Selects the first 10 processes based on the least amount of virtual memory #>
#Example2
Get-Service | Sort-Object -Property Name | Select-Object -Last 10
<# Selects the last 10 objects alphabetically by name #>

Select-Object -Unique <# Unique parameter will filter out duplicates #>

<# FILTER LEFT #>
# To save processing power, always filter as far left as possible.
#WrongExample
Get-Block | Sort-Object -Property Letter | Where-Object {$_.Color -eq 'Red'}
# Sorting takes more computing power than filtering, so sorting first is wrong

#CorrectExample
Get-Block | Where-Object {$_.Color -eq 'Red'} | Sort-Object -Property Letter

<# ENUMERATION #>
# To run multiple commands on an object use ForEach to cycle through each object
#Example
Get-Service | ForEach-Object {
  '' + $_.Name + ' is the name of the service'
  '' + $_.Status + ' is the status of ' + $_.Name
  "________________________________"
}

#WrongExample
#This will run Get-Random 10 times, for each number in the array 1..10
1..10 | ForEach-Object {Get-Random -SetSeed $_}