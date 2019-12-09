. $PSScriptRoot\SolarizedColors.ps1

$PersonalPromptScriptBlock =  {
    $origDollarQuestion = $Global:?
    $origLastExitCode = $Global:LASTEXITCODE

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
    $prompt += Set-Newline

    if($origDollarQuestion){
        $prompt += Write-Prompt "❯" -ForegroundColor DarkCyan
    } else {
        $prompt += Write-Prompt "❯" -ForegroundColor Red
    }

    $global:LASTEXITCODE = $origLastExitCode
    $prompt
}

Import-Module posh-git
Import-Module ZLocation

Set-Item Function:\prompt -Value $PersonalPromptScriptBlock

$Host.UI.RawUI.WindowTitle = (Get-Date).ToString()
