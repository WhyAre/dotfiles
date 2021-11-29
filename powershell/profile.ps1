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

# Vi remappings
Set-PSReadLineOption -editmode vi
Set-PSReadLineKeyHandler -Chord "Ctrl+[" -Function ViCommandMode
