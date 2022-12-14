local Plug = vim.fn["plug#"]

vim.call("plug#begin", "~/dotfiles/neovim/plugged")

-- more or less global lua deps
Plug("nvim-lua/plenary.nvim")
Plug("MunifTanjim/nui.nvim")

-- Editing
Plug("sQVe/sort.nvim")
Plug("FooSoft/vim-argwrap") -- auto inline/multiline args
Plug("fatih/vim-go")
Plug("junegunn/vim-easy-align")
Plug("mizlan/iswap.nvim") -- swap args, lines, objects
Plug("markonm/traces.vim") -- live subst preview
Plug("neoclide/coc.nvim", { branch = "release" })
Plug("fannheyward/telescope-coc.nvim") -- Coc in telescope! :o
Plug("ojroques/nvim-bufdel") -- dont close split when closing buffer
Plug("simnalamburt/vim-mundo") -- undo tree
Plug("tpope/vim-abolish") -- easy abbrevs, subversion
Plug("tpope/vim-commentary") -- commenting
Plug("tpope/vim-repeat")
Plug("kylechui/nvim-surround")
Plug("windwp/nvim-autopairs")
Plug("ckipp01/stylua-nvim") -- lua formatter
Plug("jakewvincent/mkdnflow.nvim") -- markdown
Plug("inkarkat/vim-ReplaceWithRegister") -- ez replace motion with register contents
Plug("anuvyklack/pretty-fold.nvim") -- foldinggg

-- Git
Plug("lewis6991/gitsigns.nvim")
Plug("rhysd/git-messenger.vim") -- git blame magic
Plug("ruanyl/vim-gh-line") -- open in gh
Plug("sindrets/diffview.nvim")

-- Display
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
Plug("embark-theme/vim", { as = "embark" })
Plug("catppuccin/nvim", { as = "catppuccin" })
Plug("EdenEast/nightfox.nvim")
Plug("sam4llis/nvim-tundra")
Plug("nyoom-engineering/oxocarbon.nvim")

-- Navigation
Plug("nvim-telescope/telescope-file-browser.nvim")
Plug("elihunter173/dirbuf.nvim")
Plug("rlane/pounce.nvim")
Plug("jinh0/eyeliner.nvim")
Plug("axieax/urlview.nvim")
Plug("debugloop/telescope-undo.nvim") -- Mundo replacement w/ telescope

-- Searching
Plug("nvim-telescope/telescope.nvim", { tag = "0.1.0" })

-- Misc
Plug("kristijanhusak/vim-carbon-now-sh") -- Screenshot and upload code to carbon.now.sh
Plug("folke/which-key.nvim")
Plug("sudormrfbin/cheatsheet.nvim")

vim.call("plug#end")
