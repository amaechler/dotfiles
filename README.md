# Shared configuration files and projects

## Git

```sh
# macos
$ ln -s ~/Dropbox/dotfiles/git/gitconfig_macos .gitconfig

# windows
> mklink c:\Users\amaechler\.gitconfig "C:\Users\amaechler\Development\Personal\dotfiles\git\gitconfig_windows_amaechler"
> mklink c:\Users\andreasm\.gitconfig "C:\Users\andreasm\Development\Personal\dotfiles\git\gitconfig_windows_andreasm"

# old_windows, because standard remote home drive does not support sym links
> copy "C:\Users\amaechler\Development\Personal\dotfiles\git\gitconfig_windows" m:\.gitconfig
> mklink c:\Users\amaechler\.gitconfig "C:\Users\amaechler\Development\Personal\dotfiles\git\gitconfig_windows"

# wsl2
$ ln -s /mnt/c/Users/amaechler/Development/Personal/dotfiles/git/gitconfig_wsl2_amaechler ~/.gitconfig
```

## Bash

```sh
# macos
ln -s /Users/amaechler/Dropbox/dotfiles/bash/bash_profile ~/.bash_profile
ln -s /Users/amaechler/Dropbox/dotfiles/bash/bashrc ~/.bashrc
```

## PowerShell

```sh
# windows
mklink /J C:\Users\amaechler\Documents\WindowsPowerShell "C:\Users\amaechler\Development\Personal\dotfiles\powershell"
mklink /J C:\Users\andreasm\Documents\WindowsPowerShell "C:\Users\andreasm\Development\Personal\dotfiles\powershell"

# windows (powershell core)
mklink /J C:\Users\amaechler\Documents\PowerShell "C:\Users\amaechler\Development\Personal\dotfiles\powershell"
mklink /J C:\Users\andreasm\Documents\PowerShell "C:\Users\andreasm\Development\Personal\dotfiles\powershell"
```

## vim

```sh
# windows, elevated prompt
> mklink "C:\Users\amaechler\_vimrc" "C:\Users\amaechler\Development\Personal\dotfiles\vim\_vimrc"
```

## Windows Terminal

```sh
# windows
> mklink /J "C:\Users\amaechler\AppData\Local\Microsoft\Windows Terminal" "C:\Users\amaechler\Development\Personal\dotfiles\windows-terminal"
> mklink /J "C:\Users\andreasm\AppData\Local\Microsoft\Windows Terminal" "C:\Users\andreasm\Development\Personal\dotfiles\windows-terminal"
```
