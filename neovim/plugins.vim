" Editing
Plug 'FooSoft/vim-argwrap'             " auto inline/multiline args
Plug 'fatih/vim-go'
Plug 'junegunn/vim-easy-align'
Plug 'machakann/vim-swap'              " swap args, lines, objects
Plug 'markonm/traces.vim'              " live subst preview
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'qpkorr/vim-bufkill'              " dont close split when closing buffer
Plug 'simnalamburt/vim-mundo'          " undo tree
Plug 'tpope/vim-abolish'               " easy abbrevs
Plug 'tpope/vim-commentary'            " commenting
Plug 'tpope/vim-obsession'             " session management
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'           " inc/dec dates
Plug 'tpope/vim-surround'
Plug 'wellle/context.vim'
Plug 'christoomey/vim-tmux-navigator' " shared shortcuts btwn tmux panes and vim splits
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'windwp/nvim-autopairs'

" Git
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'      " git
Plug 'junegunn/gv.vim'         " git browser
Plug 'rhysd/git-messenger.vim' " git blame magic
Plug 'ruanyl/vim-gh-line'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'folke/zen-mode.nvim'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Syntax
" Plug 'sheerun/vim-polyglot'
Plug 'jparise/vim-graphql'

" Display
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'camspiers/lens.vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'MunifTanjim/nui.nvim' " reqd
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' } " stylized buffer tabs

" Colors
Plug 'Everblush/everblush.nvim', { 'as': 'everblush' }
Plug 'cocopon/iceberg.vim'
Plug 'gkeep/iceberg-dark'
Plug 'arcticicestudio/nord-vim'
Plug 'KeitaNakamura/neodark.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'embark-theme/vim', { 'as': 'embark' }
Plug 'pineapplegiant/spaceduck'
Plug 'norcalli/nvim-colorizer.lua' " highlight color codes real-time
Plug 'martinsione/darkplus.nvim'


" Navigation
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'scrooloose/nerdtree'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'unblevable/quick-scope' 

" Searching
Plug '/usr/local/opt/fzf'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Misc
Plug 'kristijanhusak/vim-carbon-now-sh' " Screenshot and upload code to carbon.now.sh
Plug 'vim-test/vim-test'
Plug 'voldikss/vim-floaterm'
Plug 'folke/which-key.nvim'
