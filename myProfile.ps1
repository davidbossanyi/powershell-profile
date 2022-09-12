function Activate-Poetry {
	. "$(poetry env info --path)\Scripts\activate.ps1"
}

Invoke-Expression (& starship init powershell)

Import-Module Terminal-Icons
Import-Module PSReadLine

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -HistoryNoDuplicates:$True
