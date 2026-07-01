local options = {
  on_attach = function(bufnr)
    local gitsigns = require "gitsigns"

    local function map(mode, l, r, desc)
      vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
    end

    -- Hunk navigation
    map("n", "]h", function()
      if vim.wo.diff then
        return "]c"
      end
      vim.schedule(function()
        gitsigns.next_hunk()
      end)
      return "<Ignore>"
    end, "Next git hunk")

    map("n", "[h", function()
      if vim.wo.diff then
        return "[c"
      end
      vim.schedule(function()
        gitsigns.prev_hunk()
      end)
      return "<Ignore>"
    end, "Prev git hunk")

    -- Hunk actions
    map("n", "<leader>gp", gitsigns.preview_hunk, "Preview git hunk")
    map("n", "<leader>gs", gitsigns.stage_hunk, "Stage git hunk")
    map("n", "<leader>gr", gitsigns.reset_hunk, "Reset git hunk")
    map("n", "<leader>gu", gitsigns.undo_stage_hunk, "Undo stage git hunk")

    -- Buffer actions
    map("n", "<leader>gS", gitsigns.stage_buffer, "Stage git buffer")
    map("n", "<leader>gR", gitsigns.reset_buffer, "Reset git buffer")
    map("n", "<leader>gd", gitsigns.diffthis, "Git diff this")

    -- Blame
    map("n", "<leader>gb", function()
      gitsigns.blame_line { full = true }
    end, "Git blame line")
    map("n", "<leader>gB", gitsigns.toggle_current_line_blame, "Toggle git blame line")
  end,

  signs = {
    delete = { text = "󰍵" },
    changedelete = { text = "󱕖" },
  },
}

return options
