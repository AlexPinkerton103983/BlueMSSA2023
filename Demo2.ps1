
$DirName = 'e:\test\'

$DirName + "subdir"

$Num1 = '45' #String
$Num2 = 334 #INT

$Num1.GetType().Name
$Num2.GetType().Name

$User = 'bob'

$Num1 + $Num2 #Creates a string from $Num2 to match $Num1

$Num2 + $Num1 #Converts $Num1 to INT to match $Num2

$Num1 = 45

[int]$c = 21412

$Num1 + $Num2
$Num2 - $Num1
$num1 * $Num2
$Num2 / $Num1 #Formats the result as Double
$Num2 % $Num1 #Returns the remainder

'bob' * 3 # bobbobbob

$header = 'Orders'
Write-Host $header
<# Write-Host '-----' #>
Write-Host ('-' * $Header.Length)
Write-Host 345

[datetime]$Y2k = '1 jan 2000'
$Y2k | Select-Object -Property *
{ "We're going to write this to the screen. Pretty cool yeah?, I think so" }

$TestStr = "The lazy cat sat on the mat"
$TestStr | Get-Member -MemberType Methods
$TestStr.Replace('a', 'r')
$TestStr = $TestStr.Replace('a', 'r')
$TestStr

$TestStr.Remove(12)

$TestStr.Remove(3, 5)

<# Because $choice is a string, indexof checks for the entire string anywhere #>
$choice = Read-Host -Prompt 'Can I continue'
$yes = $choice.IndexOf('yes')
if ($yes -ne -1) { 'All Good' }
else { 'no good' }

$crap = '       company data     '
$crap
$crap.trim()

[<# string #>array]$Names = 'bill', 'bob', 'ben'
[string[]]$Names = 'bill', 'bob', 'ben'
$Names
$Names[1]
$Names[0..1]
$Names | Get-Member
Get-Member -InputObject $Names
$IP = '131.107.0.10'
$IPArray = $IP.split('.')
Write-Host $IPArray[3..0]
($IPArray[3..0] -join '.') + '.in-addr.arpa'

[System.Collections.ArrayList]$Computers = 'lon-dc1', 'lon-cl1', 'lon-svr1'
$Computers.IsFixedSize
Get-Member -InputObject $Computers
$Computers.Reverse()
$Computers.add('lon-dc2')
$computers.insert(2, 'lon-cl2')
$Computers.Remove('lon-svr1')
$Computers

Get-Help *output*

Get-Command | Get-Random | Get-Help -Full

$car1 = @{
  engine     = 250
  wheelDrive = 4 
  color      = 'blue'
}

$car1.color
$car1.comp = Get-Service -Name Spooler
$car1.comp
$car1.Add('sunroof',$true) 
$car1

New-Object -typename  PSObject -Property
