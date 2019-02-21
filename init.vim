" Be Improved!
set nocompatible
filetype off

" Plug Configuration
call plug#begin("~/.local/share/nvim/plugged")
Plug 'morhetz/gruvbox'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'junegunn/fzf.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'
Plug 'lervag/vimtex'
Plug 'scrooloose/nerdtree'
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

" vim-lsp
if executable('hie-wrapper')
    au user lsp_setup call lsp#register_server({
        \ 'name': 'hie-wrapper',
        \ 'cmd': {server_info->['hie-wrapper']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'stack.yaml'))},
        \ 'whitelist': ['haskell'],
        \ })
endif
if executable('pyls')
    au user lsp_setup call lsp#register_server({
    \ 'name': 'pyls',
    \ 'cmd': {server_info->['pyls']},
    \ 'whitelist': ['python'],
    \ })
endif
set completeopt+=preview
let g:asyncomplete_smart_completion = 1
let g:asyncomplete_auto_popup = 1
let g:lsp_diagnostics_enabled = 1
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand('~/vim-lsp.log')

let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-pdf',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ]
    \}

" NERDTree
autocmd vimenter * NERDTree | wincmd p
nmap <leader>nt :NERDTreeToggle<CR>
nmap <leader>nf :NERDTreeFind<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" FZF
nmap <leader>ff :Files<CR>
nmap <leader>fb :BLines<CR>
