Import-Module posh-git
Import-Module ZLocation

# Load custom scripts
. $PSScriptRoot\git_scripts.ps1
. $PSScriptRoot\link_global.ps1
. $PSScriptRoot\aliases_dev.ps1

Set-Location C:\Users\andreasm\Development\Pandell