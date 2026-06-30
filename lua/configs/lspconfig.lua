require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "pyright", "ts_ls", "gopls","clangd","rust-analyzer"}
vim.lsp.enable(servers)
