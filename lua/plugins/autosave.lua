return {
  "okuuva/auto-save.nvim", -- Maintained fork of pocco81/auto-save.nvim
  cmd = "ASToggle", -- Lazy loads on this command
  event = { "InsertLeave", "TextChanged" }, -- Lazy loads on these events
  init = function()
    local group = vim.api.nvim_create_augroup("autosave_message", { clear = true })

    vim.api.nvim_create_autocmd("User", {
      pattern = "AutoSaveWritePost",
      group = group,
      callback = function()
        vim.notify("Saved", vim.log.levels.INFO, { title = "Auto-save", timeout = 800 })
      end,
    })
  end,
  opts = {
    enabled = true, -- Start auto-save when the plugin is loaded
    trigger_events = {
      -- Save immediately when leaving the buffer or Neovim.
      immediate_save = { "BufLeave", "FocusLost", "QuitPre", "VimSuspend" },
      -- Save after editing settles down.
      defer_save = { "InsertLeave", "TextChanged" },
      -- Do not save while the user is actively typing.
      cancel_deferred_save = { "InsertEnter" },
    },
    debounce_delay = 1000, -- Delay in milliseconds before saving
    condition = function(buf)
      local buftype = vim.bo[buf].buftype
      local filetype = vim.bo[buf].filetype

      -- Only save normal, writable file buffers.
      if buftype ~= "" or not vim.bo[buf].modifiable or vim.bo[buf].readonly then
        return false
      end

      return not vim.tbl_contains({ "harpoon", "NvimTree", "oil" }, filetype)
    end,
  },
}
