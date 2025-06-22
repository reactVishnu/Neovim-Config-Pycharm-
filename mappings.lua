---@type MappingsTable
local M = {}
-- local cmp = require "cmp"
M.general = {
  n = {
    ["<C-a>"] = { "ggVG", "select all text" },
    ["<leader>re"] = { ":e! <CR>", "Refresh the current buffer"},
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-b>"] = { ":vsplit <CR>", "Sliting the buffer vertically" },
    ["<leader>,"] = { ":q! <CR>", "Exiting the nvim without saving" },
    ["<leader>>"] = { ":wq! <CR>", "Exiting the nvim with saving" },
    ["<leader>zz"] = { ":TagbarToggle<CR>", "Toggle Tagbar" },
    ["<A-Up>"] = { "15kzz", "25 steps up" },
    ["<A-Down>"] = { "15jzz", "25 steps down" },
    ["<C-D>"] = { "yyp", "Duplicate a line" },
    ["<C-y>"] = { '"_dd', "Deleting a line" },
    ["n"] = { "nzzzv", "next - for keeping cursor in center" },
    ["N"] = { "Nzzzv", "previous - for keeping cursor in center" },
    ["<leader>'"] = { '"_', 'act as "_' },
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
    ["<C-.>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle Nvim Tree" },
    ["<CapsLock>"] = { "<Esc>", "Esc" },
    ["<C-a>"] = {
      function()
        vim.cmd "normal ggVG"
      end,
      "Select all text",
    },
    ["<A-Up>"] = {
      function()
        vim.cmd "normal 25k"
      end,
      "Move one line up",
    },
    ["<A-Down>"] = {
      function()
        vim.cmd "normal 25j"
      end,
      "Move one line down",
    },
    ["<C-d>"] = {
      function()
        vim.cmd "normal yyp"
      end,
      "Duplicate the line",
    },
    ["<C-y>"] = {
      function()
        vim.cmd 'normal "_dd'
      end,
      "Delete a line",
    },
    ["<C-c>"] = {
      function()
        vim.cmd "normal yy"
      end,
      "Copy the line",
    },
    ["<C-s>"] = {
      function()
        vim.cmd "w"
      end,
      "Save file",
    },
    ["<C-f>"] = {
      function()
        vim.cmd "o"
      end,
      "Move to the next line",
    },
    -- ["<C-H>"] = { function() vim.cmd('insert <C-w>') end, "Delete the word" },
  },
  v = {
    [">"] = { ">gv", "indent" },
    ["<C-c>"] = { "y", "Copying the Content." },
    ["<C-x>"] = { "d", "Cut the selected text" },
    ["<BS>"] = { '"_x', "Delete the selected line" },
  },
}

M.comment = {
  plugin = true,

  -- toggle comment in both modes
  n = {
    ["/<C-/>"] = {
      function()
        require("Comment.api").toggle.linewise.current()
        -- vim.cmd([[startinsert]])
        vim.cmd [[execute "normal! A"]]
      end,
      "Toggle comment",
    },
  },

  v = {
    ["<C-/>"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>A",
      "Toggle comment",
    },
  },

  i = {
    [""] = {
      function()
        require("Comment.api").toggle.linewise.current()
        vim.api.nvim_input "<ESC>A"
      end,
      "Toggle Comment",
    },
  },
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

M.gitsigns = {
  plugin = true,
  n = {
    ["<leader>ga"] = {
      function()
        require("gitsigns").attach()
      end,
      "Attach gitsigns",
    },
    ["<leader>gd"] = {
      function()
        require("gitsigns").detach()
      end,
      "Deatach gitsigns",
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
M.ufo = {
  plugin = true,
  n = {
    ["<leader>z"] = {
      function()
        local ufo = require("ufo")
        vim.g.ufo_fold_toggle = not vim.g.ufo_fold_toggle
        if vim.g.ufo_fold_toggle then
          ufo.closeAllFolds()
        else
          ufo.openAllFolds()
        end
      end,
      "Toggle all folds (ufo)",
    },
    ["zR"] = {
      function()
        require("ufo").openAllFolds()
      end,
      "Open all folds (ufo)",
    },
    ["zM"] = {
      function()
        require("ufo").closeAllFolds()
      end,
      "Close all folds (ufo)",
    },
    ["zr"] = {
      function()
        require("ufo").openFoldsExceptKinds()
      end,
      "Open folds (except kinds)",
    },
    ["zm"] = {
      function()
        require("ufo").closeFoldsWith()
      end,
      "Close folds with level",
    },
    ["zo"] = { "zo", "Open current fold" },
    ["zc"] = { "zc", "Close current fold" },
  },
}


return M
