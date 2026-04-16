# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository purpose

Personal dotfiles repo. Config files live here and are symlinked into their expected locations on each machine (macOS, Windows, WSL2). There is no build, lint, or test step — changes take effect the next time the relevant shell/tool starts.

## Layout

Each top-level directory targets one tool. The README.md has the exact `ln`/`mklink` commands for installing each group on each OS; check it before suggesting a new location for a file.

- `git/` — multiple gitconfig variants per-OS and per-user (`gitconfig_macos`, `gitconfig_windows_amaechler`, `gitconfig_windows_andreasm`, `gitconfig_wsl2_amaechler`). `gitconfig` is the base/reference file. Keep platform-specific drift intentional; when changing shared aliases, consider applying to all variants.
- `zsh/zshrc` — primary interactive shell on macOS. Order matters: `compinit` before plugins, `zsh-syntax-highlighting` must be sourced last, `mise activate` and sdkman go at the very end.
- `bash/`, `fish/config.fish` — legacy/secondary shells. Don't assume they mirror zsh.
- `powershell/` — Windows profile loaded via `Microsoft.PowerShell_profile.ps1`, which dot-sources `git_scripts.ps1`, `link_global.ps1`, and `aliases_dev.ps1`. `link_global.ps1` is the PowerShell equivalent of bash's `yarn-bin` pattern — walks up from cwd to find `node_modules/.bin/<cmd>`.
- `oh-my-posh/oh-my-posh-amaechler.omp.json` — shared prompt theme consumed by zsh, fish, and pwsh configs.
- `vim/_vimrc`, `windows-terminal/settings.json` — Windows-only.
- `brew_programs_list.txt`, `scoop_export.txt` — inventory snapshots, not auto-applied.

## Working with this repo

- Hardcoded absolute paths (e.g. `/Users/amaechler/...`, `/opt/homebrew/...`, `~/Development/Personal/dotfiles/...`) are expected — these configs are user-specific, not portable templates. Don't try to parameterize them.
- When adding a new shell integration (completion, plugin init), match the placement rules above (especially in `zsh/zshrc`) rather than appending blindly.
- `bash/bash_profile` references paths (`~/Development/_Tools/git-prompt.sh`, dnvm) that may no longer exist on the current machine — treat it as a historical artifact unless the user is actively using bash.
- Git aliases in `git/gitconfig` are non-trivial (`lg`, `graph`, `branchm`, `publish`, `nevermind`, `ro`). Read them before suggesting new ones to avoid duplicates.
