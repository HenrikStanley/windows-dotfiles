# Check modules and install if not present
if (Get-Module -ListAvailable -Name PSFzf) {
    Import-Module -Name PSFzf
} 
else {
    Install-Module PSFzf -Scope CurrentUser
    Import-Module -Name PSFzf
}

if (Get-Module -ListAvailable -Name AWS-Utils) {
    Import-Module -Name AWS-Utils
} 
else {
    Install-Module AWS-Utils -Scope CurrentUser
    Import-Module -Name AWS-Utils
}

# Set FZF as the default PSReadline provider and reverse history.
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
Set-PSReadLineOption -PredictionSource History

# Load starship as shell prompt
Invoke-Expression (&starship init powershell)

# Load Zoxide and change default command to trigger from z to j
Invoke-Expression (& {
    (zoxide init --hook pwd powershell --cmd j --no-aliases) -join "`n"
    })

New-Alias j __zoxide_zi -Force

# Overwrite ls alias to use eza
# Remove-Alias -Name ls
Set-Alias -Name ls -Value Get-ChildItemEza
Set-Alias -Name l -Value Get-ChildItemEza

function Get-ChildItemEza {
    eza --long --header --all --icons --hyperlink --sort type --git --group
}

function Open-AWSConsole {
        $URL = aws configure get sso_start_url
        $Region = aws configure get region
        $RoleName = aws configure get sso_role_name
        $AccountID = aws configure get sso_account_id

        $Token = aws-sso-util console get-config-token -u $URL
        aws-sso-util console launch-from-config -t $Token -a $AccountID --role-name $RoleName
    
}