set -gx PATH "$HOME/.opam/default/bin" $PATH
set -gx PATH "$HOME/.gem/ruby/2.3.0/bin" $PATH
set -gx PATH "$HOME/.gem/ruby/2.6.0/bin" $PATH
set -gx PATH "$HOME/.cargo/bin" $PATH
set -gx PATH "$HOME/.ghcup/bin" $PATH
set -gx PATH "$HOME/.dotnet/tools" $PATH

set -gx GOPATH "$HOME/go"
set -gx GOBIN "$GOPATH/bin"
set -gx PATH "$GOBIN" $PATH

alias x86brew 'arch -x86_64 /usr/local/bin/brew'

set -gx PAGER "less -R"
set -gx LESS "-R"
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

alias d 'kitty +kitten diff'
alias icat 'kitty +kitten icat'

function edit_cmd --description 'Edit cmdline in editor'
        set -l f (mktemp --tmpdir=.)
        set -l p (commandline -C)
        commandline -b > $f
        vim -c set\ ft=fish $f
        commandline -r (more $f)
        commandline -C $p
        rm $f
end

bind \cx\ce edit_cmd


# Change kitty's opacity, range {x | 0 <= x <= 1 }
alias opacity 'kitty @ set-background-opacity -a'

switch (uname)
    case Darwin
        set -gx PATH "/usr/local/texlive/2019basic/bin/x86_64-darwin" $PATH
        # Turn yabai's statusbar on or off
        alias statusbar 'yabai -m config status_bar'
        alias sed 'gsed'

        # Turn yabai's border on or off
        alias border 'yabai -m config window_border'

        # Toggle the macOS menubar from on to auto.
        alias menubar '~/Scripts/toggle_menubar.scpt'
        alias file-clipbaord '~/Scripts/file-clipboard.scpt'

        alias skim 'open /Applications/Skim.app'
        set -gx PATH "$HOME/.local/bin" $PATH
    case Linux
        set -gx PATH "$HOME/.local/bin" $PATH
        alias pbcopy 'xclip -selection clipboard'
        alias pbpaste 'xclip -selection clipboard -o'
        set -gx JAVA_HOME '/usr/lib/jvm/default'
        alias open 'xdg-open 2>/dev/null'
        alias xdg-open 'xdg-open 2>/dev/null'
        alias mon2cam 'deno run --unstable -A -r -q https://raw.githubusercontent.com/ShayBox/Mon2Cam/master/src/mod.ts'
end

set -gx XDG_CONFIG_HOME "$HOME/.config"
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

set -x LESS '-R'

# Spacefish colors
set SPACEFISH_GIT_BRANCH_COLOR FF9700
set SPACEFISH_GIT_STATUS_COLOR FF9700


bind \cy forward-bigword
test -r $HOME/.opam/opam-init/init.fish && . $HOME/.opam/opam-init/init.fish > /dev/null 2> /dev/null || true

if type -q zoxide
	zoxide init fish | source
end

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

