-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",

require "custom.utils.autocmd"

function Switch()
  local tree_win = vim.fn.win_findbuf(vim.api.nvim_get_current_buf())

  if #tree_win == 0 then
        -- NvimTree is not open, press <C-w>w once
        vim.cmd('wincmd w')
    else
        -- NvimTree is open, press <C-w>w twice
        vim.cmd('wincmd w')
        vim.cmd('wincmd w')
    end

end


vim.api.nvim_set_keymap('n', '<F9>', ':w<CR>:RunFile<CR>:lua Switch()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>.', ':RunClose<CR>', { noremap = true, silent = false })
vim.api.nvim_set_keymap('i', '<F9>', '<Esc>:w<CR>:RunFile<CR>:lua Switch()<CR>', { noremap = true, silent = false })

vim.g.tagbar_ctags_bin = "C:\\Users\\vishn\\scoop\\shims\\ctags.exe"  -- Windows

-- Use SumatraPDF as the PDF viewer
vim.g.nvchad_open_pdf_command = 'silent !start C:\\Users\\vishn\\AppData\\Local\\SumatraPDF\\SumatraPDF.exe'

