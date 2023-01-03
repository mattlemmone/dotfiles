local autocmd = vim.api.nvim_create_autocmd

-- Format on save
autocmd("BufWritePre", {
  pattern = {
    "*.lua",
    "*.html",
    "*.json",
  },
  callback = function()
    vim.lsp.buf.format()
  end,
})

-- Format js/ts on save
autocmd("BufWritePre", {
  pattern = {
    "*.js",
    "*.ts",
  },
  callback = function()
    vim.cmd("EslintFixAll")
  end,
})

-- Highlight after yank
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ timeout = 600 })
  end,
})
