if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

set -o vi

export LC_ALL=en_US.UTF-8
export PATH=/home/nils/work/oma-cms/venv/bin:/usr/libexec/python3-sphinx:/usr/lib64/qt-3.3/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/home/nils/.local/bin:/home/nils/bin:/home/nils/.fzf/bin/:/home/nils/bin:/home/nils/.fzf/bin/:/usr/pgsql-10/bin
export PATH=$PATH:~/-/DataGrip-2018.3.1/bin

if command -v rg >/dev/null && command -v fzf >/dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
fi

if [ -d $HOME/.pyenv ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"

  if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
  fi

  export PATH="$PYENV_ROOT/plugins/pyenv-virtualenv/bin:$PATH"
  eval "$(pyenv virtualenv-init -)"
fi

# Aliases
if command -v nvim >/dev/null; then
  alias vim=nvim
fi

alias dcps="docker-compose ps"

function dps() {
  if command -v docker-pretty-ps>/dev/null; then
    cmd="docker-pretty-ps"
  else
    cmd="docker ps"
  fi

  eval "$cmd"
}

function mcd() {
  mkdir $1 && cd $1;
}
