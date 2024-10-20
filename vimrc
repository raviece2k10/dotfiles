"# Path: ~/.vimrc
"# Purpose: vim config file
"# Updated on: 21-10-2024

" # Interface Settings:
set number              " Show line numbers
"set relativenumber      " Show relative line numbers from the cursor
set cursorline          " Highlight the current line
set showmatch           " Highlight matching parentheses

" # Indentation and Tabs:
set expandtab           " Convert tabs to spaces
set shiftwidth=4        " Indentation level
set tabstop=4           " Number of spaces in a tab
set autoindent          " Auto-indent new lines
set smartindent         " Automatically indent based on code structure

" # Search Settings:
set incsearch           " Highlight matches as you type the search
set ignorecase          " Case-insensitive search
set smartcase           " Case-sensitive if uppercase letters are used
set hlsearch            " Highlight search matches

" # Mapping Leader Key:
let mapleader = ","     " Set comma as the leader key

" # Plugin Manager Config (vim-plug)
call plug#begin('~/.vim/plugged')

" List of plugins
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } 

call plug#end()

" Plugins settings
let g:nerdtree_tabs_open_on_console_startup=1

" # Custom Keymaps
" Toggle nerd file tree with Leader+n
nnoremap <leader>o :NERDTreeToggle<CR>
" Open fuzzy file search with Leader+f
nnoremap <leader>f :FZF ~<CR>
