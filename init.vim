" Be Improved!
set nocompatible
filetype off

" Plug Configuration
call plug#begin("~/.local/share/nvim/plugged")
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'neovimhaskell/haskell-vim'
Plug 'pbrisbin/vim-syntax-shakespeare'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf'
Plug 'andys8/vim-elm-syntax'
Plug 'purescript-contrib/purescript-vim'
Plug 'sainnhe/gruvbox-material'
Plug 'unisonweb/unison', { 'rtp': 'editor-support/vim', 'branch': 'trunk' }
Plug 'djoshea/vim-autoread'
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

" coc.nvim
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <silent><expr> <c-space> coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use K to show documentation in preview window
nnoremap <silent> <leader>cd :call <SID>show_documentation()<CR>

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> <leader>cp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>cn <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for format selected region
nmap <silent> <leader>cf :call CocAction('format')<cr>

" Remap for do codeAction of current line
nmap <leader>ca <Plug>(coc-codeaction)

" Fix autofix problem of current line
nmap <leader>cq <Plug>(coc-fix-current)

" Restart coc
nmap <leader>cr :CocRestart<cr>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Using CocList
nmap <leader>ff :CocList list<cr>
nmap <leader>fb :CocList buffers<cr>
nmap <leader>fg :CocList grep<cr>
nmap <leader>fw :CocList words<cr>

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
