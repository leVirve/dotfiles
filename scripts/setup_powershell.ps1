$customProfile = (Get-Item "pwsh_profile.ps1").FullName
$userProfilePath = ~\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
$systemProfilePath = ~\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
New-Item -ItemType SymbolicLink -Value $customProfile -Force -Path $userProfilePath
New-Item -ItemType SymbolicLink -Value $customProfile -Force -Path $systemProfilePath
