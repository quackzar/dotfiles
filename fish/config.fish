set -gx PATH "/Library/Frameworks/Python.framework/Versions/3.6/bin" $PATH
set -gx PATH "/Users/mikkelmadsen/Library/Python/3.6/bin" $PATH
set -gx PATH "/usr/local/bin" $PATH
set -gx PATH "/usr/local/texlive/2019basic/bin/x86_64-darwin" $PATH
set -gx PATH "$HOME/.opam/default/bin" $PATH
set -gx PATH "$HOME/.gem/ruby/2.3.0/bin" $PATH
set -gx PATH "$HOME/.gem/ruby/2.6.0/bin" $PATH
set -gx PATH "$HOME/.cargo/bin" $PATH
set -gx PATH "$HOME/Library/Python/3.7/bin" $PATH
set -gx PATH "$HOME/.ghcup/bin" $PATH

set -gx GOPATH "$HOME/go"
set -gx GOBIN "$GOPATH/bin"
set -gx PATH "$GOBIN" $PATH

set -gx RIPGREP_CONFIG_PATH "$XDG_CONFIG_HOME/ripgrep/ripgreprc"

# set -gx MANPATH "/usr/local/texlive/2019basic/texmf-dist/doc/man" $MANPATH

set -gx EDITOR "nvim"

set -gx LC_ALL "en_US.UTF-8"
set -gx LANG "en_US.UTF-8"

alias python 'python3'
alias pip 'pip3'
alias xdg-open 'open'
alias vim 'nvim'
alias vi 'nvim'
alias vimdiff 'nvim -d'
alias skim 'open /Applications/Skim.app'
alias sed 'gsed'

alias ls 'exa'

alias d 'kitty +kitten diff'
alias icat 'kitty +kitten icat'

# Change kitty's opacity, range {0,1}
alias opacity 'kitty @ set-background-opacity -a'

# Turn yabai's statusbar on or off
alias statusbar 'yabai -m config status_bar'

# Turn yabai's border on or off
alias border 'yabai -m config window_border'

# Toggle the macOS menubar from on to auto.
alias menubar 'osascript ~/Scripts/toggle_menubar.scpt'


set -x XDG_CONFIG_HOME '/Users/mikkelmadsen/.config'

set -U FZF_PREVIEW_FILE_CMD 'bat --color=always {}'
set -U FZF_FIND_FILE_COMMAND 'rg --files'
# set -U FZF_DEFAULT_OPTS ' --color fg:252,hl:67,fg+:252,bg+:235,hl+:81,info:144,prompt:161,spinner:135,pointer:135,marker:118'
set -U FZF_DEFAULT_OPTS '--color=bg+:#293739,bg:#1B1D1E,border:#808080,spinner:#E6DB74,hl:#7E8E91,fg:#F8F8F2,header:#7E8E91,info:#A6E22E,pointer:#A6E22E,marker:#F92672,fg+:#F8F8F2,prompt:#F92672,hl+:#F92672'

set -U FZF_PREVIEW_DIR_CMD "ls"
set -U FZF_ENABLE_OPEN_PREVIEW 1
set -U FZF_ENABLE_FILE_PREVIEW 1
set -U FZF_ENABLE_DIR_PREVIEW 1
set -U FZF_LEGACY_KEYBINDINGS 1
set -U FZF_TMUX 1

set -x LESS -R

# Spacefish colors
set SPACEFISH_GIT_BRANCH_COLOR FF9700
set SPACEFISH_GIT_STATUS_COLOR FF9700


bind \cy forward-bigword
test -r /Users/mikkelmadsen/.opam/opam-init/init.fish && . /Users/mikkelmadsen/.opam/opam-init/init.fish > /dev/null 2> /dev/null || true

zoxide init fish | source
