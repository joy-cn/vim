set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'https://github.com/scrooloose/nerdtree.git'
Plugin 'https://github.com/majutsushi/tagbar.git'
Plugin 'https://github.com/jistr/vim-nerdtree-tabs.git'
Plugin 'https://github.com/kien/ctrlp.vim.git'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this linesyntax enable                           " enable syntax highlighting
syntax on
set autoread                            " reload files when changed on disk, i.e. via 'git checkout'
set backspace=2                         " fix broken backspace in some setups
set autoindent
set cindent
set tabstop=4
set shiftwidth=4
set softtabstop=4                       " delete tab using one key stroke
set expandtab                           " expand tabs to sapces
set ignorecase                          " case-insensitive search
set incsearch                           " search as you type
set number                              " show line numbers
set showcmd
set nowrap
set nobackup
set autowrite

" set different tabsize for different filetypes
autocmd FileType c  set tabstop=8
autocmd Filetype c  set shiftwidth=8

autocmd FileType html set tabstop=2
autocmd FileType html set shiftwidth=2

" set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
if has('statusline')
        set laststatus=2                        " always show statusline

        set statusline=%<%f\                     " Filename
        set statusline+=%w%h%m%r                 " Options
        "set statusline+=%{fugitive#statusline()} " Git Hotness
        set statusline+=\ [%{&ff}/%Y]            " Filetype
        set statusline+=\ [%{getcwd()}]          " Current dir
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

set list                               " show trailing whitespace
set listchars=tab:▸\ ,trail:▫          " some font dosent't support these two symbol, use menlo 
"set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set ruler                               " show where you are
set wildmenu                            " show a navigable menu for tab completion
set wildmode=longest,list,full

set guifont=source\ code\ pro\ 12
set guioptions-=T                        " hide toolbar
"set guioptions-=m                       " hide menu
set background=dark
set t_Co=256
"set cc=80
colorscheme slate
"color solarized
hi MatchParen ctermbg=blue ctermfg=white " matching brace highlight color
"let NERDTreeDirArrows = 0               " fixed the garbled arrow
let g:nerdtree_tabs_open_on_console_startup=1 " turn on NERDTreeTabs
let g:tagbar_ctags_bin = 'ctags'        " set ctags bin path

" keyboard shortcuts
let mapleader = ','
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>t :TagbarToggle<CR>

"----------------setting for golang----------------
" tagbar setting
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }
