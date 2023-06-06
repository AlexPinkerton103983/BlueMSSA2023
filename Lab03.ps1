<# LAB03 #>

<# Exercise 1 #>

<# Using a keyword such as date, find a command that can display the current date. #>
Get-Command *date*
# ANSWER
Get-Date

<# Display the members of the object produced by the command that you found in the previous step. #>
# ANSWER
Get-Date | Get-Member

<# Display only the day of the year. #>
get-help get-date -Online
# ANSWER
Get-Date | Select-Object -Property DayOfYear

<# Display the results of the previous command with the name of the property and its value on a single line. #>
Get-Date | Select-Object -expandProperty DayOfYear
# ANSWER
Get-Date | Select-Object -Property DayOfYear | Format-List

<# TASK 02 #>
<# Using a keyword such as hotfix, find a command that can display a list of the installed hotfixes. #>
Get-Command *hotfix*
get-help get-hotfix -Online
# ANSWER
Get-HotFix

<# Display the members of the object produced by the command that you found in the previous step. #>
# ANSWER
Get-HotFix | Get-Member

<# Display a list of the installed hotfixes. Display only the installation date, hotfix ID number, and name of the user who installed the hotfix. #>
Get-HotFix | Select-Object -Property *
# ANSWER
Get-HotFix | Select-Object -Property InstalledOn, HotFixID, InstalledBy

<# Display a list of the installed hotfixes. Display only the hotfix ID, the number of days since the hotfix was installed, and the name of the user who installed the hotfix #>
Get-HotFix | Select-Object -Property *
Get-HotFix | Select-Object -Property InstalledOn, HotFixID, InstalledBy
# ANSWER
Get-HotFix | Select-Object -Property HotFixID,@{n='DaysSinceHotFix';e={((Get-Date) - $_.InstalledOn).Days}}, InstalledBy

<# TASK 3 #>
<# Using a keyword such as DHCP or scope, find a command that can display a list of Internet Protocol version 4 (IPv4) Dynamic Host Configuration Protocol (DHCP) scopes. #>
get-command -noun *DHCP*
get-dhcpserverv4Scope # Fails to get version because we are on CL1 and the DHCP Server is on DC1
# ANSWER
Get-DHCPServerV4Scope -ComputerName LON-DC1

<# Display a list of the available IPv4 DHCP scopes on LON-DC1. This time, include only the scope ID, subnet mask, and scope name, and display the output Property:Data results in a single column down the screen. #>
# ANSWER
Get-DHCPServerV4Scope -ComputerName Lon-DC1 | Select-Object ScopeID, SubnetMask, Name | Format-List

<# Task 4 #>
<# Using a keyword such as rule, find a command that can display the firewall rules. #>
get-command *firewall*
# ANSWER
Get-NetFirewallRule

<# Review the help for the command that displays the firewall rules. #>
# ANSWER
Get-Help Get-NetFirewallRule -showwindow

<# Display a list of the firewall rules that are enabled. #>
# ANSWER
Get-NetFirewallRule -Enabled

<# Display the same data in a table, making sure no information is truncated. #>
# ANSWER
Get-NetFirewallRule -Enabled true | Format-Table -wrap

<# Display a list of the enabled firewall rules. Display only the rules’ display names, the profiles they belong to, their directions, and whether they allow or deny access. #>
get-netfirewallrule -Enabled True | Select-Object -property *
# ANSWER
Get-NetFireWallRule -Enabled True | Select-Object DisplayName, Profile, direction, action | Format-List

<# Sort the list in alphabetical order first by profile and then by display name, with the results displaying in a separate table for each profile. #>
get-help sort-object -showwindow
get-help group-object -ShowWindow
Get-NetFirewallRule -Enabled True | Select-Object DisplayName, Profile, Direction, Action | Sort-Object -Property @{Expression = "Profile"; Descending = $true}, @{Expression = "DisplayName"; Descending = $true}
#ANSWER
Get-NetFirewallRule -Enabled True | Select-Object DisplayName, Profile, Direction, Action | Sort-Object -Property Profile, DisplayName | Format-Table -GroupBy Profile

<# TASK 5 #>
<# Using a keyword such as neighbor, find a command that can display the network neighbors. #>
Get-Command *neighbor*
# ANSWER
Get-NetNeighbor

<# Review the help for the command #>
# ANSWER
Get-Help Get-NetNeighbor -online

<# Display a list of network neighbors #>
# ANSWER
Get-NetNeighbor

<# Display a list of the network neighbors that's sorted by state. #>
# ANSWER
Get-NetNeighbor | Sort-Object -Property State 

<# Display a list of the network neighbors that's grouped by state, displaying only the IP address in as compact a format as possible and letting Windows PowerShell decide how to optimize the layout. #>
Get-NetNeighbor | Sort-Object -Property State | Select-Object -Property IPAddress, State
# ANSWER
Get-NetNeighbor | Sort-Object -Property State | Select-Object -Property IPAddress, State | Format-Wide -GroupBy State -AutoSize

<# Test your network connection to both LON-DC1 and LON-SVR1 so that you know the Domain Name System (DNS) client cache is populated with data. #>
# ANSWER
ping LON-DC1
ping LON-SVR1
get-command -verb Test
# ANSWER
Test-NetConnection -ComputerName LON-DC1.adatum.com
Test-NetConnection -ComputerName LON-SVR1.adatum.com

<# Using a keyword such as cache, find a command that can display items from the DNS client cache. #>
get-command *cache*
# Answer
Get-DnsClientCache

<# Display the DNS client cache. #>
# Answer
Get-DnsClientCache

<# Display the DNS client cache. Sort the list by record name, and display only the record name, record type, and Time to Live. Use only one column to display all the data. #>
Get-DnsClientCache | Get-Member
Get-DnsClientCache | Select-Object *
Get-DnsClientCache | Select-Object Name, Type, TimeToLive | Format-list -groupby name
Get-help format-wide -online
Get-DnsClientCache | Get-Member
# ANSWER
Get-DnsClientCache | Select-Object -property name, type, TimeToLive | Sort-Object -property name | Format-wide -Column 1

<# Exercise 2 #>
<# Task 1: Display a list of all the users in the Users container of Active Directory #>
<# Using a keyword such as user, find a command that can list Active Directory users. #>
Get-Command *aduser*
# ANSWER
Get-ADUser

<# Review the help for the command and identify any mandatory parameters. #>
# ANSWER
Get-Help Get-ADUser -showwindow

<# Display a list of all the users in Active Directory in a format that lets you easily compare properties. #>
Get-ADUser -Filter * | Get-Member
Get-ADUser -FIlter * | Format-List
Get-ADUser -Filter * | Format-Table
Get-ADUser -Filter * | Format-Wide -column 5
# ANSWER
Get-ADUser -Filter * | Format-Table

<# Display the same list of all the users in the same format. This time, however, display only those users in the Users container of Active Directory. Use a search base of "cn=Users,dc=adatum,dc=com" for this task. #>
Get-ADUser -Filter * -SearchBase "cn=Users, dc=adatum, dc=com" | Format-Table

<# TASK 2 #>
<# Display only the total number of Security event log entries that have the event ID 4624. #>

