return {
  "okuuva/auto-save.nvim", -- Maintained fork of pocco81/auto-save.nvim
  cmd = "ASToggle", -- Lazy loads on this command
  event = { "InsertLeave", "TextChanged" }, -- Lazy loads on these events
  opts = {
    enabled = true, -- Start auto-save when the plugin is loaded
    trigger_events = { "InsertLeave", "TextChanged" }, -- Vim events that trigger auto-save
    debounce_delay = 1000, -- Delay in milliseconds before saving
    condition = function(buf)
      local fn = vim.fn
      local utils = require("auto-save.utils.data")

      -- Don't save for special, read-only, or specific file types
      if fn.getbufvar(buf, "&modifiable") == 1 and
         utils.not_in(fn.getbufvar(buf, "&filetype"), { "harpoon", "NvimTree", "oil" }) then
        return true 
      end
      return false -- Don't save
    end,
  },
}
