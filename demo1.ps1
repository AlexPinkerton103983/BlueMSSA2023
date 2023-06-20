Get-Service | Where-Object {$_.status -eq 'Running'}
<# Gets Services that are running #>

Get-Help Get-Service -ShowWindow
<# Gets the help file for the get-service cmdlet and shows in separate window #>

Get-Command *user
<# Gets commands that end with 'user' #>

Get-Service | Get-Member
<# Displays all properties and methods for object, shows type of object #>

Get-Service | Select-Object -Property Name,Status
<# Shows Name and status for all services #>

Get-Volume | Select-Object -Property DriveLetter, @{n='SizeUsed';e={$_.Size - $_.SizeRemaining}}
<# Gets the volumes, shows only drive letter and calculates size used using a hash table #>

Get-PSProvider
<# A provider in PowerShell is an interface that allows file system like access to a datastore. #>
<# Lists the capabilities of each provider #>

cd function:\
<# CD is alias for set-location, changes current drive to the function provider #>

Get-PSDrive
<# A PowerShell drive represents a specific form of storage that connects to Windows Powershell by using a Powershell provider #>

Get-Command -Noun item,itemprop*,location,ChildItem
<# Helps to navigate the PSDrives #>



Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object *
<# Shows properties of the current operating system #>
Get-CimInstance -NameSpace root -Classname __Namespace

Get-CimClass -NameSpace root -ClassName __NAMESPACE
get-cimclass -namespace root/standardCIMV2

Get-Command -Module CimCmdlets
Get-CimInstance -ClassName *operating*
Get-CimInstance -ClassName Win32_LogicalDisk | Get-Member
Get-Volume | Select-Object DriveLetter,Size,SizeRemaining