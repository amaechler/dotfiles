# Shared configuration files and projects

## Git

```sh
# macos
$ ln -s ~/Dropbox/dotfiles/git/gitconfig_macos .gitconfig

# windows
> mklink c:\Users\andreasm\.gitconfig c:\Users\andreasm\Dropbox\dotfiles\git\gitconfig_windows

# old_windows, because standard remote home drive does not support sym links
> copy c:\Users\andreasm\Dropbox\dotfiles\git\gitconfig_windows m:\.gitconfig
> mklink c:\Users\andreasm\.gitconfig c:\Users\andreasm\Dropbox\dotfiles\git\gitconfig_windows
```

## Bash

```sh
# macos
ln -s /Users/amaechler/Dropbox/dotfiles/bash/bash_profile ~/.bash_profile
ln -s /Users/amaechler/Dropbox/dotfiles/bash/bashrc ~/.bashrc
```

## ConEmu

Simply import configuration file.

## PowerShell

```sh
# windows
mklink /J C:\Users\andreasm\Documents\WindowsPowerShell C:\Users\andreasm\Dropbox\dotfiles\WindowsPowerShell

# windows (powershell core)
mklink /J C:\Users\andreasm\Documents\WindowsPowerShell C:\Users\andreasm\Dropbox\dotfiles\WindowsPowerShell
```

## vim

```sh
# windows, elevated prompt
> mklink "C:\Users\andreasm\_vimrc" c:\Users\andreasm\Dropbox\dotfiles\vim\_vimrc
```

## VSCode user settings

```sh
# macos
$ ln -s ~/Dropbox/dotfiles/vscode_user/ ~/Library/Application\ Support/Code/User

# windows
> mklink /J C:\Users\andreasm\AppData\Roaming\Code\User C:\Users\andreasm\Dropbox\dotfiles\vscode_user
```

## Windows Terminal

```sh
# windows
> mklink /J "C:\Users\amaechler\AppData\Local\Microsoft\Windows Terminal" "C:\Users\amaechler\Development\GitHub\_Personal\dotfiles\windows-terminal"
```
