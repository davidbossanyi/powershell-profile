# powershell-profile
Configuration for my powershell prompt

### Prerequisites
 - [chocolatey](https://chocolatey.org/)
 - [Windows Terminal](https://github.com/microsoft/terminal)
 - [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/about)

### Instructions

1. Install Caskaydia Cove nerd font
    ```powershell
    choco install -y cascadia-code-nerd-font
    ```
2. Ensure the font is recognised as true-type
    ```powershell
    $key = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Console\TrueTypeFont'
    Set-ItemProperty -Path $key -Name '000' -Value 'CaskaydiaCove Nerd Font'
    ```
3. Set the powershell font in Windows Terminal `settings.json`
    ```json
    {
      "profiles": {
        "defaults": {
          "font": {
            "face": "CaskaydiaCove Nerd Font",
            "weight": "normal"
          }
        }
      }
    }
    ```
4. Install [starship](https://starship.rs/)
   ```powershell
   choco install -y starship
   ```
5. Install [Terminal-Icons](https://docs.microsoft.com/en-us/windows/terminal/tutorials/custom-prompt-setup#use-terminal-icons-to-add-missing-folder-or-file-icons) and [PSReadLine](https://github.com/PowerShell/PSReadLine)
   ```powershell
   Install-Module Terminal-Icons -Scope CurrentUser
   Install-Module PSReadLine -Force
   ```
6. Copy the contents of [`myProfile.ps1`](https://github.com/davidbossanyi/powershell-profile/blob/main/myProfile.ps1) to the local PowerShell profile file.
