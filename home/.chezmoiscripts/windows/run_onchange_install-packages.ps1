# Source helper functions
. .\functions.ps1

# Source configs
. .\configurations.ps1

# Install packages
Install-WingetPackages -PackageList $DevTools
Install-WingetPackages -PackageList $CloudTools
Install-WingetPackages -PackageList $HomeApps

# Refresh system path with newly installed tools
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# Install fonts
Install-NerdFonts -FontList $Fonts