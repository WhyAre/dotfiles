# Fancy prompt
if(Get-Command starship 2>$NUL){
    Invoke-Expression (&starship init powershell)
}

# Alias
Set-Alias l Get-ChildItem
if(Get-Command nvim 2>$NUL){
    Set-Alias v nvim

    $Env:EDITOR="nvim"
    $Env:VISUAL="nvim"
}
if(Get-Command git 2>$NUL){
    Set-Alias g git
}

## Choco
Function choco_ups { choco update -y @Args }
Function choco_ins { choco install -y @Args }
Function choco_unins { choco uninstall -y @Args }
if(Get-Command choco 2>$NUL){
    Set-Alias ins choco_ins
    Set-Alias unins choco_unins
    Set-Alias ups choco_ups
}

# Vi remappings:
# [Console]::ReadKey() to figure out the key that is being pressed.
# Please use a character literal or a well-known key name from the
# System.ConsoleKey enumeration.
# Can cross-ref with this:
# https://docs.microsoft.com/en-us/dotnet/api/system.consolekey?view=net-6.0
Set-PSReadLineOption -PredictionSource History  # Intellisense
Set-PSReadLineOption -editmode vi

# Bind ctrl [ to escape insert mode
Set-PSReadLineKeyHandler -Chord "Ctrl+Oem4" -Function ViCommandMode

# Intellisense
Set-PSReadLineKeyHandler -Chord "Alt+f" -Function ForwardWord
Set-PSReadLineKeyHandler -Chord "Ctrl+f" -Function AcceptSuggestion

# Emacs
Set-PSReadLineKeyHandler -Chord "Ctrl+a" -Function BeginningOfLine
Set-PSReadLineKeyHandler -Chord "Ctrl+e" -Function EndOfLine
Set-PSReadLineKeyHandler -Chord "Ctrl+k" -Function KillLine
Set-PSReadLineKeyHandler -Chord "Ctrl+w" -Function UnixWordRubout
Set-PSReadLineKeyHandler -Chord "Ctrl+u" -Function BackwardKillLine

Import-Module posh-git
