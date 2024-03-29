$DefaultMessageForegroundColor = "Green"
$PSProfileFolderPath = "$env:USERPROFILE\Documents\PSProfile"

# oh-my-posh init pwsh | Invoke-Expression
oh-my-posh init pwsh --config C:\Users\niehus\AppData\Local\Programs\oh-my-posh\themes\hotstick.minimal.omp.json | Invoke-Expression

Write-Host "Loading environment scripts..." -ForegroundColor $DefaultMessageForegroundColor
$items = Get-ChildItem -Path "$PSProfileFolderPath\*" -Include "Env*.ps1"
if($items -is [System.Array]) {
    foreach ($childItem in $items) {
        Write-Host "`tLoading Script: $($childItem.FullName)"
        . "$($childItem.FullName)"
    }
} else {
    if($null -ne $items) {
        Write-Host "`tLoading Script: $($items.FullName)"
        . "$($items.FullName)"
    }
}
Write-Host "Environment Scripts loaded." -ForegroundColor $DefaultMessageForegroundColor

Set-PSReadlineKeyHandler -Key Tab -Function Complete

function Open-UserProfile {
    code -n $PSProfileFolderPath\Microsoft.PowerShell_profile.ps1
}

function Get-Args
{
    Param(
        [string]$command
    )
    [management.automation.psparser]::Tokenize($command, [ref]$null)
}

function Show-GitStatus {
    Clear-Host
    git --no-pager status
    Write-Output "`n"
}

function Show-GitLog { 
    Clear-Host
    git --no-pager log --oneline --graph -n 20 --all --format=format:"%<(60,trunc)%s %Cgreen%<(40,ltrunc)%d%Creset" --date-order
    Write-Output "`n" 
}
Set-Alias -Name glog -Value Show-GitLog

function Open-ExplorerHere {
    explorer $(Get-Location)
}
Set-Alias -Name e -Value Open-ExplorerHere

function Open-GitBashHere { 
    start-process "C:\Program Files\Git\git-bash.exe" --cd=$(Get-Location)
}
Set-Alias -Name g -Value Open-GitBashHere 

function New-SymbolicLink {
    Param(
        # New file path
        [Parameter(Mandatory=$true)]
        [string]
        $symbolicLinkFile,
        # Existing file path
        [Parameter(Mandatory=$true)]
        [string]
        $existingFile
    )
    New-Item -ItemType SymbolicLink -Path $symbolicLinkFile -Target $existingFile;
}

function New-HardLink {
    Param(
        # New file path
        [Parameter(Mandatory=$true)]
        [string]
        $symbolicLinkFile,
        # Existing file path
        [Parameter(Mandatory=$true)]
        [string]
        $existingFile
    )
    New-Item -ItemType HardLink -Path $symbolicLinkFile -Target $existingFile;
}

function New-Junction {
    Param(
        # New file path
        [Parameter(Mandatory=$true)]
        [string]
        $symbolicLinkFile,
        # Existing file path
        [Parameter(Mandatory=$true)]
        [string]
        $existingFile
    )
    New-Item -ItemType Junction -Path $symbolicLinkFile -Target $existingFile;
}

function New-TempFolder {
    [CmdletBinding()]
    param (
        [Parameter()]
        [switch]
        $EnterFolder
    )
    $TempFolderPath = $env:TMP + "\" + $(New-Guid).Guid
    Write-Host "Creating new temp folder at $TempFolderPath"
    New-Item -ItemType Directory -Path $TempFolderPath

    if($EnterFolder) {
        explorer $TempFolderPath
    }

    return $TempFolderPath
}

function Show-PSHistory {
    code -n (Get-PSReadlineOption).HistorySavePath
}
