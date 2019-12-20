. $PSScriptRoot\pwsh_colors.ps1
. $PSScriptRoot\pwsh_funcs.ps1

Import-Module posh-git
Import-Module ZLocation

Set-Item Function:\prompt -Value $PersonalPromptScriptBlock
