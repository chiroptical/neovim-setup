" Be Improved!
set nocompatible
filetype off

" Plug Configuration
call plug#begin("~/.local/share/nvim/plugged")
Plug 'neovimhaskell/haskell-vim'
Plug 'pbrisbin/vim-syntax-shakespeare'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf'
Plug 'andys8/vim-elm-syntax'
Plug 'purescript-contrib/purescript-vim'
Plug 'sainnhe/gruvbox-material'
Plug 'unisonweb/unison', { 'rtp': 'editor-support/vim', 'branch': 'trunk' }
Plug 'djoshea/vim-autoread'
Plug 'LnL7/vim-nix'
Plug 'mileszs/ack.vim'
Plug 'alx741/yesod.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'steelsojka/completion-buffers'
Plug '5outh/yesod-routes.vim'
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
set clipboard+=unnamedplus

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
set tabstop=2
set shiftwidth=2

" Code Block Movement
vnoremap < <gv
vnoremap > >gv

" Colorscheme
set background=dark
let g:gruvbox_material_background = 'soft'
colorscheme gruvbox-material
syntax on
filetype plugin indent on

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" haskell-vim
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

" vim-commentary
map <leader>gc <Plug>Commentary

" fzf
nmap <leader>f :FZF <cr>

" unison
set autoread

" Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
nmap <leader>aa :Ack! ""
nmap <leader>ah :Ack! --haskell "<C-R><C-W>"
nmap <leader>at :Ack! --ts "<C-R><C-W>"

if (has("nvim-0.5.0"))
:luafile $HOME/.config/nvim/lsp.lua
endif

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

let g:completion_chain_complete_list = [
    \{'complete_items': ['lsp', 'snippet', 'path', 'buffers']},
    \{'mode': '<c-p>'},
    \{'mode': '<c-n>'}
\]

" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()
