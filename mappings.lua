---@type MappingsTable
local M = {}

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
    },
  i = {
    ["<C-a>"] = { function() vim.cmd('normal ggVG') end, "Select all text" },
    ["<A-Up>"] = { function() vim.cmd('normal ddkP') end, "Move one line up" },
    ["<A-Down>"] = { function() vim.cmd('normal ddjP') end, "Move one line down" },
    ["<C-d>"] = { function() vim.cmd('normal yyp') end, "Duplicate the line" },
    ["<C-y>"] = { function() vim.cmd('normal dd') end, "Delete a line" },
    ["<C-c>"] = { function() vim.cmd('normal yy') end, "Copy the line" },
    -- ["<C-H>"] = { function() vim.cmd('insert <C-w>') end, "Delete a whole word" },
    ["<C-H>"] = { function() vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-w>', true, true, true), 'n', true) end, "Delete a whole word" },
    ["<C-s>"] = { function() vim.cmd('w') end, "Save file" },
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
      end,
      "Toggle comment",
    },
  },

  v = {
    [""] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "Toggle comment",
    },
  },

  i = {
    [""] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end
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
