#
# ~/.bashrc
#

if [ -f ~/.bash_aliases ];
 then
    . ~/.bash_aliases
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

. "$HOME/.local/bin/env"

# CUDA START
export PATH=$PATH:/usr/local/cuda-12.8/bin
export LD_LIBRARY_PATH=$PATH:/usr/local/cuda-12.8/lib64
# CUDA END

# FZF START
inv() {
    fzf -m --preview="cat {}" | xargs -I {} nvim "{}"
}
pdf() {
    fd -g "$1*.pdf" | fzf | xargs -I {} bash -c 'zathura "{}" & disown'
}
# FZF END

eval "$(fzf --bash)"

# Install from 'curl -sS https://starship.rs/install.sh | sh'
eval "$(starship init bash)"

ytlist() {
    if [ -z "$1" ]; then
        echo "Usage: ytlist <playlist_url>"
        return 1
    fi

    yt-dlp --flat-playlist \
           --print "- [ ] %(playlist_index)s. [%(title)s](%(url)s)" \
           "$1"
}
