-- Make sure wq still formats on save, per https://github.com/lukas-reineke/lsp-format.nvim
vim.cmd [[cabbrev wq execute "Format sync" <bar> wq]]
