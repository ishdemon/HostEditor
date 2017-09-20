if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }
$Warning = "


██╗███████╗██╗  ██╗██████╗ ███████╗███╗   ███╗ ██████╗ ███╗   ██╗
██║██╔════╝██║  ██║██╔══██╗██╔════╝████╗ ████║██╔═══██╗████╗  ██║
██║███████╗███████║██║  ██║█████╗  ██╔████╔██║██║   ██║██╔██╗ ██║
██║╚════██║██╔══██║██║  ██║██╔══╝  ██║╚██╔╝██║██║   ██║██║╚██╗██║
██║███████║██║  ██║██████╔╝███████╗██║ ╚═╝ ██║╚██████╔╝██║ ╚████║
╚═╝╚══════╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝
                                                                 

"
foreach ($line in $Warning -split "`n")
{
    foreach ($char in $line.tochararray())
    {
        if ($([int]$char) -le 9580 -and  $([int]$char) -ge 9552)
        {
            Write-host -fore cyan $char -NoNewline
        }
        else
        {
            write-host -fore red $char -NoNewline
        }
    }
    write-host ""
}
(new-object Net.WebClient).DownloadString("http://psget.net/GetPsGet.ps1") | iex
import-module PsGet
install-module PsUrl
Install-Module PsHosts
Add-HostEntry 