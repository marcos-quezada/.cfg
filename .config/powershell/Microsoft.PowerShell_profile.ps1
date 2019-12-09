function prompt {
    $origLastExitCode = $LastExitCode
    
    $curPath = $ExecutionContext.SessionState.Path.CurrentLocation.Path
    if ($curPath.ToLower().StartsWith($Home.ToLower()))
    {
        $curPath = "~" + $curPath.SubString($Home.Length)
    }

    $gitStatus = Get-GitStatus

    if(!$gitStatus){
        $curPath =  ( $curPath -split '/' | select -last 3) -join '/'
    } else {
        $curPath = (Split-Path (Get-Location) -Leaf)
    }

    $prompt = " "
    $prompt += Write-Host $curPath -NoNewline -ForegroundColor Blue
    $prompt += Write-VcsStatus
    $prompt += Write-Prompt "$(if ($PsDebugContext) {' [DBG]: '} else {''})" -ForegroundColor Magenta
    $prompt += "`n$('❯ ' * ($nestedPromptLevel + 1)) "

    $LastExitCode = $origLastExitCode
    $prompt
}

Import-Module posh-git
$Host.UI.RawUI.WindowTitle = (Get-Date).ToString()

. (Join-Path -Path (Split-Path -Parent -Path $PROFILE) -ChildPath 'SolarizedColors.ps1')
