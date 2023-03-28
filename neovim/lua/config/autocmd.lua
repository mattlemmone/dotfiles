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

autocmd("BufWritePre", {
  pattern = {
    "*.ts",
    "*.tsx",
    "*.js",
    "*.jsx",
  },
  callback = function()
    -- On save, only use null-ls
    vim.lsp.buf.format({
      bufnr = vim.api.nvim_get_current_buf(),
      filter = function(client)
        return client.name == "null-ls"
      end,
      async = false,
      timeout_ms = 4000,
    })
  end,
})

-- Highlight after yank
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ timeout = 600 })
  end,
})

-- Disable relative numbers
autocmd("InsertEnter", {
  callback = function()
    vim.opt.relativenumber = false
  end,
})

-- Enable relative numbers
autocmd("InsertLeave", {
  callback = function()
    vim.opt.relativenumber = true
  end,
})

-- Enable spellchecking
autocmd("FileType", {
  pattern = { "gitcommit", "text", "tex" },
  callback = function()
    vim.opt_local.spell = true
  end,
})

-- Reload kitty after updating configs
autocmd("BufWritePost", {
  pattern = "*/kitty/kitty.conf",
  callback = function()
    vim.cmd({ cmd = "!kill -SIGUSR1 $(pgrep -a kitty)", mods = { silent = false } })
  end,
})