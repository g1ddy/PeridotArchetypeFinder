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

# Download and install Microsoft repo GPG keys
echo "Configuring Microsoft repository..."
wget -q "https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb"
dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

# Update package lists again to include Microsoft repo
apt-get update

# Install PowerShell
echo "Installing PowerShell..."
apt-get install -y powershell

# Install PowerShell modules
echo "Installing PowerShell modules..."
pwsh -Command "Set-PSRepository -Name PSGallery -InstallationPolicy Trusted"
pwsh -Command "Install-Module -Name FormatMarkdownTable -Force -Scope AllUsers"
pwsh -Command "Install-Module -Name Pester -Force -Scope AllUsers"

echo "Setup complete. You can now run tests with 'Invoke-Pester'."
