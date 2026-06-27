require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "kl", "<ESC>")
map("i", "kl", "<ESC>")

-- File explorer
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file tree (left)" })

-- Diagnostics panel
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Toggle Trouble diagnostics" })

-- Format buffer
map("n", "<leader>fm", function() require("conform").format() end, { desc = "Format buffer" })

-- Terminal
map("t", "kl", "<C-\\><C-n>", { desc = "Exit terminal mode" })
map("t", "lk", "<C-\\><C-n>", { desc = "Exit terminal mode" })
map("n", "<leader>t", function()
  require("nvchad.term").toggle {
    pos = "float",
    id = "floatTerm",
    float_opts = {
      row = 0.05,
      col = 0.05,
      width = 0.9,
      height = 0.85,
    },
  }
end, { desc = "Toggle floating terminal" })

-- LSP navigation
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "gI", vim.lsp.buf.implementation, { desc = "Go to implementation" })
