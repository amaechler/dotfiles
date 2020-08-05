Import-Module posh-git
Import-Module ZLocation

# Load custom scripts
$script:PandellDevelopmentDir = 'C:\Users\andreasm\Development\Pandell\'

. $PSScriptRoot\git_scripts.ps1
. $PSScriptRoot\link_global.ps1
. $PSScriptRoot\aliases_dev.ps1

Set-Location $script:PandellDevelopmentDir