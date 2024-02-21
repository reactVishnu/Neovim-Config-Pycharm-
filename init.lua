local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--
vim.api.nvim_set_keymap('n', '<F9>', ':w<CR>:split term://python %<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<F9>', '<Esc>:w<CR>:split term://python %<CR>', { noremap = true, silent = true })
