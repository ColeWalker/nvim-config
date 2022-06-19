call plug#begin("~/.vim/plugged")
  " Plugin Section
  Plug 'jose-elias-alvarez/null-ls.nvim'
  Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'neovim/nvim-lspconfig'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'hrsh7th/nvim-cmp'
call plug#end()
"Config Section

lua require("lsp-config")

filetype plugin on
set omnifunc=syntaxcomplete#Complete
nnoremap <silent>K :Lspsaga hover_doc<CR>
inoremap <silent> <C-k> <Cmd>Lspsaga signature_help<CR>
nnoremap <silent> gh <Cmd>Lspsaga lsp_finder<CR>
