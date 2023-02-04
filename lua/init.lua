local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.g.mapleader = " "
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- Plugin Section
  'lewis6991/impatient.nvim',

  -- LSP / Syntax highlighting / formatting
  -- { 'joechrisellis/lsp-format-modifications.nvim' , lazy=true},
  { "williamboman/mason.nvim", lazy = true },
  'neovim/nvim-lspconfig',
  'jose-elias-alvarez/null-ls.nvim',
  --  'jose-elias-alvarez/nvim-lsp-ts-utils'
  'jose-elias-alvarez/typescript.nvim',
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },
  'nvim-treesitter/nvim-treesitter-textobjects',
  'nvim-treesitter/nvim-treesitter-context',
  'mrjones2014/nvim-ts-rainbow',
  --  'jbgutierrez/vim-better-comments'

  {
    'RRethy/vim-illuminate',
    config = function()
      require 'illuminate'.configure {

        providers = {
          'lsp',
          'treesitter',
          'regex',
        },
        delay = 100,
      }
    end
  },
  {
    "glepnir/lspsaga.nvim",
    branch = "main",
  },
  -- Text objects
  'michaeljsmith/vim-indent-object',

  --  'ptzz/lf.vim'
  { 'ruby-formatter/rufo-vim', lazy = true },

  -- Git
  --  'akinsho/git-conflict.nvim'
  { 'tpope/vim-fugitive', lazy = true, cmd = "Fug" },

  -- Floating Terminal
  { 'voldikss/vim-floaterm' },

  --  'ruanyl/coverage.vim'
  -- File tree
  'kyazdani42/nvim-web-devicons',

  -- Actions
  ({
    "kylechui/nvim-surround",
    version = "*", --  for stability; omit to  `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to  defaults
      })
    end
  }),
  {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  },
  'tpope/vim-commentary',
  'suy/vim-context-commentstring',
  { 'ojroques/vim-oscyank', branch = 'main' },
  'tpope/vim-unimpaired',
  -- { 'xorid/swap-split.nvim', lazy = true },
  {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to  the default settings
        -- refer to the configuration section below
        mode = "document_diagnostics"
      }
    end
  },

  -- Smooth scroll
  'karb94/neoscroll.nvim',

  -- Ruby
  { 'tpope/vim-rails', lazy = true },

  -- Testing
  { 'vim-test/vim-test', lazy = true },

  -- autocomplete nvim-cmp
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/cmp-nvim-lsp-document-symbol',
  'hrsh7th/cmp-nvim-lsp-signature-help',
  'hrsh7th/nvim-cmp',

  -- { 'mrjones2014/legendary.nvim', lazy = true },

  -- snippet tool
  'hrsh7th/cmp-vsnip',
  'hrsh7th/vim-vsnip',
  'hrsh7th/vim-vsnip-integ',

  -- snippets
  { 'dsznajder/vscode-es7-javascript-react-snippets',
    build = 'yarn install --frozen-lockfile && yarn compile'
  },

  -- Navigation
  { 'ThePrimeagen/harpoon', lazy = true },
  'unblevable/quick-scope',
  'ggandor/leap.nvim',

  -- telescope
  'nvim-lua/popup.nvim',
  'nvim-lua/plenary.nvim',
  'nvim-telescope/telescope.nvim',
  'nvim-telescope/telescope-file-browser.nvim',

  -- Status line
  'nvim-lualine/lualine.nvim',

  -- Which-key

  -- { 'liuchengxu/vim-which-key', lazy = true },
  -- { 'AckslD/nvim-whichkey-setup.lua', lazy = true },
  -- Test coverage
  { 'andythigpen/nvim-coverage', lazy = true },

  -- fancy screenshots
  { 'krivahtoo/silicon.nvim', build = './install.sh', lazy = true },

  --html auto rename tags
  'AndrewRadev/tagalong.vim',

  -- color theme
  'folke/lsp-colors.nvim',
  { 'Shatur/neovim-ayu', lazy = true },
  -- current color theme should NOT be lazy loaded
  { 'bluz71/vim-nightfly-guicolors', lazy = false },
  { 'rafalbromirski/vim-aurora', lazy = true },
  { 'tiagovla/tokyodark.nvim', lazy = true },

  -- syntax files
  'HerringtonDarkholme/yats.vim'
})

vim.cmd("command! Fug lua print()")
