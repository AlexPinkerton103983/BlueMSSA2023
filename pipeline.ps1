Get-Service | Stop-Service -WhatIf

# ByVal
# We need to find out what get-service outputs
<# Use Get-Member -MemberType Properties to find out the type of object #>
Get-Service | Get-Member -MemberType Properties 
<# Look for type.  This is a servicecontroller.  We must find if stop-service accepts
ByValue from a servicecontroller #>

<# Use get-help -full to look for "Accept pipeline input" #>
get-help -full stop-service 
<# Shows that -name accepts ByValue, but it is a string, look for servicecontroller input #>

# ByPropertyName
<# This is what we want to run #>
Get-Service | Stop-Process -WhatIf

get-help -full get-ciminstance