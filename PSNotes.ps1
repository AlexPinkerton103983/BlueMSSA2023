<#  #>
Select-Object <# selects subset of objects passed into pipeline #>

#Example
Get-Process | Sort-Object -Property VM | Select-Object -First 10
<# Selects the first 10 processes based on the least amount of virtual memory #>
#Example2
Get-Service | Sort-Object -Property Name | Select-Object -Last 10
<# Selects the last 10 objects alphabetically by name #>

Select-Object -Unique <# Unique parameter will filter out duplicates #>