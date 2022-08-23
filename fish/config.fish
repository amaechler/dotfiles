if status is-interactive
    # volta (node / npm manager) configuration
    export VOLTA_HOME="$HOME/.volta"
    export PATH="$VOLTA_HOME/bin:$PATH"

    # execute oh-my-posh prompt
    oh-my-posh init fish --config ~/Development/Personal/dotfiles/oh-my-posh/oh-my-posh-amaechler.omp.json | source

    # autojump
    [ -f $(brew --prefix)/share/autojump/autojump.fish ]; and source $(brew --prefix)/share/autojump/autojump.fish
end
