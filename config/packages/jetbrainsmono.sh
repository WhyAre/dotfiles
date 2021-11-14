#!/bin/sh

$UPDATE_COMMAND
if [ "$OS" = "arch" ]; then
    $INSTALL_COMMAND ttf-jetbrains-mono
    exit 0
fi

jetbrains="$HOME/jetbrains"
wget https://download.jetbrains.com/fonts/JetBrainsMono-2.242.zip \
    -O "$jetbrains.zip"
unzip "$jetbrains.zip" -d $jetbrains
mkdir -p ~/.local/share/fonts
cp -r $jetbrains ~/.local/share/fonts
rm -rf "$jetbrains.zip" $jetbrains
fc-cache -f -v
