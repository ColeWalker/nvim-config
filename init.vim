call plug#begin("~/.vim/plugged")
  " Plugin Section
  " LSP / Syntax highlighting / formatting
  Plug 'neovim/nvim-lspconfig'
  Plug 'jose-elias-alvarez/null-ls.nvim'
  Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/nvim-treesitter-textobjects'
  Plug 'nvim-treesitter/nvim-treesitter-context'
  " Plug 'jbgutierrez/vim-better-comments'  
  Plug 'RRethy/vim-illuminate'
  Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
  
  " Text objects
  Plug 'michaeljsmith/vim-indent-object'

  " Plug 'ptzz/lf.vim'

  " Git
  " Plug 'akinsho/git-conflict.nvim'
  Plug 'tpope/vim-fugitive'

  " Floating Terminal
  Plug 'voldikss/vim-floaterm'

  " Plug 'ruanyl/coverage.vim'
  " File tree
  Plug 'kyazdani42/nvim-web-devicons'
  " Plug 'kyazdani42/nvim-tree.lua'
  
  " Actions
  Plug 'machakann/vim-sandwich'
  Plug 'tpope/vim-commentary' 

  " Smooth scroll
  Plug 'karb94/neoscroll.nvim'

  " Ruby
  Plug 'tpope/vim-rails'

  " Testing
  Plug 'vim-test/vim-test'

    " autocomplete nvim-cmp
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'

  " snippet tool 
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'hrsh7th/vim-vsnip-integ'

  " snippets
  Plug 'dsznajder/vscode-es7-javascript-react-snippets', { 'do': 'yarn install --frozen-lockfile && yarn compile' }


  " Navigation
  Plug 'ThePrimeagen/harpoon'
  Plug 'unblevable/quick-scope' 
  Plug 'ggandor/leap.nvim' 

  " telescope
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  " Status line
  Plug 'nvim-lualine/lualine.nvim'

  " Which-key
  Plug 'liuchengxu/vim-which-key'

  " Test coverage
  Plug 'andythigpen/nvim-coverage'

  " color theme
  Plug 'Shatur/neovim-ayu'
  Plug 'bluz71/vim-nightfly-guicolors'
  Plug 'rafalbromirski/vim-aurora'
  Plug 'tiagovla/tokyodark.nvim'
call plug#end()
" Config Section
" Vim Settings
set expandtab
set tabstop=2
set shiftwidth=2
set number
set relativenumber             " Show relative line numbers
set listchars+=space:␣
set linebreak
set incsearch
set ignorecase
set smartcase
set signcolumn=yes
" set showtabline=2
set laststatus=3
let mapleader=","
set foldmethod=indent
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable
" set foldmethod=syntax
" Plugins
lua require("lsp-config")
lua require("nvim-cmp-config")
lua require("telescope-config")
" lua require("nvim-tree-config")
lua require("lualine-config")
" lua require("git-conflict").setup()
lua require('neoscroll').setup()
lua require('lspsaga').init_lsp_saga()
lua require('leap').set_default_keymaps()
lua require("coverage").setup()

" let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
"
" Autocomplete
set completeopt=menu,menuone,noselect

"vsnip
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
let g:vsnip_filetypes = {}
let g:vsnip_filetypes.javascriptreact = ['javascript']
let g:vsnip_filetypes.typescriptreact = ['typescript']
" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'


"lspsaga
nnoremap <silent>K <Cmd>Lspsaga hover_doc<CR>
inoremap <silent> <C-k> <Cmd>LspSignatureHelp<CR>
nnoremap <silent> <C-k> <Cmd>LspDiagLine<CR>
" nnoremap <silent> gh <Cmd>Lspsaga lsp_finder<CR>
nnoremap <silent>gr <cmd>LspRename<CR>
nnoremap <silent> gs <cmd>lua require('lspsaga.signaturehelp')<CR>
nnoremap <silent><leader>ca <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent><leader>oi <cmd>TSLspOrganize<CR>
nnoremap <silent><leader>ia <cmd>TSLspImportAll<CR>
nnoremap <silent>gl <cmd>LspDiagNext<CR>
nnoremap <silent>gh <cmd>LspDiagPrev<CR>
vnoremap <silent><leader>ca :<C-U><cmd>lua vim.lsp.buf.code_action()<CR>

" Telescope Settings
nnoremap <silent> <C-p> <cmd>Telescope find_files hidden=true ignore=true<cr>
nnoremap <silent> <C-f> <cmd>Telescope live_grep hidden=true<cr>
nnoremap <silent> \\ <cmd>Telescope buffers<cr>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>
nnoremap <silent> <leader>lr <cmd>Telescope lsp_references<cr>
nnoremap <silent> <leader>lt <cmd>Telescope lsp_type_definitions<cr>
" Nvim-tree Settings
nnoremap <silent> <leader>nt <cmd>NvimTreeToggle<cr>
" Harpoon Settings
nnoremap <silent> <leader>hm <cmd>lua require("harpoon.mark").add_file()<cr>
nnoremap <silent> <leader>hv <cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>
nnoremap <silent> <leader>hl <cmd>lua require("harpoon.ui").nav_next()<cr>
nnoremap <silent> <leader>hh <cmd>lua require("harpoon.ui").nav_prev()<cr>
nnoremap <Leader>o o<Esc>0"_D
nnoremap <Leader>O O<Esc>0"_D

" Colorscheme
let g:tokyodark_transparent_background = 0
" let g:tokyodark_enable_italic_comment = 1
" let g:tokyodark_enable_italic = 1
" let g:tokyodark_color_gamma = "1.0"
set termguicolors
" set background=dark
colorscheme tokyodark
" colorscheme aurora
" autocmd BufReadPost,FileReadPost * normal zR
