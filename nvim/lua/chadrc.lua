-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "chadracula-evondev",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.nvdash = { load_on_startup = true }
M.ui = {
  --       tabufline = {
  --          lazyload = false
  --      },
  statusline = {
    theme = "default",
    separator_style = "arrow",
    order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "cursor" },
    modules = {
      mode = function()
        local stl = require "nvchad.stl.utils"
        local m = vim.api.nvim_get_mode().mode
        local mode_data = stl.modes[m] or stl.modes["n"]
        local mode_hl = "%#St_" .. mode_data[2] .. "Mode#"
        -- Define different icons for each input mode here
        local mode_icons = {
          n = " 🙤  ", -- Normal
          i = " 🙛  ", -- Insert
          v = " 🙵  ", -- Visual
          V = " ", -- Visual Line
          [""] = " ☢  ", -- Visual Block (Ctrl-V)
          c = " 🙪  ", -- Command
          R = " ♣  ", -- Replace
          t = " ⨋ ", -- Terminal
        }
        -- Get the icon for current mode, fallback to normal mode icon
        local icon = mode_icons[m] or mode_icons["n"]
        return mode_hl .. icon .. mode_data[1] .. " %#St_NormalMode#"
      end,
    },
  },
}

return M
