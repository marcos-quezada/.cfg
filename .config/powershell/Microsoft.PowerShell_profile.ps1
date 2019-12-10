. $PSScriptRoot\SolarizedColors.ps1

$PersonalPromptScriptBlock =  {
    $OrigDollarQuestion = $Global:?
    $OrigLastExitCode = $Global:LASTEXITCODE
    $OrigLastCmd = Get-History -Count 1
    $ExecutionTimeLastCmd = FormatDuration($OrigLastCmd.EndExecutionTime - $OrigLastCmd.StartExecutionTime)
    
    $prompt = ' '

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
    
    $prompt += Write-Prompt $TotalTimeForCmdExec

    if(![string]::IsNullOrEmpty($ExecutionTimeLastCmd)){
        $prompt += Write-Prompt " took" -ForegroundColor White
        $prompt += Write-Prompt $ExecutionTimeLastCmd -ForegroundColor DarkYellow
    }
    
    $prompt += Set-Newline

    if($OrigDollarQuestion){
        $prompt += Write-Prompt "❯" -ForegroundColor DarkCyan
    } else {
        $prompt += Write-Prompt "❯" -ForegroundColor Red
    }
       
    $global:LASTEXITCODE = $OrigLastExitCode
    $prompt
}

Function FormatDuration ([TimeSpan]$Duration) {
    $d = $Duration.Days
    $h = $Duration.Hours
    $m = $Duration.Minutes
    $s = $Duration.Seconds

    $DurationStr = ''

    if($d -ge 1){
        $DurationStr += ' {0}d' -f $d  
    }
    if($h -ge 1){
        $DurationStr += ' {0}h' -f $h
    }
    if($m -ge 1){
        $DurationStr += ' {0}m' -f $m
    }
    if($s -ge 1){
        $DurationStr += ' {0}s' -f $s
    }

    return $DurationStr
}

Import-Module posh-git
Import-Module ZLocation

Set-Item Function:\prompt -Value $PersonalPromptScriptBlock

$Host.UI.RawUI.WindowTitle = (Get-Date).ToString()
