. ~\.config\powershell\profile.ps1

# Bind ctrl [ to escape insert mode
Set-PSReadLineKeyHandler -Chord "Ctrl+Oem4" -Function ViCommandMode

# Intellisense
Set-PSReadLineOption -PredictionSource History  # Intellisense
Set-PSReadLineKeyHandler -Chord "Alt+f" -Function ForwardWord
Set-PSReadLineKeyHandler -Chord "Ctrl+f" -Function AcceptSuggestion

