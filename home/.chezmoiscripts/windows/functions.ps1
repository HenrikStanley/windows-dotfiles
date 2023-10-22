function Install-WingetPackages {
    [CmdletBinding()]
    param (
        [hashtable]$PackageList
    )
    
    begin {
        if (!(Get-Command "winget" -ErrorAction SilentlyContinue)) {
            Write-Error -Exception "winget is not installed or available"
        }       
    }
    
    process {
        foreach ($Package in $PackageList.GetEnumerator() )
        {
          Write-Output "Installing / Upgrading $($Package.Name)"
          winget install --id $($Package.Value)
        } 
    }
}

function Install-NerdFonts {
    [CmdletBinding()]
    param (
        [hashtable]$FontList
    )
    
    begin {
        # Get all installed fonts
        [void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
        $FontFamilyList = (New-Object System.Drawing.Text.InstalledFontCollection).Families

        # Set base upstream URL
        $NerdFontsReleaseURL = "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/"

        # Setup .NET webclient for file downloads
        $webClient = New-Object System.Net.WebClient
    }
    
    process {
        foreach ($Font in $FontList.GetEnumerator() )
        {
          Write-Output "Looking for Font: $($Font.Name)"
            if ($FontFamilyList -contains $($Font.Value)) {
                Write-Output "$($Font.Name) already installed. Skipping..."
            }
            
            else {
                Write-Output "$($Font.Name) not found. Installing..."

                $ZipFile = "$($Font.Name)" + ".zip"
                $URL = "$NerdFontsReleaseURL" + $ZipFile
                $CurrentPath = pwd

                $webClient.DownloadFile($URL, "$CurrentPath\$($ZipFile)")

                Expand-Archive -Path ".\$($ZipFile)" -DestinationPath ".\$($Font.Name)" -Force
                $destination = (New-Object -ComObject Shell.Application).Namespace(0x14)

                # Install only TrueType Font
                $fonts = Get-ChildItem -Path ".\$($Font.Name)" -Recurse -Filter "*.ttf"
                foreach ($font in $fonts) {
                    $destination.CopyHere($font.FullName, 0x10)
                }

                Remove-Item -Path ".\$($Font.Name)" -Recurse -Force
                Remove-Item -Path ".\$ZipFile" -Force
            }
        }
    } 
}