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

local on_attach = function(client, bufnr)
  local opts = { noremap=true, silent=true }
  --vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  vim.api.nvim_set_keymap('n', '<space>d', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  vim.api.nvim_set_keymap('n', '<Leader>d', '<cmd>lua toggle_diagnostic_window()<CR>', opts)

  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>f', '<cmd>lua vim.lsp.buf.format{async = true}<CR>', opts)
end

-- setup lsp servers
local servers = { 'pyright', 'rust_analyzer', 'clangd', 'texlab', 'hls' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
