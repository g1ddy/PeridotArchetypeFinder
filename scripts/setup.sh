#!/bin/bash
set -e

echo "Starting setup for PeridotArchetypeFinder..."

# Update package lists
echo "Updating package lists..."
sudo apt-get update

# Install dependencies
echo "Installing prerequisites..."
sudo apt-get install -y wget apt-transport-https software-properties-common lsb-release

# Download and install Microsoft repo GPG keys if not already present
if [ ! -f /etc/apt/sources.list.d/microsoft-prod.list ]; then
    echo "Configuring Microsoft repository..."
    wget -q "https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb"
    sudo dpkg -i packages-microsoft-prod.deb
    rm packages-microsoft-prod.deb
    sudo apt-get update
else
    echo "Microsoft repository already configured."
fi

# Install PowerShell
echo "Installing PowerShell..."
sudo apt-get install -y powershell

# Install PowerShell modules
echo "Installing PowerShell modules..."
# Using sudo pwsh to install modules in AllUsers scope
sudo pwsh -Command "
    \$modules = @('FormatMarkdownTable', 'Pester')
    Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
    foreach (\$module in \$modules) {
        if (Get-Module -ListAvailable -Name \$module) {
            Write-Host \"Module '\$module' is already installed.\"
        } else {
            Write-Host \"Installing module '\$module'...\"
            Install-Module -Name \$module -Force -Scope AllUsers
        }
    }
"

echo "Setup complete. You can now run tests with 'Invoke-Pester'."
