# function to activate a poetry virtualenv
function Activate-Poetry {
	. "$(poetry env info --path)\Scripts\activate.ps1"
}

# setup Starship prompt
Invoke-Expression (& starship init powershell)

Import-Module Terminal-Icons
Import-Module PSReadLine

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -HistoryNoDuplicates:$True

# pipe some useful linux commands through WSL
$commands = "awk", "grep", "sed", "ssh"

$commands | ForEach-Object { Invoke-Expression @"
function global:$_() {
    for (`$i = 0; `$i -lt `$args.Count; `$i++) {
        if (Split-Path `$args[`$i] -IsAbsolute -ErrorAction Ignore) {
            `$args[`$i] = Format-WslArgument (wsl.exe wslpath (`$args[`$i] -replace "\\", "/"))
        } elseif (Test-Path `$args[`$i] -ErrorAction Ignore) {
            `$args[`$i] = Format-WslArgument (`$args[`$i] -replace "\\", "/")
        }
    }
    if (`$input.MoveNext()) {
        `$input.Reset()
        `$input | wsl.exe $_ (`$args -split ' ')
    } else {
        wsl.exe $_ (`$args -split ' ')
    }
}
"@
}
