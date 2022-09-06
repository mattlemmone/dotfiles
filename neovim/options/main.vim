set encoding=UTF-8
filetype plugin on

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

lua << EOF
require("which-key").setup { }

require("nvim-autopairs").setup {}

require("indent_blankline").setup {
  show_current_context = true,
  show_current_context_start = false,
}

require('telescope').setup({
  defaults = {
    layout_config = {
      vertical = { width = 0.25 },
      prompt_position = 'top',
      -- other layout configuration here
    },
    
    -- other defaults configuration here
  },
  pickers = {
    find_files = {
      find_command = {"fd"}
    },
    live_grep = {
      find_command = { "rcatg", "-l" },
    }
  }
})

require('nvim-treesitter.configs').setup {
  -- Automatically install missing parsers when entering buffer
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true }
}

require('neo-tree').setup{
  popup_border_style = "rounded",
  enable_git_status = true,
  filesystem={
    follow_current_file=true
  },
}

require('gitsigns').setup{
  current_line_blame = true,
}

require("bufferline").setup({
highlights = {
  buffer_selected = { italic = false },
  diagnostic_selected = { italic = false },
  hint_selected = { italic = false },
  pick_selected = { italic = false },
  pick_visible = { italic = false },
  pick = { italic = false },
  },
})
EOF


" Colors
syntax on
" colorscheme everblush
colorscheme embark
" let g:onedark#background = '#202020'

" Lightline
" let g:lightline = {
"     \ 'colorscheme': 'icebergDark',
"     \ 'active': {
"       \ 'left': [  ['mode', 'paste'],  ['readonly', 'filename', 'modified', 'gitbranch'] ],
"       \ 'right': [  ['filetype'] ],
"     \ },
"     \ 'component_function': {
"     \   'gitbranch': 'FugitiveHead'
"     \ },
" \ }

set laststatus=2  " always show it

" Display
set cpoptions+=$     " indicator for change motion
set cursorline       " highlight current line
set encoding=utf-8
set expandtab        " convert <TAB> key-presses to spaces
set list             " show special chars
" set listchars=eol:$  " special character overrides
set listchars=tab:›\ ,extends:#,nbsp:.  " special character overrides
" set lcs+=space:•     " dot instead of space
set number           " show line numbers
set ruler            " show cursor position
set showcmd
set textwidth=79
set tw=0             " text width 0 wont allow linebreak

" Indentation (Universal default)
set shiftwidth=2
set tabstop=2

" Search
set showmatch 
set ignorecase
set smartcase     " switch to case-sensitive searches when uppercase chars found
set incsearch     " partial matches
set hlsearch      " highlight matches

" Indentation (Universal default)
set shiftwidth=2
set tabstop=2

" Commands
set wildmenu      " visual autocomplete 

" neovim
set pyxversion=3
let g:node_host_prog    = expand('~/.asdf/shims/node')
let g:python3_host_prog = expand('~/.pyenv/versions/neovim-python3/bin/python')
let g:python_host_prog  = expand('~/.pyenv/versions/neovim-python2/bin/python')
let g:ruby_host_prog    = expand('~/.rbenv/versions/2.6.1/bin/neovim-ruby-host')

" vim-go
let g:go_highlight_build_constraints = 1
let g:go_highlight_functions         = 1
let g:go_highlight_interfaces        = 1
let g:go_highlight_methods           = 1
let g:go_highlight_operators         = 1
let g:go_highlight_structs           = 1

" Plugins
let g:UltiSnipsExpandTrigger = "<nop>" " Let coc.nvim use tab instead of ultisnips
let g:gitgutter_map_keys = 0           " Don't use any key mappings
let NERDTreeQuitOnOpen=1               " close browser after opening a new buffer
let g:BufKillCreateMappings = 0  

" Others
so ~/dotfiles/neovim/options/fzf.vim
so ~/dotfiles/neovim/options/coc.vim
