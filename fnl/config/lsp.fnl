(fn intercalate [separator sequential-table]
  (accumulate [acc "" _ to-append (ipairs sequential-table)]
    (.. acc to-append)))

;; LSP on-attach function
(fn on-attach [client buffer-handle]
  (let [buf-set-keymap (fn [...]
                         (vim.api.nvim_buf_set_keymap buffer-handle ...))
        buf-set-option (fn [...]
                         (vim.api.nvim_buf_set_option buffer-handle ...))
        options {:noremap true :silent true}]
    (buf-set-option :omnifunc "v:lua.vim.lsp.omnifunc")
    (buf-set-keymap :n :<leader>cd "<cmd>lua vim.lsp.buf.hover()<cr>" options)
    (buf-set-keymap :n :<leader>cq "<cmd>lua vim.lsp.buf.declaration()<cr>"
                    options)
    (buf-set-keymap :n :<leader>cw "<cmd>lua vim.lsp.buf.definition()<cr>"
                    options)
    (buf-set-keymap :n :<leader>ci "<cmd>lua vim.lsp.buf.implementation()<cr>"
                    options)
    (buf-set-keymap :n :<leader>cl "<cmd>lua vim.diagnostic.open_float()<cr>"
                    options)
    (buf-set-keymap :n :<leader>ca "<cmd>lua vim.lsp.buf.code_action()<cr>"
                    options)
    (buf-set-keymap :n :<leader>sk
                    "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>" options)
    (buf-set-keymap :n :<leader>sj
                    "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>" options)))

;; LSP servers using defaults
(let [servers [:purescriptls :elmls]
      nvim-lsp (require :lspconfig)]
  (each [_ lsp-field (ipairs servers)]
    (let [lsp (. nvim-lsp lsp-field)]
      (lsp.setup (coq.lsp_ensure_capabilities {:on_attach on-attach})))))

(fn lsp-with-cmd [server cmd settings]
  (let [nvim-lsp (require :lspconfig)]
    (each [_ lsp-field (ipairs [server])]
      (let [lsp (. nvim-lsp lsp-field)]
        (lsp.setup (coq.lsp_ensure_capabilities {:on_attach on-attach
                                                 : cmd
                                                 : settings}))))))

(lsp-with-cmd :rust_analyzer [:/usr/bin/rust-analyzer]
              {:rust-analyzer {:checkOnSave {:command :clippy}}})

(lsp-with-cmd :tsserver [:/home/barry/.npm-packages/bin/vscode-eslint-language-server
                         :--stdio] {})

(lsp-with-cmd :cssls [:/home/barry/.npm-packages/bin/vscode-css-language-server
                      :--stdio] {})

(let [use-halfsp (os.getenv :USE_HALFSP)]
  (if use-halfsp
      (lsp-with-cmd :hls [:halfsp] {:haskell {:formattingProvider :fourmolu}})
      (lsp-with-cmd :hls [:haskell-language-server-wrapper :--lsp]
                    {:haskell {:formattingProvider :fourmolu
                               :plugin {:ghcide-completions {:config {:autoExtendOn false}}}}})))

(let [telescope (require :telescope)]
  (telescope.load_extension :fzy_native))
