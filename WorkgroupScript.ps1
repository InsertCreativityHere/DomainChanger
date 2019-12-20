
#===============================
$workgroup = "TEMP"
$username  = "..."
$password  = "..."
#===============================

# Convert the username and password to a network credential
$passwordSecure = $password | ConvertTo-SecureString -asPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential($username, $passwordSecure)

# Move the computer into the specified workgroup
Add-Computer -WorkgroupName $workgroup -Credential $credential -Force

# Restart the computer.
Restart-Computer
