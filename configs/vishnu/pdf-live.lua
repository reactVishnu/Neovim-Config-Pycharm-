return {
  "marioortizmanero/adoc-pdf-live.nvim",
  event = "VeryLazy",
  config = function ()
    require('adoc_pdf_live').setup {
      enabled = true,
      -- The viewer command must be like `command <file>`
      viewer = 'start C:\\Users\\vishn\\AppData\\Local\\SumatraPDF\\SumatraPDF.exe',
      binary = 'asciidoctor-pdf',
      params = '',
      debug = false,
      style = '',
      style_regex = 'style\\.ya?ml'
    }
  end
}

