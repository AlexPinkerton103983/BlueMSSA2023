<# LAB 06 #>
<# Exercise 1 #>
<# Create a variable $logPath that contains C:\logs\ #>
$logPath = "C:\logs\"

<# For $logPath, identify the type of variable and the available properties and methods. #>
$logPath | Get-Member
$logPath | Get-Member -MemberType Methods

<# Create a variable $logFile that contains log.txt. #>
$logFile = "log.txt"

<# Update $logPath to include the contents of $logFile #>
$logPath = $logPath + $logFile
$logPath

<# Update the path stored in $logPath to use drive D instead of drive C. #>
$logPath = $logPath.Replace('C:','D:')

<# Verify the variable has been modified. #>
$logPath

<# At the Windows PowerShell prompt, create a variable $today that contains today’s date. #>

$today = Get-Date
$today

<# For the variable $today, identify the type of variable and the available properties and methods. #>
$today | Get-Member -MemberType Methods

<# Use the properties of $today to create a string in the format Year-Month-Day-Hour-Minute.txt, and store the value in $logFile. #>
(((($today.tostring()).replace('/','-')).replace(' ','-')).replace(':','-')).replace('-PM','.txt')

Get-Date -UFormat
Get-Date -Format yyyy-MM-dd-HH-mm

$logFile = [string]$Today.YEar + '-' + 
  $Today.Month + '-' + 
  $Today.Day + '-' + 
  $Today.Hour + '-' + 
  $Today.Minute + '.txt'

$logFile

<# Create a variable $cutOffDay that contains the date 30 days before today. #>
$cutOffDay = $today.AddDays(-30)
$cutOffDay

<# Use Get-ADUser to query user accounts that have signed in since $cutOffDay. Filter by using the LastLogonDate property. #>
Get-AdUser -Properties LastLogonDate -Filter * | Where-Object {$PSItem.LastLogonDate -gt $CutOffDate}

<# Exercise 2 #>
<# Query all Active Directory Domain Services (AD DS) users in the Marketing department and place them in a variable named $mktgUsers. Include the Department property in the results. #>
get-help  about_activedirectory_filter
Get-ADUser -Filter * -Properties * | Get-Member

$MktgUsers = Get-ADUser -Filter {Department -eq 'Marketing'} -Properties department

<# Use $mktgUsers to identify the number of users in the Marketing department. #>
$MktgUsers.Count

<# Display the first user in $mktgUsers and verify that the Department property is listed. #>
$MktgUsers[0]

<# Pipe the users in $mktgUsers to Set-ADUser and update the department to Business Development. #>
$MktgUsers | Set-ADUser -Department 'Business Development'

<# Review the Department attribute in $mktgUsers to check if it has been updated. #>
$MktgUsers.Department

<# Query all AD DS users in the Marketing department to verify that there are none. #>
Get-ADUser -Filter {Department -eq 'Marketing'} -properties department

<# Query all AD DS users in the Business Development department and verify that it matches the previous count from the Marketing department. #>
Get-ADUser -Filter {Department -eq 'Business Development'}
$MktgUsers
$MktgUsers.count

<# Create an arraylist named $computers with the values LON-SRV1, LON-SRV2, and LON-DC1. #>
[System.Collections.ArrayList]$computers = "LON-SVR1","LON-SVR2","LON-DC1"

<# Verify that $computers doesn't have a fixed size. #>
$computers.isfixedsize

<# Add LON-DC2 to $computers #>

$computers | Get-Member #Doesn't work because it GMs the objects in the array

Get-Member -InputObject $computers # To see methods for the array

$computers.add("LON-DC2")
$computers

<# Remove LON-SRV2 from $computers #>
$computers.remove("LON-SVR2")
$computers

<# Display the contents of $computers #>
$computers


<# EXERCISE 3 #>
<# Create a hash table named $EmployeeDetails with the following Information:

Name as the key and Simon Parks as its value
Address as the key and 20 Green Street as its value
Postcode as the key and 2000 as its value #>
$EmployeeDetails = @{
  Name = 'Simon Parks'
  Address = '20 Green Street'
  PostCode = 2000
}

<# Display the contents of $EmployeeDetails #>
$EmployeeDetails

<# Display the address for the employee. #>
$employeeDetails.Address

<# Update the address to "3421 George St" #>
$employeeDetails.Address = "3421 George St"
$employeeDetails

<# Add City as a key with Sydney it's value to the EmployeeDetails. #>
Get-Member -InputObject $EmployeeDetails
$employeeDetails.Add("City","Sydney")
$employeeDetails

<# Remove postcode from EmployeeDetails #>
$employeeDetails.Remove("PostCode")

<# Verify that Postcode is removed. #>
$employeeDetails






