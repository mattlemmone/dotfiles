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

-- Enable relative numbers
autocmd("InsertEnter", {
  callback = function()
    vim.opt.relativenumber = true
  end,
})

-- Disable relative numbers
autocmd("InsertLeave", {
  callback = function()
    vim.opt.relativenumber = false
  end,
})

-- Enable spellchecking in markdown, text and gitcommit files
autocmd("FileType", {
  pattern = { "gitcommit", "markdown", "text", "tex" },
  callback = function()
    vim.opt_local.spell = true
  end,
})
