---@type MappingsTable
local M = {}
-- local cmp = require "cmp"
M.general = {
  n = {
    ["<C-a>"] = { "ggVG", "select all text" },
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-b>"] = {":vsplit <CR>", "Sliting the buffer vertically"},
    ["<leader>zz"] = { ":TagbarToggle<CR>", "Toggle Tagbar" },
    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
      },
    ["<leader>tt"] = {
      function()
        require("base46").toggle_transparency()
      end,
      "Toggle transparency",
    },
    },
  i = {
    ["<C-a>"] = { function() vim.cmd('normal ggVG') end, "Select all text" },
    ["<A-Up>"] = { function() vim.cmd('normal ddkP') end, "Move one line up" },
    ["<A-Down>"] = { function() vim.cmd('normal ddjP') end, "Move one line down" },
    ["<C-d>"] = { function() vim.cmd('normal yyp') end, "Duplicate the line" },
    ["<C-y>"] = { function() vim.cmd('normal dd') end, "Delete a line" },
    ["<C-c>"] = { function() vim.cmd('normal yy') end, "Copy the line" },
    ["<C-s>"] = { function() vim.cmd('w') end, "Save file" },
    ["<C-f>"] = { function() vim.cmd('o') end, "Move to the next line" },
    -- ["<C-H>"] = { function() vim.cmd('insert <C-w>') end, "Delete the word" },
  },
    v = {
    [">"] = { ">gv", "indent"},
    ["<C-c>"] = {"y", "Copying the Content."},
    ["<C-x>"] = {"d", "Cut the selected text"},
    ["<BS>"] = {'"_d', "Delete the selected line"}
  },
}

M.comment = {
  plugin = true,

  -- toggle comment in both modes
  n = {
    [""] = {
      function()
        require("Comment.api").toggle.linewise.current()
        -- vim.cmd([[startinsert]])
        vim.cmd([[execute "normal! A"]])
      end,
      "Toggle comment",
    },
  },

  v = {
    [""] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>A",
      "Toggle comment",
    },
  },

  i = {
    [""] = {
      function()
        require("Comment.api").toggle.linewise.current()
        vim.api.nvim_input('<ESC>A')
      end,
      "Toggle Comment"
    }
  }
}

M.swenv = {
  plugin = true,
  n = {
    ["<leader>ps"] = {
      function()
        require("swenv.api").pick_venv()
      end,
      "Choose Python venv",
    },
    ["<leader>pe"] = {
      function()
        require("swenv.api").get_current_venv()
      end,
      "Show current Python venv",
    },
  },
}

M.searchbox = {
  plugin = true,
  n = {
    ["<leader>s"] = {
      "<cmd>SearchBoxMatchAll<CR>",
      "Enter Searchbox",
      opts = { noremap = true },
    },
    ["<leader>r"] = {
      "<cmd>SearchBoxReplace<CR>",
      "Enter Replace Searchbox",
      opts = { noremap = true },
    },
  },
}

-- M.tagbar = {
--   plugin = true,
--   n = {
--     ["<leader>zz"] = {
--       "<cmd>TagbarToggle<CR>",
--       "Tagbar Toggle",
--        opts = { noremap = true },
--     }
--   }
-- }
-- more keybinds!
return M
