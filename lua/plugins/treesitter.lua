return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    local langs = {
      "vim", "lua", "vimdoc",
      "html", "css",
      "python", "javascript", "typescript", "tsx", "go",
    }
    local install = require("nvim-treesitter.install")
    local config = require("nvim-treesitter.config")
    local installed = config.get_installed()
    local to_install = vim.tbl_filter(function(lang)
      return not vim.list_contains(installed, lang)
    end, langs)
    if #to_install > 0 then
      install.install(to_install)
    end
  end,
}
