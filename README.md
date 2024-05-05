# Dotfiles

# Install nerd font 

Download nerd font on the site: [https://www.nerdfonts.com/font-downloads](https://www.nerdfonts.com/font-downloads)

## Linux

1. Create the fonts folder:

`$ mkdir -p ~/.local/share/fonts/`

2. Download .ttf fonts and put in the fonts folder

`$ fc-cache -f -v`

# Neovim

## Software required on Linux and Windows

1. fd-find: [https://github.com/sharkdp/fd](https://github.com/sharkdp/fd)
2. ripgrep: [https://github.com/BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep)
3. pyenv:
    - Linux: [https://github.com/nvm-sh/nvm](https://github.com/pyenv/pyenv)
    - Windows: [https://github.com/pyenv-win/pyenv-win](https://github.com/pyenv-win/pyenv-win). Note: add on system path the global python installation
4. Node.js:
    - Linux: [https://github.com/nvm-sh/nvm](https://github.com/nvm-sh/nvm)
    - Windows: [https://nodejs.org/en/download/current](https://nodejs.org/en/download/current)
5. MinGw (x64) (Windows):
    - [https://sourceforge.net/projects/mingw-w64/files/Toolchains%20targetting%20Win64/Personal%20Builds/](https://sourceforge.net/projects/mingw-w64/files/Toolchains%20targetting%20Win64/Personal%20Builds/)
6. Lua:
    - Linux: `$ sudo apt install lua5.4`
    - Windows: [https://luabinaries.sourceforge.net/download.html](https://luabinaries.sourceforge.net/download.html)
7. Tree Sitter CLI: [https://github.com/tree-sitter/tree-sitter](https://github.com/tree-sitter/tree-sitter)
