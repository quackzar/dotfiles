# PATH
set -gx PATH "$HOME/.cargo/bin" $PATH
set -gx PATH "$HOME/.dotnet/tools" $PATH

set -gx GOPATH "$HOME/.go"
set -gx GOBIN "$GOPATH/bin"
set -gx PATH "$GOBIN" $PATH

set -gx PATH "$HOME/.yarn/bin" $PATH
set -gx PATH "$HOME/.local/bin" $PATH


set -gx XDG_CONFIG_HOME "$HOME/.config"

function fish_greeting
    printf "Welcome to fish, %s! You are running %s powered by %s\n" $USER (uname) (uname -m)
end

set -gx PAGER "less -R"
set -gx LESS "-R"

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

if type -q 'bat'
    set -gx BAT_PAGER "less -R"
    set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
    set -U FZF_PREVIEW_FILE_CMD 'bat --color=always {}'
end

if type -q 'exa'
    alias ls 'exa'
    set -U FZF_PREVIEW_DIR_CMD "exa"
end

if type -q 'erdtree'
    alias tree "erdtree"
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


switch (uname)
    case Darwin
        set SDKROOT (xcrun --sdk macosx --show-sdk-path)
        # set -gx PATH '/opt/homebrew/opt/llvm/bin/' $PATH
        # Toggle the macOS menubar from on to auto.
        alias menubar '~/Scripts/toggle_menubar.scpt'
        alias file-clipbaord '~/Scripts/file-clipboard.scpt'
        # set -gx PYTHONPATH "/usr/local/lib/python3.9/site-packages" $PYTHONPATH

        # set -gx LDFLAGS "-L/usr/local/opt/python@3.10/lib"
        # set -gx PKG_CONFIG_PATH "/usr/local/opt/python@3.10/lib/pkgconfig"

        # set -g PATH '/opt/homebrew/opt/llvm/bin' $PATH
        set -g C_INCLUDE_PATH "/opt/homebrew/include" $C_INCLUDE_PATH
        set -g CPLUS_INCLUDE_PATH "/opt/homebrew/include" $CPLUS_INCLUDE_PATH
        set -g ANDROID_HOME ~/Library/Android/sdk
        set -g ANDROID_SDK_ROOT ~/Library/Android/sdk
        set -g PATH $ANDROID_HOME/tools $PATH
        set -g PATH $ANDROID_HOME/platform-tools $PATH
        set -g PATH $HOME/.wasmedge/bin $PATH

        # set -x SSH_AUTH_SOCK /Users/mikkel/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh

    case Linux
        alias pbcopy 'xclip -selection clipboard'
        alias pbpaste 'xclip -selection clipboard -o'
        set -gx JAVA_HOME '/usr/lib/jvm/default'
        alias open 'xdg-open 2>/dev/null'
        alias xdg-open 'xdg-open 2>/dev/null'
        alias mon2cam 'deno run --unstable -A -r -q https://raw.githubusercontent.com/ShayBox/Mon2Cam/master/src/mod.ts'
end


if test $TERM = 'xterm-kitty'
    alias d 'kitty +kitten diff'
    alias icat 'kitty +kitten icat'
    alias ssh 'kitty +kitten ssh'
    # Change kitty's opacity, range {x | 0 <= x <= 1 }
    alias opacity 'kitty @ set-background-opacity -a'
    # alias pbcopy 'kitty +kitten clipboard'
    # alias pbpaste 'kitty +kitten clipboard --get-clipboard'
end

set -gx NEOVIDE_MULTIGRID

set -gx RIPGREP_CONFIG_PATH "$XDG_CONFIG_HOME/ripgrep/ripgreprc"

set fzf_fd_opts --hidden --exclude=.git

set -gx PASSWORD_STORE_ENABLE_EXTENSIONS "true"

set -U __done_min_cmd_duration 8000

bind \cy accept-autosuggestion
bind \cj forward-bigword
bind \e\[106\;5u forward-bigword

if type -q zoxide
    zoxide init fish | source
end

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# if type -q starship
#     starship init fish | source
# end

# set -g VIRTUALFISH_PLUGINS "auto_activation compat_aliases"

if type -q kubecolor && type -q kubectl
    function kubectl
        kubecolor $argv
    end
end
 
set -gx HOMEBREW_NO_INSECURE_REDIRECT 1
set -gx HOMEBREW_CASK_OPTS --require-sha

source "$HOME/.config/fish/monokai.fish"
