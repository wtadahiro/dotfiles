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
alias gpg='gpg2'
alias vst='vagrant status'
alias vup='vagrant up'
alias vhl='vagrant halt'
alias vrl='vagrant reload'
alias vsh='vagrant ssh'
alias perltidy-all="git diff origin/master... --name-only --diff-filter=AMCRTU | perl -wnle '/\.(pl|pm|t|psgi)$/ and print' | xargs perltidy -b -bext='/'"
alias la="ls -la"


if [ -e ~/.alias.sh ]; then
  source ~/.alias.sh
fi
export GPG_TTY=${TTY}

# start gpg-agent daemon
if [ `which gpg-agent` ]; then
  killall gpg-agent
  gpg-agent --daemon --use-standard-socket
fi

# direnv
if [ `which direnv` ]; then
  eval "$(direnv hook zsh)"
fi

# brew-cask
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# history
HISTFILE=$HOME/.zhistory
HISTSIZE=100000
SAVEHIST=100000
setopt share_history
