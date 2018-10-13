" Be Improved!
set nocompatible
filetype off

" Plug Configuration
call plug#begin("~/.local/share/nvim/plugged")
Plug 'morhetz/gruvbox'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': './install.sh'
    \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'
Plug 'andreyorst/SimpleSnippets.vim'
call plug#end()

" My Favorites
set number
set ruler
set splitright
set showmatch
set hlsearch
set incsearch
syntax on
set pastetoggle=<F2>
set nobackup
set noswapfile

" Useful Maps
let mapleader=','
nnoremap ; :
map <leader>z <C-w><C-w>
nmap <silent> <leader>/ :nohlsearch<CR>
nmap <leader>s :setlocal spell! spell?<CR>
nmap <leader>wa :wqa<CR>
nmap <leader>ww :w<CR>
nmap <leader>qa :qa<CR>
nmap <leader>qq :bd<CR>

" Tab Settings
set shiftround
set expandtab
set tabstop=4
set shiftwidth=4

" Code Block Movement
vnoremap < <gv
vnoremap > >gv

" Colorscheme
set background=dark
colorscheme gruvbox

" Deoplete w/ SuperTab
let g:deoplete#enable_at_startup = 1
let g:SuperTabMappingForward = '<s-tab>'
let g:SuperTabMappingBackward = '<tab>'

" LCS Configurations
let g:LanguageClient_serverCommands = {
    \ 'haskell': ['hie-wrapper'],
    \ 'python': ['pyls']
    \ }

" SimpleSnippets
let g:SimpleSnippetsExpandOrJumpTrigger = "<leader>n"
let g:SimpleSnippetsJumpBackwardTrigger = "<leader>p"
let g:SimpleSnippets_split_horizontal = 1
let g:SimpleSnippets_search_path = "/ihome/sam/bmooreii/.config/nvim/snippets/"
