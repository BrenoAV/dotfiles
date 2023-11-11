if (has("nvim"))
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
endif
call plug#end()


if has('termguicolors')
  set termguicolors
endif



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Global Variables
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on
set clipboard^=unnamed,unnamedplus
set number
set tabstop=4 " show existing tab with 4 spaces width
set softtabstop=4 " show existing tab with 4 spaces width
set shiftwidth=4 " when identing with '>', use 4 spaces width
set expandtab " on pressing tab, insert 4 spaces
set smarttab " insert tabs on the start of a line according to shiftwidth
set smartindent " automatically inserts one extra level of indentation in some cases
set hidden " Hides the current buffer when a new file is openned
set incsearch " incremental search
set ignorecase " ignore case in search
set smartcase " considere case if there is a upper case character
set scrolloff=8 " minimum number of lines to keep above and below the cursor
set colorcolumn=79 " draws a line at the given line to keep aware of the line size
set signcolumn=yes " add a column on the left. Useful for linting
set cmdheight=2 " give more space for displaying messages
set updatetime=100 " time in miliseconds to consider the changes
set encoding=utf-8 " the enconding should be utf-8 to activate the font icons
set nobackup " no backup files
set nowritebackup " no backup files
set splitright " create the vertical splits to the right
set splitbelow " create the horizontal splits below
set autoread " update vim after file update from outside
set mouse=a
set relativenumber
set foldmethod=indent
filetype on " detect and set the filetype option and trigger the FileType Event
filetype plugin on " Load the plugin file for the file type, if any
filetype indent on " Load the indent file the file type, if any
let maplocalleader = ","



if has('nvim')
    let g:python3_host_prog = '/usr/bin/python3'
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving around, tabs, windows and buffers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Create Splits
nmap th :split<CR>
nmap tv :vsplit<CR>

" Split
nmap th :split<CR>
nmap tv :vsplit<CR>

" Create a tab
nmap tn :tabe<CR>

" Navigating between tabs
nmap <C-l> :tabn<CR>
nmap <C-h> :tabp<CR>

" navigate between Buffers
nmap ty :bn<CR>
nmap tr :bp<CR>

" Close the current buffer
nmap td :bd<CR>

" delete a buffer without losing the split window
nnoremap <C-x> :bp\|bd #<CR>

" Close all buffers but this one
noremap <leader>bd :%bd\|e#\|bd#<cr>\|'"

" Move lines up and down
nnoremap <M-Down> :m .+1<CR>==
nnoremap <M-Up> :m .-2<CR>==
inoremap <M-Down> <Esc>:m .+1<CR>==gi
inoremap <M-Up> <Esc>:m .-2<CR>==gi
vnoremap <M-Down> :m '>+1<CR>gv=gv
vnoremap <M-Up> :m '<-2<CR>gv=gv

" Exec scripts
nnoremap tp :!python %<cr>


" AUTOCMD
function! HighlightWordUnderCursor()
    if getline(".")[col(".")-1] !~# '[[:punct:][:blank:]]'
        exec 'match' 'Search' '/\V\<'.expand('<cword>').'\>/'
    else
        match none
    endif
endfunction

autocmd! CursorHold,CursorHoldI * call HighlightWordUnderCursor()

augroup markdownSpell
    autocmd!
    autocmd FileType markdown setlocal spell spelllang=en_us
    autocmd BufRead,BufNewFile *.md setlocal spell
augroup END


autocmd FileType markdown setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd BufRead,BufNewFile *.htm,*.html,*.css setlocal tabstop=2 shiftwidth=2 softtabstop=2



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tagbar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Finding Files
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Search down into subfolders
" Provides tab-completation for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File Browsing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Tweaks for Browsing
let g:netrw_banner = 0 "disable annoying banner
let g:netrw_browse_split = 4 " open in prior window
let g:netrw_altv=1 " open splits to the right
let g:netrw_liststyle=3 " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\*'


" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in a h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Sessions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Shortcuts to execute session saves and restore
let g:session_dir = '~/vim-sessions'
exec 'nnoremap <Leader>ss :mks! ' . g:session_dir . '/*.vim<C-D><BS><BS><BS><BS><BS>'
exec 'nnoremap <Leader>sr :so ' . g:session_dir. '/*.vim<C-D><BS><BS><BS><BS><BS>'

