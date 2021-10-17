;; Set up vim-plug
(local plug vim.fn.plug#)
(vim.call "plug#begin" "~/.config/nvim/plug")
;; highlighting
(plug :neovimhaskell/haskell-vim)
(plug :pbrisbin/vim-syntax-shakespeare)
(plug :alx741/yesod.vim)
(plug :5outh/yesod-routes.vim)
(plug :bakpakin/fennel.vim)
(plug :andys8/vim-elm-syntax)
(plug :purescript-contrib/purescript-vim)
(plug :LnL7/vim-nix)

;; themes
(plug :danilo-augusto/vim-afterglow)

;; unison
(plug :unisonweb/unison {:rtp :editor-support/vim :branch :trunk})
(plug :djoshea/vim-autoread)

;; general utilities
(plug :ms-jpq/coq_nvim {:branch :coq})
(plug :b3nj5m1n/kommentary)
(plug :neovim/nvim-lspconfig)

;; telescope
(plug :nvim-lua/popup.nvim)
(plug :nvim-lua/plenary.nvim)
(plug :nvim-telescope/telescope.nvim)
(plug :nvim-telescope/telescope-fzy-native.nvim)

;; fennel utilities
(plug :svermeulen/vimpeccable)
(vim.call "plug#end")
