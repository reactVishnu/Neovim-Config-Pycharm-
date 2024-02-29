return {
  "pysan3/autosession.nvim", -- restore previous session
  event = { "VeryLazy" }, -- OPTIONAL
  -- lazy = false,                          -- If you do not want to lazy load.i
  exclude_ft = { "NvimTree" },
  dependencies = { "mhinz/vim-startify" },  -- OPTIONAL: Used for `:AutoSessionGlobal`
  opts = {
    -- Options explained below.
  },
  config = function ()
    require("autosession").setup({
      msg = "Startup Complete Vishnu",
      restore_on_setup = true,
      warn_on_setup = true,
      autosave_on_quit = true,
    })
  end
}
