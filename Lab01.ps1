<# LAB 01 #>
<# Task 1 #> 
# What command would you run to resolve a DNS name?
get-command *dns*
#ANSWER
Resolve-DnsName

<# What command would you run to make changes to a network adapter? After finding such a command, what parameter would you use to change its Media Access Control (MAC) address (on adapters that support changes to their MAC address)? #>
get-command *network*
get-command -noun networkadapter
get-command *adapter*
# ANSWER
Set-NetAdapter

get-help set-netadapter -showwindow
Set-NetAdapter -MacAddress aabbccddeeff -Whatif


# What command would let you enable a previously disabled scheduled task?
get-command *scheduled*
# ANSWER
Enable-ScheduledTask

# What command would let you block access to a file share by a particular user?
get-command *block*
get-help block-fileshareaccess -ShowWindow
# ANSWER
get-help block-smbshareaccess -ShowWindow

# What command would you run to clear your computer's local BranchCache cache?
get-command *branchcache*
get-command -verb clear
get-help clear-bccache -ShowWindow
# ANSWER
Clear-BCCache -WhatIf

<# What command would you run to display a list of Windows Firewall rules? What parameter of that command would display only enabled rules? #>
get-command -noun firewall
Get-Command *firewall*
get-help get-netfirewallfule -ShowWindow



