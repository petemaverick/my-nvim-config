require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- File explorer
map("n", "<leader>e", function() require("oil").toggle_float() end, { desc = "Toggle file explorer (Oil)" })

-- Diagnostics panel
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Toggle Trouble diagnostics" })

-- Format buffer
map("n", "<leader>fm", function() require("conform").format() end, { desc = "Format buffer" })

-- LSP navigation
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "gI", vim.lsp.buf.implementation, { desc = "Go to implementation" })
