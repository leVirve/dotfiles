New-Item -ItemType SymbolicLink -Value (Get-Item "pwsh_profile.ps1").FullName -Force -Path ~\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
New-Item -ItemType SymbolicLink -Value (Get-Item "pwsh_profile.ps1").FullName -Force -Path ~\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
