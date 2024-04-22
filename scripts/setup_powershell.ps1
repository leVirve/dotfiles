Write-Host "Please ensure to run the following command to set the execution policy to RemoteSigned:" -ForegroundColor Green
Write-Host "Set-ExecutionPolicy RemoteSigned"

Write-Host "Install packages..."
winget install --id Starship.Starship

Write-Host "Prepare profile..."
if (Test-Path -Path $PROFILE) {
    $overwrite = Read-Host "A profile file already exists. Do you want to overwrite it? (yes/no)"
    if ($overwrite -eq "yes") {
        Copy-Item -Path .\pwsh_profile.ps1 -Destination $PROFILE -Force
        Write-Host "Profile file overwritten successfully." -ForegroundColor Green
    } else {
        Write-Host "Profile file was not overwritten." -ForegroundColor Yellow
    }
} else {
    Copy-Item -Path .\pwsh_profile.ps1 -Destination $PROFILE
    Write-Host "Profile file copied to $PROFILE." -ForegroundColor Green
}
