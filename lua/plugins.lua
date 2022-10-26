vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
  -- Plugin Section
  use 'wbthomason/packer.nvim'

  -- LSP / Syntax highlighting / formatting
  use 'neovim/nvim-lspconfig'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'nvim-treesitter/nvim-treesitter-context'
  -- use 'jbgutierrez/vim-better-comments'  
  use 'RRethy/vim-illuminate'
  use {
    "glepnir/lspsaga.nvim",
    branch = "main",
  }  
  -- Text objects
  use 'michaeljsmith/vim-indent-object'

  -- use 'ptzz/lf.vim'

  -- Git
  -- use 'akinsho/git-conflict.nvim'
  use 'tpope/vim-fugitive'

  -- Floating Terminal
  use 'voldikss/vim-floaterm'

  -- use 'ruanyl/coverage.vim'
  -- File tree
  use 'kyazdani42/nvim-web-devicons'
  -- use 'kyazdani42/nvim-tree.lua'
  
  -- Actions
  use 'machakann/vim-sandwich'
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
})
  use 'tpope/vim-commentary' 
  use {'ojroques/vim-oscyank', branch= 'main'}

  -- Smooth scroll
  use 'karb94/neoscroll.nvim'

  -- Ruby
  use 'tpope/vim-rails'

  -- Testing
  use 'vim-test/vim-test'

    -- autocomplete nvim-cmp
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'


  -- snippet tool 
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'

  -- snippets
  use {'dsznajder/vscode-es7-javascript-react-snippets',
    run = 'yarn install --frozen-lockfile && yarn compile'
  }

  -- Navigation
  use 'ThePrimeagen/harpoon'
  use 'unblevable/quick-scope' 
  use 'ggandor/leap.nvim' 

  -- telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'

  -- Status line
  use 'nvim-lualine/lualine.nvim'

  -- Which-key
  use 'liuchengxu/vim-which-key'

  -- Test coverage
  use 'andythigpen/nvim-coverage'

  -- fancy screenshots
  use {'krivahtoo/silicon.nvim', run = './install.sh'}

  --html auto rename tags
  use 'AndrewRadev/tagalong.vim'

  -- color theme
  use 'Shatur/neovim-ayu'
  use 'bluz71/vim-nightfly-guicolors'
  use 'rafalbromirski/vim-aurora'
  use 'tiagovla/tokyodark.nvim'

end)
