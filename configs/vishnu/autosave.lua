return {
  "okuuva/auto-save.nvim",
  cmd = "ASToggle", -- optional for lazy loading on command
  event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
  keys = {
    { "<leader>sa", ":ASToggle<CR>", desc = "Toggle auto-save" },
  },
  config = function()
    require("auto-save").setup { enabled = false }
  end,
}
