local Plug = vim.fn["plug#"]

vim.call("plug#begin", "~/dotfiles/neovim/plugged")

-- more or less global lua deps
Plug("MunifTanjim/nui.nvim")
Plug("nvim-lua/plenary.nvim")

-- LSP
Plug("j-hui/fidget.nvim") -- lsp loading indicator
Plug("folke/lsp-colors.nvim") -- backfill missing lsp highlight colors
Plug("folke/trouble.nvim") -- diagnostics
Plug("glepnir/lspsaga.nvim", { branch = "main" }) -- lsp ui
Plug("jose-elias-alvarez/null-ls.nvim")
Plug("jose-elias-alvarez/typescript.nvim")
Plug("neovim/nvim-lspconfig")
Plug("onsails/lspkind.nvim") -- styling for cmp
Plug("williamboman/mason-lspconfig.nvim")
Plug("williamboman/mason.nvim") -- lsp package mgr

--- completion
Plug("L3MON4D3/LuaSnip") -- snippets
Plug("hrsh7th/cmp-buffer")
Plug("hrsh7th/cmp-calc")
Plug("hrsh7th/cmp-cmdline")
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-nvim-lsp-document-symbol") -- navigate symbols
Plug("hrsh7th/cmp-path")
Plug("hrsh7th/nvim-cmp") -- completion engine
Plug("ray-x/cmp-treesitter")
Plug("saadparwaiz1/cmp_luasnip")
Plug("b0o/schemastore.nvim")

-- Editing
Plug("FooSoft/vim-argwrap") -- auto inline/multiline args
Plug("ThePrimeagen/refactoring.nvim")
Plug("anuvyklack/pretty-fold.nvim") -- foldinggg
Plug("fatih/vim-go")
Plug("inkarkat/vim-ReplaceWithRegister") -- ez replace motion with register contents
Plug("jakewvincent/mkdnflow.nvim") -- markdown
Plug("junegunn/vim-easy-align")
Plug("markonm/traces.vim") -- live subst preview
Plug("mizlan/iswap.nvim") -- swap args, lines, objects
Plug("ojroques/nvim-bufdel") -- dont close split when closing buffer
Plug("simnalamburt/vim-mundo") -- undo tree
Plug("tpope/vim-surround")
Plug("tpope/vim-abolish") -- easy abbrevs, subversion
Plug("tpope/vim-commentary") -- commenting
Plug("tpope/vim-repeat")
Plug("windwp/nvim-autopairs")

-- Git
Plug("lewis6991/gitsigns.nvim") -- buffer icons and other things
Plug("rhysd/git-messenger.vim") -- git blame magic
Plug("ruanyl/vim-gh-line") -- open in gh
Plug("sindrets/diffview.nvim") -- diff mgmt!

-- Display
Plug("folke/twilight.nvim") -- focus on active code selection
Plug("rcarriga/nvim-notify")
Plug("nvim-lualine/lualine.nvim") -- status bar
Plug("lukas-reineke/indent-blankline.nvim") -- indent mgmt
Plug("camspiers/lens.vim")
Plug("kyazdani42/nvim-web-devicons")
Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" })
Plug("nvim-treesitter/nvim-treesitter-context")
Plug("iamcco/markdown-preview.nvim", { ["do"] = "cd app && yarn install" })
Plug("akinsho/bufferline.nvim", { tag = "v2.*" }) -- stylized buffer tabs
Plug("norcalli/nvim-colorizer.lua") -- highlight color codes real-time

-- Colors
Plug("EdenEast/nightfox.nvim")
Plug("catppuccin/nvim", { as = "catppuccin" })
Plug("embark-theme/vim", { as = "embark" })
Plug("nyoom-engineering/oxocarbon.nvim")
Plug("sam4llis/nvim-tundra")

-- Navigation
Plug("axieax/urlview.nvim")
Plug("jinh0/eyeliner.nvim") -- f/F indicators
Plug("nvim-telescope/telescope-file-browser.nvim")
Plug("nvim-telescope/telescope-ui-select.nvim")
Plug("ggandor/leap.nvim") -- ez motion
Plug("folke/persistence.nvim") -- session mgmt

-- Searching
Plug("nvim-telescope/telescope.nvim", { tag = "0.1.0" })

-- Misc
Plug("folke/which-key.nvim")
Plug("kristijanhusak/vim-carbon-now-sh") -- Screenshot and upload code to carbon.now.sh
Plug("sudormrfbin/cheatsheet.nvim")
Plug("nvim-neotest/neotest") -- test runner

vim.call("plug#end")
