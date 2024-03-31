---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "jellybeans",
  theme_toggle = { "jellybeans", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"
vim.api.nvim_set_keymap('i', '<C-BS>', '<C-W>', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-Del>', '<Esc>ldwi', {noremap = true})
vim.api.nvim_set_keymap('i', '<S-Left>', '<Esc>v', {noremap = true})
vim.api.nvim_set_keymap('i', '<S-Right>', '<Esc>v', {noremap = true})
vim.api.nvim_set_keymap('i', '<S-Up>', '<Esc>vk', {noremap = true})
vim.api.nvim_set_keymap('n', '<S-Up>', '<Esc>vk', {noremap = true})
vim.api.nvim_set_keymap('i', '<S-Down>', '<Esc>v', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-z>', '<Esc>ui', {noremap = true})


vim.api.nvim_set_keymap('i', '<S-CR>','<Esc>o', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-CR>','<Esc>o', { noremap = true, silent = true })
return M
