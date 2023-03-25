local Plug = vim.fn["plug#"]

vim.call("plug#begin", "~/dotfiles/neovim/plugged")

-- more or less global lua deps
Plug("MunifTanjim/nui.nvim") -- ui
Plug("nvim-lua/plenary.nvim") -- misc lua functions
Plug("kkharji/sqlite.lua") -- used for sqlite DBs. neoclip only?

-- LSP
Plug("j-hui/fidget.nvim") -- lsp loading indicator
Plug("folke/lsp-colors.nvim") -- backfill missing lsp highlight colors
Plug("folke/trouble.nvim") -- diagnostics
Plug("jose-elias-alvarez/null-ls.nvim")
Plug("jose-elias-alvarez/typescript.nvim")
Plug("neovim/nvim-lspconfig") -- easier lsp mgmt
Plug("onsails/lspkind.nvim") -- styling for cmp
Plug("williamboman/mason.nvim") -- lsp package mgr

--- Completion
Plug("L3MON4D3/LuaSnip") -- snippets
Plug("hrsh7th/cmp-buffer")
Plug("hrsh7th/cmp-cmdline")
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-path")
Plug("hrsh7th/cmp-nvim-lsp-signature-help")
Plug("hrsh7th/nvim-cmp") -- completion engine
Plug("ray-x/cmp-treesitter")
Plug("saadparwaiz1/cmp_luasnip")
Plug("b0o/schemastore.nvim") -- json validation against schemastore

-- Editing
Plug("AckslD/nvim-neoclip.lua") -- register history
Plug("FooSoft/vim-argwrap") -- auto inline/multiline args
Plug("anuvyklack/pretty-fold.nvim") -- foldinggg
Plug("chentoast/marks.nvim") -- marks
Plug("fatih/vim-go")
Plug("inkarkat/vim-ReplaceWithRegister") -- ez replace motion with register contents
Plug("junegunn/vim-easy-align") -- align text around tokens
Plug("markonm/traces.vim") -- live subst preview
Plug("mizlan/iswap.nvim") -- swap args, lines, objects
Plug("monaqa/dial.nvim") -- easy inc/dec/toggling of types
Plug("ojroques/nvim-bufdel") -- dont close split when closing buffer
Plug("simnalamburt/vim-mundo") -- undo tree
Plug("terrastruct/d2-vim") -- D2 syntax support
Plug("tpope/vim-abolish") -- easy abbrevs, subversion
Plug("tpope/vim-commentary") -- commenting
Plug("tpope/vim-repeat")
Plug("tpope/vim-surround")
Plug("windwp/nvim-autopairs")

-- Testing
Plug("nvim-neotest/neotest")

-- Git
Plug("lewis6991/gitsigns.nvim") -- buffer icons and other things
Plug("rhysd/git-messenger.vim") -- git blame magic
Plug("ruanyl/vim-gh-line") -- open in gh
Plug("sindrets/diffview.nvim") -- diff mgmt!

-- Display
Plug("akinsho/bufferline.nvim", { tag = "v2.*" }) -- stylized buffer tabs
Plug("ellisonleao/glow.nvim")
Plug("fladson/vim-kitty")
Plug("fladson/vim-kitty") -- syntax for kitty terminal config
Plug("folke/noice.nvim")
Plug("folke/twilight.nvim") -- focus on active code selection
Plug("iamcco/markdown-preview.nvim", { ["do"] = "cd app && yarn install" })
Plug("kyazdani42/nvim-web-devicons")
Plug("lukas-reineke/indent-blankline.nvim") -- indent mgmt
Plug("norcalli/nvim-colorizer.lua") -- highlight color codes real-time
Plug("nvim-lualine/lualine.nvim") -- status bar
Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" })
Plug("nvim-treesitter/nvim-treesitter-context")
Plug("petertriho/nvim-scrollbar")
Plug("rcarriga/nvim-notify") -- notification window
Plug("simrat39/symbols-outline.nvim")
Plug("winston0410/range-highlight.nvim") -- highlight selected ranges from command line

-- Colors
Plug("catppuccin/nvim", { as = "catppuccin" })
Plug("embark-theme/vim", { as = "embark" })
Plug("nyoom-engineering/oxocarbon.nvim")
Plug("sam4llis/nvim-tundra")

-- Navigation
Plug("echasnovski/mini.bracketed") -- navigation using brackets. TS nodes, conflicts, comments, diag, files, bufs, windows...
Plug("echasnovski/mini.starter", { branch = "stable" })
Plug("elihunter173/dirbuf.nvim")
Plug("folke/persistence.nvim") -- session mgmt
Plug("ggandor/leap.nvim") -- ez motion
Plug("jinh0/eyeliner.nvim") -- f/F indicators
Plug("nvim-telescope/telescope-file-browser.nvim")
Plug("nvim-telescope/telescope-fzf-native.nvim", { ["do"] = "make" })
Plug("nvim-telescope/telescope-ui-select.nvim") -- code actions in telescope.. is that all?
Plug("nvim-telescope/telescope.nvim", { tag = "0.1.0" })

-- AI
Plug("dense-analysis/neural")
Plug("jakewvincent/mkdnflow.nvim")

-- Misc
Plug("folke/which-key.nvim")
Plug("glacambre/firenvim", {
  ["do"] = function()
    vim.fn["firenvim#install"](0)
  end,
}) -- nvim? in the BROWSER?
Plug("kristijanhusak/vim-carbon-now-sh") -- Screenshot and upload code to carbon.now.sh
Plug("lewis6991/impatient.nvim") -- lua module caching to improve startup time
Plug("metakirby5/codi.vim") -- live eval mode
Plug("michaelb/sniprun", { ["do"] = "bash install.sh" }) -- execute lines of selected code
Plug("nathom/filetype.nvim") -- speed up boot time by optimizing filetype autocmd creation
Plug("sudormrfbin/cheatsheet.nvim")

vim.call("plug#end")
