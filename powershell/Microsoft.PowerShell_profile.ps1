Import-Module posh-git
Import-Module ZLocation

# Load custom scripts
$script:PandellDevelopmentDir = 'C:\Users\amaechler\Development\Pandell\'

. $PSScriptRoot\git_scripts.ps1
. $PSScriptRoot\link_global.ps1
. $PSScriptRoot\aliases_dev.ps1
