
#===============================
$domain   = "ad.fau.edu"
$username = "..."
$password = "..."
#===============================

# Convert the username and password to a network credential.
$passwordSecure = $password | ConvertTo-SecureString -asPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential($username, $passwordSecure)

# Move the computer into the specified domain.
Add-Computer -DomainName $domain -Credential $credential -Force

# Delete the batch file wrapper
Remove-Item -LiteralPath "$env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\runDomainScript.bat" -Force

# Delete this script file.
Remove-Item -LiteralPath $Myinvocation.MyCommand.Path -Force

# Restart the computer.
Restart-Computer
