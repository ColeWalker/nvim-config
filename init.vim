" Config Section
" Vim Settings
lua require("init")
set listchars+=space:␣
" set showtabline=2
" set laststatus=3
" let mapleader=","
" set foldmethod=indent

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
inoremap <silent> <C-h> <Cmd>LspSignatureHelp<CR>
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
" nnoremap <silent> <C-p> <cmd>Telescope find_files hidden=true<cr>
nnoremap <silent> <C-f> <cmd>Telescope live_grep hidden=true<cr>
nnoremap <silent> <C-p> <cmd>lua require('telescope.builtin').find_files({hidden=true})<cr>
nnoremap <silent> \\ <cmd>Telescope buffers<cr>
" nnoremap <silent> ;; <cmd>Telescope help_tags<cr>
nnoremap <silent> <leader>lr <cmd>Telescope lsp_references<cr>
nnoremap <silent> <leader>lt <cmd>Telescope lsp_type_definitions<cr>

" autocmd FileType javascript.jsx setlocal commentstring={/*\ %s\ */}
" autocmd FileType javascript.tsx setlocal commentstring={/*\ %s\ */}
" nnoremap <Leader>o o<Esc>0"_D
" nmap <CR> :a<CR><CR>.<CR>
" nnoremap <silent> <leader>o :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
" nnoremap <silent> <leader>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>
" nnoremap <Leader>O O<Esc>0"_D

" Format
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END

" oscyank settings
let g:oscyank_term = 'default'
set re=0
let g:yats_host_keyword = 1

" set foldexpr=nvim_treesitter#foldexpr()
" set nofoldenable
" set foldmethod=expr
" set foldlevel=99


" Colorscheme
" let g:tokyodark_transparent_background = 0
" let g:tokyodark_enable_italic_comment = 1
" let g:tokyodark_enable_italic = 1
" let g:tokyodark_color_gamma = "1.0"
" let g:nightflyTransparent = v:true
" set termguicolors
" set background=dark
colorscheme bluloco
" colorscheme aurora
" colorscheme catppuccin-mocha
" autocmd BufReadPost,FileReadPost * normal zR
"

" lua vim.api.nvim_set_keymap('n', '<leader>gb', '<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr>', {silent = true})
