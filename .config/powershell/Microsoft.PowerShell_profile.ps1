. $PSScriptRoot\SolarizedColors.ps1

function prompt {
    $origLastExitCode = $LastExitCode
    $prompt = " "
    
    $curPath = $ExecutionContext.SessionState.Path.CurrentLocation.Path
    if ($curPath.ToLower().StartsWith($Home.ToLower()))
    {
        $curPath = "~" + $curPath.SubString($Home.Length)
    }

    $gitStatus = Get-GitStatus

    if($gitStatus){
        $gitDirBase = Split-Path (Split-Path (Get-GitDirectory) -Parent) -Leaf
        $gitInfo = Get-VcsInfo -status($gitStatus)
        
        $prompt += Write-Prompt $curPath.Substring($curPath.IndexOf($gitDirBase)) -ForegroundColor DarkCyan
        $prompt += Write-Prompt " on " -ForegroundColor White
        $prompt += Write-Prompt $gitInfo.VcInfo -ForegroundColor $gitInfo.BackgroundColor
    } else {
        $prompt += Write-Prompt (($curPath -split '/' | select -last 3) -join '/') -ForegroundColor DarkCyan
    }

    $prompt += Write-Prompt "$(if ($PsDebugContext) {' [DBG]: '} else {''})" -ForegroundColor Magenta
    $prompt += "`n$('❯' * ($nestedPromptLevel + 1)) "

    $LastExitCode = $origLastExitCode
    $prompt
}

Import-Module posh-git
Import-Module ZLocation

$Host.UI.RawUI.WindowTitle = (Get-Date).ToString()
