# Package bundles for installations
# Generic tools used for development
$DevTools = [ordered]@{ 
    "PowerShell7" = "Microsoft.PowerShell";
    "Git"         = "Git.Git";
    "GithubCLI"   = "GitHub.cli";
    "VSCode"      = "Microsoft.VisualStudioCode";
    "Neovim"      = "Neovim.Neovim";
    "Neovide"     = "Neovide.Neovide";
    "Starship"    = "Starship.Starship";
    "eza"         = "eza-community.eza";
    "Docker"      = "Docker.DockerDesktop";
    "WinTerminal" = "Microsoft.WindowsTerminal";
    "GSudo"       = "gerardog.gsudo";
    "PowerToys"   = "Microsoft.PowerToys";
    "Bitwarden"   = "Bitwarden.Bitwarden";
    "Lazygit"     = "JesseDuffield.lazygit";
    "Zoxide"      = "ajeetdsouza.zoxide";
    "Notepad++"   = "Notepad++.Notepad++";
    "Bat"         = "sharkdp.bat";
    "fzf"         = "junegunn.fzf";
    "7Zip"        = "7zip.7zip";
    "Delta"       = "dandavison.delta";
}

# Cloud / IaC specific tools to install
$CloudTools = [ordered]@{ 
    "Terraform"   = "Hashicorp.Terraform"; 
    "Pulumi"      = "Pulumi.Pulumi";
    "AWSCLI"      = "Amazon.AWSCLI";
    "AzureCLI"    = "Microsoft.AzureCLI";
}

# None developer / pricate applications
$HomeApps = [ordered]@{ 
    "OBS"         = "OBSProject.OBSStudio"; 
    "Firefox"     = "Mozilla.Firefox"
    "Greenshot"   = "Greenshot.Greenshot"
    "Chrome"      = "Google.Chrome"
    "Calibre"     = "calibre.calibre"
    "qBittorrent" = "qBittorrent.qBittorrent"
    "Steam"       = "Valve.Steam";
    "Spotify"     = "Spotify";
    "Discord"     = "Discord.Discord";
}

# Fonts to install
## First value is the name of the .zip file in the nerdfont release.
## Second value is the name of the font family when installed on the system
$Fonts = [ordered]@{ 
    "JetBrainsMono" = "JetBrainsMono NF";
    "CascadiaCode"  = "CaskaydiaCove NF";
    "FiraCode"      = "FiraCode NF";
}