local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },
  {
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp,
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    event = "BufWritePre",
    config = function()
      require "custom.configs.conform"
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "nvimtools/none-ls.nvim",
    config = function()
      require "custom.configs.none-ls.lua"
    end,
  },
  {
   "nvim-tree/nvim-web-devicons",
    opts = function()
      return { override = require "nvchad.icons.devicons",
        override_by_extension = {
          ["xit"] = {
          icon = "⌛",
          color = "#81e043",
          name = "Xit"
          }
        },
      }
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "devicons")
      require("nvim-web-devicons").setup(opts)
      -- require "custom.configs.webdevicon"
    end,
  },
  { "folke/neodev.nvim", opts = {} },
  { import = "custom.configs.vishnu.zen-mode" },
  { import = "custom.configs.vishnu.searchbox" },
  { import = "custom.configs.vishnu.ufo-statuscol", enabled = false },
  { import = "custom.configs.vishnu.tagbar" },
  { import = "custom.configs.vishnu.venv-select" },
  { import = "custom.configs.vishnu.coderunner" },
  -- { import = "custom.configs.vishnu.polygot" },
  { import = "custom.configs.vishnu.autosession" },
  { import = "custom.configs.vishnu.md-preview" },
  { import = "custom.configs.vishnu.harpoon" },
  { import = "custom.configs.vishnu.autosave" },
  { import = "custom.configs.vishnu.xit"},
  { import = "custom.configs.vishnu.nvim-surround"}
  -- { import = "custom.configs.vishnu.coc-plugin"},
  --
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
