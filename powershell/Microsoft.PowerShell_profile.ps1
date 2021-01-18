Import-Module ZLocation

if ((Get-Module PSReadLine).Version -ge "2.1.0") {
    Set-PSReadLineOption -PredictionSource History # Enable "predictive intellisense" - https://devblogs.microsoft.com/powershell/announcing-psreadline-2-1-with-predictive-intellisense/
    Set-PSReadLineKeyHandler -Chord "Ctrl+>" -Function ForwardWord
    Set-PSReadLineKeyHandler -Chord "Ctrl+<" -Function BackwardWord
    Set-PSReadLineOption -Colors @{ InlinePrediction = "`e[38;5;241m" }
}

Import-Module posh-git
Invoke-Expression (oh-my-posh --init `
        --shell pwsh `
        --config ~\Development\GitHub\_Personal\dotfiles\oh-my-posh-amaechler.omp.json)

# Load custom scripts
$script:PandellDevelopmentDir = "$HOME\Development\Pandell\"

. $PSScriptRoot\git_scripts.ps1
. $PSScriptRoot\link_global.ps1
. $PSScriptRoot\aliases_dev.ps1
