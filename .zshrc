export EDITOR=vim

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# add ~/.composer/vendor/bin to PATH environment variables
if [ -e $HOME/.composer/vendor/bin/ ]; then
    export PATH="$PATH:$HOME/.composer/vendor/bin/"
fi

# aliases
alias vst='vagrant status'
alias vup='vagrant up'
alias vhl='vagrant halt'
alias vrl='vagrant reload'
alias vsh='vagrant ssh'
alias perltidy-all="git diff origin/master... --name-only --diff-filter=AMCRTU | perl -wnle '/\.(pl|pm|t|psgi)$/ and print' | xargs perltidy -b -bext='/'"
alias rm-swp="find ./ -name '*.swp' | xargs rm"


if [ -e ~/.alias.sh ]; then
  source ~/.alias.sh
fi
export GPG_TTY=${TTY}

# direnv
if [ `which direnv` ]; then
  eval "$(direnv hook zsh)"
fi


# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# history
HISTFILE=$HOME/.zhistory
HISTSIZE=100000
SAVEHIST=100000
setopt share_history



# OS dependent settings
case ${OSTYPE} in
  darwin*)
    # enable to key-repeat for vim plugin of JET BRAINS IDEs
    defaults write -g ApplePressAndHoldEnabled -bool false
    # brew-cask
    export HOMEBREW_CASK_OPTS="--appdir=/Applications"
    # android SDK
    export PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"
    # fastlane
    export PATH="$HOME/.fastlane/bin:$PATH"
    #autojump
    #sudo zsh /usr/local/Cellar/autojump/22.5.1/share/autojump/autojump.zsh
    alias j="autojump"
    if [ -f `brew --prefix`/etc/autojump ]; then
        . `brew --prefix`/etc/autojump
    fi
    ;;

esac

setopt nonomatch

