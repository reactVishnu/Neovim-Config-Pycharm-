return {
  'synaptiko/xit.nvim',
  opt = true, -- for lazy-loading
  ft = 'xit', -- for lazy-loading
  run = function(plugin)
    plugin.config()
    vim.cmd[[:TSInstall! xit]]
  end,
  config = function()
    require('xit').setup({
      disable_default_mappings = false,
      disable_default_highlights = false,
    })
  end,
  requires = { 'nvim-treesitter/nvim-treesitter' }
}
