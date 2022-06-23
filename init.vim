call plug#begin("~/.vim/plugged")
  " Plugin Section
  Plug 'jose-elias-alvarez/null-ls.nvim'
  Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/nvim-treesitter-textobjects'
  Plug 'neovim/nvim-lspconfig'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'kyazdani42/nvim-tree.lua'
  
  " Actions
  Plug 'machakann/vim-sandwich'
  Plug 'tpope/vim-commentary' 

  " Ruby
  Plug 'tpope/vim-rails'

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

  " color theme
  Plug 'Shatur/neovim-ayu'
call plug#end()
" Config Section
" Vim Settings
set expandtab
set tabstop=2
set shiftwidth=2
set number
set listchars+=space:␣

" Plugins
lua require("lsp-config")
lua require("nvim-cmp-config")
lua require("telescope-config")
lua require("nvim-tree-config")

" Autocomplete
set completeopt=menu,menuone,noselect

"lspsaga
nnoremap <silent>K :Lspsaga hover_doc<CR>
inoremap <silent> <C-k> <Cmd>Lspsaga signature_help<CR>
nnoremap <silent> gh <Cmd>Lspsaga lsp_finder<CR>
nnoremap <silent>gr <cmd>lua require('lspsaga.rename').rename()<CR>
nnoremap <silent> gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
nnoremap <silent><leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
vnoremap <silent><leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>

" Telescope Settings
nnoremap <silent> <C-p> <cmd>Telescope find_files<cr>
nnoremap <silent> <C-f> <cmd>Telescope live_grep<cr>
nnoremap <silent> \\ <cmd>Telescope buffers<cr>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>

" Colorscheme
colorscheme ayu

