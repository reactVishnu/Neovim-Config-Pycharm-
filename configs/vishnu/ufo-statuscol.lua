return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
  },
  lazy = false,
  config = function()
    -- Fold settings
    vim.o.foldcolumn = "0" -- '0' is default
    vim.o.foldlevel = 99   -- Using ufo provider needs high value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    -- Setup ufo
    require("ufo").setup({
      provider_selector = function(bufnr, filetype, buftype)
        return { "treesitter", "indent" }
      end,
      fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local suffix = (" 󰁂 %d "):format(endLnum - lnum)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
          local chunkText = chunk[1]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
            curWidth = curWidth + chunkWidth
          else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            table.insert(newVirtText, { chunkText, chunk[2] })
            break
          end
        end
        table.insert(newVirtText, { suffix, "MoreMsg" })
        return newVirtText
      end,
    })

    -- Optional: LSP folding capability setup (for better folds)
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }

    -- Use this in your LSP setup
    -- Example: require("lspconfig").tsserver.setup({ capabilities = capabilities })

    -- Keymaps
    vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds (ufo)" })
    vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds (ufo)" })
    vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds, { desc = "Open all folds except certain kinds" })
    vim.keymap.set("n", "zm", require("ufo").closeFoldsWith, { desc = "Close folds with level" })
  end,
}
