# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
	PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# set vi mode for editing
set -o vi

export EDITOR=nvim

#aliases
alias ls="ls -Fx --color"
alias vim="nvim"

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

##### MCNP6.2 stuff
# export PATH
# PATH="/home/grant/RSICC/MCNP/MCNP6.2/MCNP_CODE/bin:$PATH"
# export DATAPATH
# DATAPATH="/home/grant/RSICC/MCNP/MCNP6.2/MCNP_DATA"
# export ISCDATA
# ISCDATA="/home/grant/RSICC/MCNP/MCNP6.2/MCNP_CODE/MCNP620/Utilities/ISC/data"
# ulimit -s unlimited

# TeXLive stuff
export PATH="/home/grant/progs/texlive/2022/bin/x86_64-linux:$PATH"
export INFOPATH="/home/grant/progs/texlive/2022/texmf-dist/doc/info:$INFOPATH"
export MANPATH="/home/grant/progs/texlive/2022/texmf-dist/doc/man:$MANPATH"

# zotero
export PATH="$PATH:$HOME/progs/Zotero_linux-x86_64"

# pip
export PIP_FORMAT=columns

export PS1='\[\033[01;32m\]\h \[\033[01;34m\]\W > \[\033[00m\]'

# curl SSL stuff (Not necessary in Fedora or Ubuntu)
#export CURL_CA_BUNDLE=/home/grant/certs/ca-bundle.crt

# julia
export PATH="/home/grant/julia/julia-1.7.1/bin:$PATH"

# QMK
export QMK_HOME="$HOME/qmk_firmware"

#nim
export PATH="$PATH:$HOME/.nimble/bin:$HOME/nim/nim-1.6.2/bin"

#rust
export PATH="$PATH:$HOME/.cargo/bin"
#cargo/rust
[ -f "/home/grant/.cargo" ] && source "$HOME/.cargo/env"


#go
export PATH="$HOME/progs/go/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

#java
export PATH="$HOME/progs/temurin/jdk-17.0.7+7/bin:$PATH"

#clojure
export PATH="$HOME/progs/clojure/bin/:$PATH"

#neovim
export PATH="$HOME/progs/nvim/bin/:$PATH"

# haskell
[ -f "/home/grant/.ghcup/env" ] && source "/home/grant/.ghcup/env" # ghcup-env
ulimit -s unlimited
# MCNP 6.3.0 environment variables
[ -f "/home/grant/.config/mcnp" ] && source "/home/grant/.config/mcnp/mcnp630.bash"
