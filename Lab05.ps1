<# LAB 05 #>
<# Exercise 1 #>
<# Using the keyword configuration, find a repository class that lists IP addresses being used by the local computer. #>
Get-command *cim*
Get-CimClass -Namespace root\cimv2 | Where-Object { $_.CimClassName -like 'win32_*configuration*' }
Get-CimInstance -ClassName win32_networkadapterconfiguration | Get-Member
Get-CimInstance -ClassName Win32_NetworkAdapterConfiguration | Where-Object { $_.DHCPEnabled -eq $False } | Select-Object -Property IPAddress

$Keyword = 'service'
$ChosenClass = get-cimclass -Namespace root\cimv2 | 
  Where-Object { $_.CimClassName -like "win32_*$Keyword*" } | 
  Out-GridView -OutputMode Single
Get-CimInstance -ClassName $ChosenClass.CimClassName | 
  Where-Object { $_.Name -like 's*' } | 
  Select-Object -Property Name, State, StartName

<# Exercise 3 #>
<# Using a CIM command stop the Spooler service on the LON-DC1 machine by running the command on LON-CL1 #>
Get-help invoke-cimmethod -ShowWindow
(Get-CimClass -ClassName win32_service).CimClassMethods
<# Gets the win32 services, filters to spooler, invokes the method stop service #>
Get-CimInstance -ClassName Win32_Service | Where-Object { $_.Name -eq 'Spooler' } | Invoke-CimMethod -MethodName StopService

Get-CimInstance -ClassName Win32_service | Where-Object {$_.Name -eq 'WinRM'} | Invoke-CimMethod -MethodName ChangeStartMode -Arguments @{StartMode = "Automatic"}

