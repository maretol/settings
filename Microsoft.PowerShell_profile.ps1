$username = Get-Content env:username
Set-Location "C:\Users\$username\Documents"
Set-PSReadlineOption -BellStyle None
Set-Alias open "Invoke-Item"
Set-Alias less more
Set-Alias utf8 Change-Encoding-utf
Set-Alias sjis Change-Encoding-shiftjis
Set-Alias sudo Elevate-Process

function Change-Encoding-utf
{
    chcp 65001;
}

function Change-Encoding-shiftjis
{
    chcp 932;
}

function Elevate-Process
{
    $file, [string]$arguments = $args;
    $psi = New-Object System.Diagnostics.ProcessStartInfo $file;
    $psi.Arguments = $arguments;
    $psi.Verb = "runas";
    $psi.WorkingDirectory = Get-Location;
    [System.Diagnostics.Process]::Start($psi);
}
# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
