# PATH
set -gx PATH "$HOME/.cargo/bin" $PATH
set -gx PATH "$HOME/.dotnet/tools" $PATH

set -gx GOPATH "$HOME/go"
set -gx GOBIN "$GOPATH/bin"
set -gx PATH "$GOBIN" $PATH

set -gx PATH "$HOME/.local/bin" $PATH


set -gx XDG_CONFIG_HOME "$HOME/.config"

function fish_greeting
    printf "Welcome to fish, %s! You are running %s powered by %s" $USER (uname) (uname -m)
end

set -gx PAGER "less -R"
set -gx LESS "-R"
set -gx BAT_PAGER "less -R"
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"

set -gx LC_ALL "en_US.UTF-8"
set -gx LANG "en_US.UTF-8"


alias python 'python3'
alias pip 'pip3'

if type -q 'nvim'
    set -gx EDITOR "nvim"
    alias vim 'nvim'
    alias vi 'nvim'
    alias vimdiff 'nvim -d'
end

if type -q 'exa'
    alias ls 'exa'
end
if type -q 'colormake'
    alias make 'colormake'
end

if type -q 'gsed'
    alias sed 'gsed'
end

if type -q 'yabai'
    # Turn yabai's statusbar on or off
    alias statusbar 'yabai -m config status_bar'

    # Turn yabai's border on or off
    alias border 'yabai -m config window_border'
end

alias d 'kitty +kitten diff'
alias icat 'kitty +kitten icat'

# Change kitty's opacity, range {x | 0 <= x <= 1 }
alias opacity 'kitty @ set-background-opacity -a'

switch (uname)
    case Darwin
        set SDKROOT (xcrun --sdk macosx --show-sdk-path)
        set -gx PATH '/opt/homebrew/opt/llvm/bin/' $PATH
        alias x86brew 'arch -x86_64 /usr/local/bin/brew'
        # Toggle the macOS menubar from on to auto.
        alias menubar '~/Scripts/toggle_menubar.scpt'
        alias file-clipbaord '~/Scripts/file-clipboard.scpt'
    case Linux
        alias pbcopy 'xclip -selection clipboard'
        alias pbpaste 'xclip -selection clipboard -o'
        set -gx JAVA_HOME '/usr/lib/jvm/default'
        alias open 'xdg-open 2>/dev/null'
        alias xdg-open 'xdg-open 2>/dev/null'
        alias mon2cam 'deno run --unstable -A -r -q https://raw.githubusercontent.com/ShayBox/Mon2Cam/master/src/mod.ts'
end

set -gx RIPGREP_CONFIG_PATH "$XDG_CONFIG_HOME/ripgrep/ripgreprc"


set -U FZF_PREVIEW_FILE_CMD 'bat --color=always {}'
set -U FZF_FIND_FILE_COMMAND 'rg --files --no-messages'
set -U FZF_DEFAULT_OPTS '--reverse --height 40% --color=bg+:#293739,border:#808080,spinner:#E6DB74,hl:#7E8E91,fg:#F8F8F2,header:#7E8E91,info:#A6E22E,pointer:#A6E22E,marker:#F92672,fg+:#F8F8F2,prompt:#F92672,hl+:#F92672'

set -U FZF_PREVIEW_DIR_CMD "exa"
set -U FZF_ENABLE_OPEN_PREVIEW 1
set -U FZF_ENABLE_FILE_PREVIEW 1
set -U FZF_ENABLE_DIR_PREVIEW 1
set -U FZF_LEGACY_KEYBINDINGS 1
set -U FZF_TMUX 0

set -gx PASSWORD_STORE_ENABLE_EXTENSIONS "true"

# Spacefish colors
set SPACEFISH_GIT_BRANCH_COLOR FF9700
set SPACEFISH_GIT_STATUS_COLOR FF9700

bind \cy forward-bigword

if type -q zoxide
    zoxide init fish | source
end

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
