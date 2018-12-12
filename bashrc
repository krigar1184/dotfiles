export LC_ALL=en_US.UTF-8
set -o vi
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'

function mcd() {
    mkdir $1 && cd $1;
}
