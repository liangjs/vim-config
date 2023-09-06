-- setup diagnostic
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = true,
    underline = false,
    virtual_text = false,
    update_in_insert = true,
    show_diagnostic_autocmds = {'BufWritePost'},
    diagnostic_delay = 1000
  }
)

vim.diagnostic.config {
  severity_sort = true
}

vim.fn.sign_define("DiagnosticSignError", { text="", texthl="", linehl="", numhl="DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text="", texthl="", linehl="", numhl="DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text="", texthl="", linehl="", numhl="DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text="", texthl="", linehl="", numhl="DiagnosticSignHint" })

function _G.toggle_diagnostic_window()
  local is_open = vim.fn.getloclist(0, {winid = 0}).winid ~= 0
  if is_open then
    vim.api.nvim_command("lclose")
  else
    vim.diagnostic.setloclist()
  end
end

-- setup lsp servers
lspconfig = require("lspconfig")
lspconfig.pyright.setup{}
lspconfig.rust_analyzer.setup{}
lspconfig.clangd.setup{}

-- global mappings
vim.keymap.set('n', '<space>d', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<Leader>d', toggle_diagnostic_window)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', '<Leader>h', vim.lsp.buf.hover, opts)
    -- vim.keymap.set('n', '<Leader>i', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
    vim.keymap.set({'n', 'i'}, '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set({'n', 'v'}, '<Leader>a', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<Leader>f', function() vim.lsp.buf.format { async = true } end, opts)
    vim.keymap.set('v', '<Leader>f', function()
      vim.lsp.buf.format {
        async = true,
        range = {
          ["start"] = vim.api.nvim_buf_get_mark(0, "<"),
          ["end"] = vim.api.nvim_buf_get_mark(0, ">"),
        }
      }
    end, opts)
  end,
})
