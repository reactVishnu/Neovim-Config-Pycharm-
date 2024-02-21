---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["<C-a>"] = { "ggVG", "select all text" },
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-b>"] = {":vsplit <CR>", "Sliting the buffer vertically"},
    --  format with conform
    ["<leader>fm"] = {

      function()
        require("conform").format()
      end,
      "formatting",
    }

  },
  i = {
    ["<C-a>"] = { function() vim.cmd('normal ggVG') end, "Select all text" },
    ["<A-Up>"] = { function() vim.cmd('normal ddkP') end, "Move one line up" },
    ["<A-Down>"] = { function() vim.cmd('normal ddjP') end, "Move one line down" },
    ["<C-H>"] = {"<C-w>", "Delete"},
    ["<C-d>"] = { function() vim.cmd('normal yyp') end, "Duplicate the line" },
    ["<C-y>"] = { function() vim.cmd('normal dd') end, "Delete a line" },
    ["<C-c>"] = { function() vim.cmd('normal yy') end, "Copy the line" },
  },
    v = {
    [">"] = { ">gv", "indent"},
    ["<C-c>"] = {"y", "Copying the Content."},
    ["<C-x>"] = {"d", "Cut the selected text"},
  },
}

-- more keybinds!
return M


