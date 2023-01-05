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
   'wbthomason/packer.nvim',
   'lewis6991/impatient.nvim',

  -- LSP / Syntax highlighting / formatting
   'joechrisellis/lsp-format-modifications.nvim',
   { "williamboman/mason.nvim" },
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
  --  'jbgutierrez/vim-better-comments'  
   'RRethy/vim-illuminate',
   {
    "glepnir/lspsaga.nvim",
    branch = "main",
  }  ,
  -- Text objects
   'michaeljsmith/vim-indent-object',

  --  'ptzz/lf.vim'
   'ruby-formatter/rufo-vim',
   {
    'goolord/alpha-nvim',
    config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
},
  -- Git
  --  'akinsho/git-conflict.nvim'
   'tpope/vim-fugitive',

  -- Floating Terminal
   'voldikss/vim-floaterm',

  --  'ruanyl/coverage.vim'
  -- File tree
   'kyazdani42/nvim-web-devicons',
  --  'kyazdani42/nvim-tree.lua'
  
  -- Actions
   'machakann/vim-sandwich',
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
   'tpope/vim-commentary' ,
   'suy/vim-context-commentstring',
   {'ojroques/vim-oscyank', branch= 'main'},
   'tpope/vim-unimpaired',
   'xorid/swap-split.nvim',
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
   'tpope/vim-rails',

  -- Testing
   'vim-test/vim-test',

    -- autocomplete nvim-cmp
   'hrsh7th/cmp-nvim-lsp',
   'hrsh7th/cmp-buffer',
   'hrsh7th/cmp-path',
   'hrsh7th/cmp-cmdline',
   'hrsh7th/cmp-nvim-lsp-document-symbol',
   'hrsh7th/cmp-nvim-lsp-signature-help',
   'hrsh7th/nvim-cmp',

  ({ 'mrjones2014/legendary.nvim' }),

  -- snippet tool 
   'hrsh7th/cmp-vsnip',
   'hrsh7th/vim-vsnip',
   'hrsh7th/vim-vsnip-integ',

  -- snippets
   {'dsznajder/vscode-es7-javascript-react-snippets',
    build = 'yarn install --frozen-lockfile && yarn compile'
  },

  -- Navigation
   'ThePrimeagen/harpoon',
   'unblevable/quick-scope' ,
   'ggandor/leap.nvim' ,

  -- telescope
   'nvim-lua/popup.nvim',
   'nvim-lua/plenary.nvim',
   'nvim-telescope/telescope.nvim',
   'nvim-telescope/telescope-file-browser.nvim',

  -- Status line
   'nvim-lualine/lualine.nvim',

  -- Which-key
 
   'liuchengxu/vim-which-key',
    'AckslD/nvim-whichkey-setup.lua',
  -- Test coverage
   'andythigpen/nvim-coverage',

  -- fancy screenshots
   {'krivahtoo/silicon.nvim', build = './install.sh'},

  --html auto rename tags
   'AndrewRadev/tagalong.vim',

  -- color theme
   'folke/lsp-colors.nvim',
   'Shatur/neovim-ayu',
   'bluz71/vim-nightfly-guicolors',
   'rafalbromirski/vim-aurora',
   'tiagovla/tokyodark.nvim',

  -- syntax files
   'HerringtonDarkholme/yats.vim'
 } )