call plug#begin("~/.vim/plugged")
  " Plugin Section
  " LSP / Syntax highlighting / formatting
  Plug 'jose-elias-alvarez/null-ls.nvim'
  Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/nvim-treesitter-textobjects'
  Plug 'neovim/nvim-lspconfig'

  " Git
  Plug 'akinsho/git-conflict.nvim'

  " Floating Terminal
  Plug 'voldikss/vim-floaterm'

  " File tree
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'kyazdani42/nvim-tree.lua'
  
  " Actions
  Plug 'machakann/vim-sandwich'
  Plug 'tpope/vim-commentary' 

  " Smooth scroll
  Plug 'karb94/neoscroll.nvim'

  " Ruby
  Plug 'tpope/vim-rails'

  " Testing
  Plug 'vim-test/vim-test'

  " snippet tool 
  Plug 'hrsh7th/vim-vsnip'
  Plug 'hrsh7th/vim-vsnip-integ'

  " autocomplete nvim-cmp
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'

  " telescope
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  " Status line
  Plug 'nvim-lualine/lualine.nvim'

  " color theme
  Plug 'Shatur/neovim-ayu'
  Plug 'bluz71/vim-nightfly-guicolors'
  Plug 'rafalbromirski/vim-aurora'
call plug#end()
" Config Section
" Vim Settings
set expandtab
set tabstop=2
set shiftwidth=2
set number
set listchars+=space:␣
let mapleader=","
" Plugins
lua require("lsp-config")
lua require("nvim-cmp-config")
lua require("telescope-config")
lua require("nvim-tree-config")
lua require("lualine-config")
lua require("git-conflict").setup()
lua require('neoscroll').setup()

" Autocomplete
set completeopt=menu,menuone,noselect

"lspsaga
nnoremap <silent>K <Cmd>LspHover<CR>
inoremap <silent> <C-k> <Cmd>LspSignatureHelp<CR>
" nnoremap <silent> gh <Cmd>Lspsaga lsp_finder<CR>
nnoremap <silent>gr <cmd>LspRename<CR>
nnoremap <silent> gs <cmd>lua require('lspsaga.signaturehelp')<CR>
nnoremap <silent><leader>ca <cmd>LspCodeAction<CR>
vnoremap <silent><leader>ca :<C-U><cmd>LspCodeAction<CR>

" Telescope Settings
nnoremap <silent> <C-p> <cmd>Telescope find_files hidden=true ignore=true<cr>
nnoremap <silent> <C-f> <cmd>Telescope live_grep hidden=true<cr>
nnoremap <silent> \\ <cmd>Telescope buffers<cr>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>
nnoremap <silent> <leader>lr <cmd>Telescope lsp_references<cr>
nnoremap <silent> <leader>lt <cmd>Telescope lsp_type_definitions<cr>
" Nvim-tree Settings
nnoremap <silent> <leader>nt <cmd>NvimTreeToggle<cr>
" Colorscheme
set termguicolors
set background=dark
colorscheme aurora

