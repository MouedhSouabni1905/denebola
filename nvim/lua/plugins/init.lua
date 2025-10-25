return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "hrsh7th/nvim-cmp",
    enabled = false,
  },
  {
    "L3MON4D3/luasnip",
    enabled = false,
  },
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
      },
    },
  },
  {
    "nvchad/ui",
    config = function()
      require "nvchad"
    end,
  },
  {
    "nvchad/base46",
    lazy = true,
    build = function()
      require("base46").load_all_highlights()
    end,
  },
  "nvzone/volt",
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      image = {
        enabled = true,
        -- your image configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      },
    },
  },
}
