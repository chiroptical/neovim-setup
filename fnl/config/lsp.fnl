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
    (buf-set-keymap :n :<leader>ca "<cmd>lua vim.lsp.buf.code_action()<cr>"
                    options)
    (buf-set-keymap :n :<leader>cq "<cmd>lua vim.lsp.buf.declaration()<cr>"
                    options)
    (buf-set-keymap :n :<leader>cw "<cmd>lua vim.lsp.buf.definition()<cr>"
                    options)
    (buf-set-keymap :n :<leader>cd "<cmd>lua vim.lsp.buf.hover()<cr>" options)
    (buf-set-keymap :n :<leader>ci "<cmd>lua vim.lsp.buf.implementation()<cr>"
                    options)
    (buf-set-keymap :n :<leader>cs "<cmd>lua vim.lsp.buf.signature_help()<cr>"
                    options)
    (buf-set-keymap :n :<leader>ct "<cmd>lua vim.lsp.buf.type_definition()<cr>"
                    options)
    (buf-set-keymap :n :<leader>cr "<cmd>lua vim.lsp.buf.rename()<cr>" options)
    (buf-set-keymap :n :<leader>cg "<cmd>lua vim.lsp.buf.references()<cr>"
                    options)
    (buf-set-keymap :n :<leader>cf "<cmd>lua vim.lsp.buf.formatting()<cr>"
                    options)
    (buf-set-keymap :n :<leader>cl
                    "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>"
                    options)
    (buf-set-keymap :n :<leader>sk
                    "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>" options)
    (buf-set-keymap :n :<leader>sj
                    "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>" options)
    (buf-set-keymap :n :<leader>sq
                    "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>" options)
    (when client.resolved_capabilities.show_line_diagnostics
      (vim.api.nvim_exec (intercalate "\n"
                                      ["augroup lsp_document_show_line_diagnostics"
                                       "  autocmd!"
                                       "  autocmd CursorHold <buffer> lua vim.lsp.diagnostic.show_line_diagnostics()"
                                       "augroup END"])
                         false))))

;; LSP servers using defaults
(let [servers [:tsserver :purescriptls :rls]
      nvim-lsp (require :lspconfig)]
  (each [_ lsp-field (ipairs servers)]
    (let [lsp (. nvim-lsp lsp-field)]
      (lsp.setup (coq.lsp_ensure_capabilities {:on_attach on-attach})))))

(let [nvim-lsp (require :lspconfig)
      lsp (. nvim-lsp :hls)]
  (lsp.setup (coq.lsp_ensure_capabilities {:on_attach on-attach
                                           :cmd [:haskell-language-server-wrapper
                                                 :--lsp]
                                           :settings {:haskell {:formattingProvider :fourmolu
                                                                :plugin {:ghcide-completions {:config {:autoExtendOn false}}}}}})))

(let [telescope (require :telescope)]
  (telescope.load_extension :fzy_native))
