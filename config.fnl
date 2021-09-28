;; Be improved!
(vim.api.nvim_set_option "compatible" false)
(vim.api.nvim_set_option "filetype" "off")

;; Set up vim-plug
(local plug vim.fn.plug#)
(vim.call "plug#begin" "~/.local/share/nvim/plugged")
(plug "neovimhaskell/haskell-vim")
(plug "pbrisbin/vim-syntax-shakespeare")
(plug "andys8/vim-elm-syntax")
(plug "purescript-contrib/purescript-vim")
(plug "unisonweb/unison" {"rtp" "editor-support/vim"
                          "branch" "trunk"})
(plug "djoshea/vim-autoread")
(plug "LnL7/vim-nix")
(plug "alx741/yesod.vim")
(plug "neovim/nvim-lspconfig")
(plug "nvim-lua/completion-nvim")
(plug "steelsojka/completion-buffers")
(plug "5outh/yesod-routes.vim")
(plug "nvim-lua/popup.nvim")
(plug "nvim-lua/plenary.nvim")
(plug "nvim-telescope/telescope.nvim")
(plug "nvim-telescope/telescope-fzy-native.nvim")
(plug "b3nj5m1n/kommentary")
(plug "bakpakin/fennel.vim")
(plug "danilo-augusto/vim-afterglow")
(vim.call "plug#end")

;; Some documentation https://github.com/nanotee/nvim-lua-guide
;; Check this out for keybindings nvim_set_keymap
(set vim.opt.number true)
(set vim.opt.ruler true)
(set vim.opt.splitright true)
(set vim.opt.showmatch true)
(set vim.opt.hlsearch true)
(set vim.opt.incsearch true)
(set vim.opt.syntax "on")
(set vim.opt.pastetoggle "<F2>")
(set vim.opt.backup false)
(set vim.opt.writebackup false)
(set vim.opt.swapfile false)
(set vim.opt.clipboard "unnamedplus")

;; Useful maps
(vim.api.nvim_set_var "mapleader" ",")
(vim.api.nvim_set_keymap "n" ";" ":" {"noremap" true})
(vim.api.nvim_set_keymap "" "<leader>z" "<c-w><c-w>" {})
(vim.api.nvim_set_keymap "n" "<leader>l" ":nohlsearch<cr>" {"silent" true})
(vim.api.nvim_set_keymap "n" "<leader>s" ":setlocal spell! spell?<cr>" {})
(vim.api.nvim_set_keymap "n" "<leader>wa" ":wqa<cr>" {})
(vim.api.nvim_set_keymap "n" "<leader>ww" ":w<cr>" {})
(vim.api.nvim_set_keymap "n" "<leader>qa" ":qa<cr>" {})
(vim.api.nvim_set_keymap "n" "<leader>qq" ":bd<cr>" {})

;; Tab settings
(set vim.opt.shiftround true)
(set vim.opt.expandtab true)
(set vim.opt.tabstop 2)
(set vim.opt.shiftwidth 2)

;; Code block movements
(vim.api.nvim_set_keymap "v" "<" "<gv" {})
(vim.api.nvim_set_keymap "v" ">" ">gv" {})

;; Colorscheme and syntax options
(set vim.opt.background "light")
(vim.cmd "colorscheme afterglow")
(set vim.opt.syntax "on")
(vim.cmd "filetype plugin indent on")

;; Haskell vim setup
(vim.api.nvim_set_var "haskell_enable_quantification" 1)
(vim.api.nvim_set_var "haskell_enable_recursivedo" 1)
(vim.api.nvim_set_var "haskell_enable_arrowsyntax" 1)
(vim.api.nvim_set_var "haskell_enable_pattern_synonyms" 1)
(vim.api.nvim_set_var "haskell_enable_typeroles" 1)
(vim.api.nvim_set_var "haskell_enable_static_pointers" 1)
(vim.api.nvim_set_var "haskell_backpack" 1)

;; Unison requires this
(set vim.opt.autoread true)

;; Telescope
(vim.api.nvim_set_keymap "n" "<leader>fg" "<cmd>Telescope live_grep<cr>" {})
(vim.api.nvim_set_keymap "n" "<leader>ff" "<cmd>Telescope find_files<cr>" {})
(vim.api.nvim_set_keymap "n" "<leader>fs" "<cmd>Telescope grep_string<cr>" {})
(vim.api.nvim_set_keymap "n" "<leader>fb" "<cmd>Telescope buffers<cr>" {})
(vim.api.nvim_set_keymap "n" "<leader>fh" "<cmd>Telescope help_tags<cr>" {})

; (when (= 1 (vim.fn.has "nvim-0.5.0"))
;   (require "lsp"))

;; Use tab and s-tab to navigate through popup menu
;; TODO: these must be wrong? Or do nothing?
(vim.api.nvim_set_keymap
  "i"
  "<tab>"
  "pumvisible() ? \"\\<c-n>\" : \"\\<tab>\""
  {:noremap true :expr true})

(vim.api.nvim_set_keymap
  "i"
  "<s-tab>"
  "pumvisible() ? \"\\<c-p>\" : \"\\<s-tab>\""
  {:noremap true :expr true})

;; Set completeopt to have a better completion experience
(set vim.opt.completeopt "menuone,noinsert,noselect")

;; Avoid showing message extra message when using completion
(let 
  [shortmess (vim.api.nvim_get_option "shortmess")]
  (set vim.opt.shortmess (.. shortmess "c")))

(vim.api.nvim_set_var "completion_chain_complete_list" 
  [ { "complete_items" ["lsp" "snippet" "path" "buffers"] }
    { "mode" "<c-p>" }
    { "mode" "<c-n>" }
  ])

;; No autocommands api yet :(
;; See https://github.com/neovim/neovim/pull/14661
(vim.api.nvim_exec 
  "autocmd BufEnter * lua require'completion'.on_attach()"
  false)

;; Remove ex mode forever please
(vim.api.nvim_set_keymap "" "Q" "<nop>" {})
