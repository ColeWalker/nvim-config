" Config Section
" Vim Settings
lua require("init")
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
" set foldmethod=indent
set foldexpr=nvim_treesitter#foldexpr()
" set nofoldenable
set foldmethod=expr
set foldlevel=99

" Plugins
lua require('impatient')
lua require("lsp-config")
lua require("nvim-cmp-config")
lua require("telescope-config")
lua require("mason").setup()
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

"SwapSplit
nnoremap <C-W>p <cmd>SwapSplit<CR>
nnoremap <leader>c <cmd>cclose<CR>

" Telescope Settings
nnoremap <silent> <C-p> <cmd>Telescope find_files hidden=true<cr>
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
" autocmd FileType javascript.jsx setlocal commentstring={/*\ %s\ */}
" autocmd FileType javascript.tsx setlocal commentstring={/*\ %s\ */}
" nnoremap <Leader>o o<Esc>0"_D
" nmap <CR> :a<CR><CR>.<CR>
" nnoremap <silent> <leader>o :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
" nnoremap <silent> <leader>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>
" nnoremap <Leader>O O<Esc>0"_D

"Trouble
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap <leader>gR <cmd>TroubleToggle lsp_references<cr>

" oscyank settings
let g:oscyank_term = 'default'
set re=0
let g:yats_host_keyword = 1

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

