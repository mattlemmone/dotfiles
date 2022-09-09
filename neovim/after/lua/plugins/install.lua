local Plug = vim.fn["plug#"]

vim.call("plug#begin", "~/dotfiles/neovim/plugged")

-- Editing
Plug("sQVe/sort.nvim")
Plug("FooSoft/vim-argwrap") -- auto inline/multiline args
Plug("fatih/vim-go")
Plug("junegunn/vim-easy-align")
Plug("mizlan/iswap.nvim") -- swap args, lines, objects
Plug("markonm/traces.vim") -- live subst preview
Plug("neoclide/coc.nvim", { branch = "release" })
Plug("famiu/bufdelete.nvim") -- dont close split when closing buffer
Plug("simnalamburt/vim-mundo") -- undo tree
Plug("tpope/vim-abolish") -- easy abbrevs, subversion
Plug("tpope/vim-commentary") -- commenting
Plug("tpope/vim-repeat")
Plug("tpope/vim-speeddating") -- inc/dec dates
Plug("tpope/vim-surround")
Plug("christoomey/vim-tmux-navigator") -- shared shortcuts btwn tmux panes and vim splits
Plug("nvim-neo-tree/neo-tree.nvim")
Plug("windwp/nvim-autopairs")
Plug("ckipp01/stylua-nvim")

-- Git
Plug("lewis6991/gitsigns.nvim")
Plug("junegunn/gv.vim") -- git browser
Plug("rhysd/git-messenger.vim") -- git blame magic
Plug("ruanyl/vim-gh-line")
Plug("nvim-lua/plenary.nvim")
Plug("wesleimp/stylua.nvim")

-- Snippets
Plug("SirVer/ultisnips")
Plug("honza/vim-snippets")

-- Syntax
-- Plug('sheerun/vim-polyglot')
Plug("jparise/vim-graphql")

-- Display
Plug("Pocco81/HighStr.nvim") -- highlighting!
Plug("nvim-lualine/lualine.nvim")
Plug("lukas-reineke/indent-blankline.nvim")
Plug("junegunn/goyo.vim")
Plug("junegunn/limelight.vim")
Plug("camspiers/lens.vim")
Plug("kyazdani42/nvim-web-devicons")
Plug("MunifTanjim/nui.nvim") -- reqd
Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" })
Plug("iamcco/markdown-preview.nvim", { ["do"] = "cd app && yarn install" })
Plug("akinsho/bufferline.nvim", { tag = "v2.*" }) -- stylized buffer tabs
Plug("norcalli/nvim-colorizer.lua") -- highlight color codes real-time
Plug("ray-x/guihua.lua")
Plug("ray-x/sad.nvim") -- batch edit

-- Colors
Plug("embark-theme/vim", { as = "embark" })
Plug("catppuccin/nvim", { as = "catppuccin" })
Plug("EdenEast/nightfox.nvim")
Plug("shaunsingh/moonlight.nvim")
Plug("sainnhe/everforest")
Plug("Everblush/everblush.nvim", { as = "everblush" })

-- Navigation
Plug("rmagatti/auto-session") -- session management
Plug("nvim-telescope/telescope-file-browser.nvim")
Plug("unblevable/quick-scope")
Plug("ggandor/lightspeed.nvim") -- fast nav
Plug("axieax/urlview.nvim")

-- Searching
Plug("mileszs/ack.vim")
Plug("nvim-telescope/telescope.nvim", { tag = "0.1.0" })

-- Misc
Plug("kristijanhusak/vim-carbon-now-sh") -- Screenshot and upload code to carbon.now.sh
Plug("vim-test/vim-test")
Plug("voldikss/vim-floaterm")
Plug("folke/which-key.nvim")
Plug("sudormrfbin/cheatsheet.nvim")
Plug("pwntester/octo.nvim") -- github ui
Plug("glepnir/dashboard-nvim") -- greeter y0

vim.call("plug#end")
