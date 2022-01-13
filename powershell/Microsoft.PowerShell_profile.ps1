# https://github.com/vors/ZLocation
# https://github.com/vors/ZLocation/issues/78#issuecomment-969987874
# Import-Module ZLocation

# https://github.com/PowerShell/PSReadLine
if ((Get-Module PSReadLine).Version -ge "2.1.0") {
    Set-PSReadLineOption -PredictionSource History # Enable "predictive intellisense" - https://devblogs.microsoft.com/powershell/announcing-psreadline-2-1-with-predictive-intellisense/
    Set-PSReadLineKeyHandler -Chord "Ctrl+>" -Function ForwardWord
    Set-PSReadLineKeyHandler -Chord "Ctrl+<" -Function BackwardWord
}

# https://github.com/dahlbyk/posh-git
Import-Module posh-git
Invoke-Expression (oh-my-posh --init `
        --shell pwsh `
        --config ~\Development\Personal\dotfiles\oh-my-posh-amaechler.omp.json)

# https://github.com/devblackops/Terminal-Icons
Import-Module -Name Terminal-Icons

# scoop auto-completion
Import-Module "$HOME\scoop\apps\scoop\current\supporting\completion\Scoop-Completion.psd1" `
    -ErrorAction SilentlyContinue

# Load custom scripts
$script:PandellDevelopmentDir = "$HOME\Development\Pandell\"

. $PSScriptRoot\git_scripts.ps1
. $PSScriptRoot\link_global.ps1
. $PSScriptRoot\aliases_dev.ps1
