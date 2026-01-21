#!/bin/bash
set -e

echo "Starting setup for PeridotArchetypeFinder..."

# Check if running as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root or use sudo."
  exit 1
fi

# Update package lists
echo "Updating package lists..."
apt-get update

# Install dependencies
echo "Installing prerequisites..."
apt-get install -y wget apt-transport-https software-properties-common lsb-release

# Download and install Microsoft repo GPG keys if not already present
if [ ! -f /etc/apt/sources.list.d/microsoft-prod.list ]; then
    echo "Configuring Microsoft repository..."
    wget -q "https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb"
    dpkg -i packages-microsoft-prod.deb
    rm packages-microsoft-prod.deb
    apt-get update
else
    echo "Microsoft repository already configured."
fi

# Install PowerShell
echo "Installing PowerShell..."
apt-get install -y powershell

# Install PowerShell modules
echo "Installing PowerShell modules..."
pwsh -Command "
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
