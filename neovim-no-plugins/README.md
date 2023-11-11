# How to install

## neovim

```console
$ mkdir -p ~/.config/nvim/
$ cp init.vim ~/.config/nvim/init.vim
```

## vim

```console
$ cp init.vim $HOME/.vimrc
```

# Colorscheme

```console
$ mkdir -p ~/.config/nvim/colors
$ git clone https://github.com/morhetz/gruvbox.git
$ ln -sv $HOME/gruvbox/colors/gruvbox.vim $HOME/.config/nvim/colors/gruvbox.vim
```
