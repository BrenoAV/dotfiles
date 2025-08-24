#
# ~/.bashrc
#

if [[ ! -e ~/.api_keys ]]; then
    touch ~/.api_keys
fi

if [[ ! -e ~/.bash_aliases ]]; then
    touch ~/.bash_aliases
fi

if [ -f ~/.api_keys ]; then
    . ~/.api_keys
fi

if [ -f ~/.bash_aliases ];
 then
    . ~/.bash_aliases
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# CUDA START
export PATH=$PATH:/usr/local/cuda-12.8/bin
export LD_LIBRARY_PATH=/usr/local/cuda-12.8/lib64
# CUDA END

# Install from 'curl -sS https://starship.rs/install.sh | sh'
eval "$(starship init bash)"

. "$HOME/.local/bin/env"

# PYENV
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"

# Function
ytlist() {
    if [ -z "$1" ]; then
        echo "Usage: ytlist <playlist_url>"
        return 1
    fi

    yt-dlp --flat-playlist \
           --print "- [ ] %(playlist_index)s. [%(title)s](%(url)s)" \
           "$1"
}
