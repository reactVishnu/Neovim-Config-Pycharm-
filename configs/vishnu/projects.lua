return {
  "ahmedkhalf/project.nvim",
  version = false,
  opts = {
    manual_mode = false, -- automactically add
  },
  event = "VeryLazy",
  config = function(_, opts)
    opts.detection_methods = { "lsp", "pattern" }
    opts.patterns = {
      ".git",
      ".hg",
      ".svn",
    }
    opts.mode = "insert"
    require("project_nvim").setup(opts)
  end,
  keys = {
    { "<leader>fp", "<Cmd>Telescope projects<CR>", desc = "Projects" },
  },
}
