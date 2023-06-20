<# Exercise 1 #>
Get-Help New-Item -ShowWindow
Set-Location C:

New-Item -Path \\LON-SVR1\C$\ -Name ScriptShare -ItemType Directory
Get-ChildItem
Get-ChildItem \\LON-SVR1\C$

Get-Help New-PSDrive -Showwindow
New-PSDrive -Name ScriptShare -PSProvider FileSystem -Root '\\LON-SVR1\C$\ScriptShare'
Get-PSDrive

Get-Help Set-Location -ShowWindow
New-Item -Name Script.txt -Path ScriptShare: -ItemType File

<# Exercise 2 #>
Get-Command *key* #nope
Get-ChildItem -Path HKCU:\SOFTWARE
Test-Path -Path HKCU:\SOFTWARE\scripts #tests if path exists

New-Item -Path HKCU:\SOFTWARE -Name Scripts 

New-ItemProperty HKCU:\SOFTWARE\Scripts -Name PSDriveName -Value ScriptShare
Get-ItemProperty HKCU:\SOFTWARE\Scripts -Name PSDriveName
Get-ItemPropertyValue HKCU:\SOFTWARE\Scripts -name PSDriveName

<# Exercise 3 #>

Get-help *module*
Import-Module ActiveDirectory

Get-PSDrive
New-PSDrive AdatumUsers -PSProvider ActiveDirectory -Root 'CN=Users,DC=Adatum,DC=Com'

Set-Location AdatumUsers:

Get-ChildItem
Get-ADUser -Filter * -SearchBase 'cn=users,dc=adatum,dc=com' #what you would normally do

