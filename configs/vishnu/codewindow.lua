return {
  'gorbit99/codewindow.nvim',
  event = "VeryLazy",
  config = function()
    require('codewindow').setup()
    require('codewindow').apply_default_keybinds()
  end,
}
