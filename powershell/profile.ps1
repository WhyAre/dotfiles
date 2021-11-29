# Fancy prompt
if(Get-Command starship 2>$NUL){
    Invoke-Expression (&starship init powershell)
}

# Alias
Set-Alias l Get-ChildItem
if(Get-Command nvim 2>$NUL){
    Set-Alias v nvim
}
if(Get-Command git 2>$NUL){
    Set-Alias g git
}

## Choco
Function choco_ins {choco install -y}
Function choco_unins {choco uninstall -y}
Function choco_ups($package) {choco update -y $package}
if(Get-Command choco 2>$NUL){
    Set-Alias ins choco_ins
    Set-Alias unins choco_unins
    Set-Alias ups choco_ups
}

# Rebindings
Set-PSReadLineOption -editmode emacs

Set-PSReadLineKeyHandler -Chord Ctrl+[ -Function ViCommandMode

