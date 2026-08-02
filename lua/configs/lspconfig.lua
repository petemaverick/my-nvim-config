require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "pyright", "ts_ls", "gopls", "clangd", "rust_analyzer" }

for _, server in ipairs(servers) do
  vim.lsp.config(server, {})
  vim.lsp.enable(server)
end

vim.diagnostic.config {
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
}
