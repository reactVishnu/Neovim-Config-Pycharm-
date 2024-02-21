local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require "null-ls"

local opts = {
  sources = {
    null_ls.builtin.formatting.black,
    null_ls.builtin.diagnostics.mypy,
    null_ls.builtin.diagnostics.flake8, -- Add Flake8 as a diagnostic source
    null_ls.builtin.diagnostics.ruff,
  },
}

return opts
