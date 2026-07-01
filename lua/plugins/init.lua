return {
  {
    "lewis6991/gitsigns.nvim",
    opts = require "configs.gitsigns",
  },

  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = { "html", "cssls", "pyright", "ts_ls", "gopls","clangd","rust-analyzer"},
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

}
