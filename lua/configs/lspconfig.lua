require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "pyright", "ts_ls", "gopls", "clangd", "rust_analyzer" }
vim.lsp.enable(servers)
