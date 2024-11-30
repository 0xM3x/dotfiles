## setting the history file location and size
HISTFILE=~/.cache/zsh/histfile
HISTSIZE=10000
SAVEHIST=1000

## "bat" as manpager
export MANPAGER="bat"

## path
export PATH=/home/m3x/.local/bin:$PATH

## setting other enviroment variables
if [ -z "$XDG_CONFIG_HOME" ] ; then
    export XDG_CONFIG_HOME="$HOME/.config"
fi
if [ -z "$XDG_DATA_HOME" ] ; then
    export XDG_DATA_HOME="$HOME/.local/share"
fi
if [ -z "$XDG_CACHE_HOME" ] ; then
    export XDG_CACHE_HOME="$HOME/.cache"
fi

## auto running startx when login
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	startx
fi


