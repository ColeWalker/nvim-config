local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.g.mapleader = ","
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.number = true
vim.o.relativenumber = true
vim.o.linebreak = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn="yes"
vim.o.laststatus=3
vim.o.termguicolors = true
vim.o.foldlevel= 99

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
vim.loader.enable()

require('lazy').setup({
  -- Plugin Section

  -- {"github/copilot.vim"},
  {
    "folke/zen-mode.nvim",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  "nvim-tree/nvim-web-devicons",
  -- {
  -- 'stevearc/oil.nvim',
  -- opts = {},
  -- -- Optional dependencies
  -- dependencies = {  },
  -- config = function()
  --   require("oil").setup()
  -- end

-- },
  { "zbirenbaum/copilot.lua", 
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  },
  { 
    "williamboman/mason.nvim", 
    lazy = true, 
    config=function()
      require( "mason" ).setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim", 
    config=function()
      require( "mason-lspconfig" ).setup{
        ensure_installed = { "tsserver", "cssls", "cssmodules_ls" },
        automatic_installation = false,
      }
    end
  },
  { 'neovim/nvim-lspconfig', config=function()
      require('lsp-config')
  end},
  {
    'mfussenegger/nvim-lint',
    config=function()
      local lint = require("lint")
        lint.linters_by_ft = {
            javascript = {
                "eslint_d"
            },
            typescript = {
                "eslint_d"
            },
            javascriptreact = {
                "eslint_d"
            },
            typescriptreact = {
                "eslint_d"
            },
            -- ruby = {
            --   "rubocop"
            -- }
        }
        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
    end
  },
  {
    "mhartington/formatter.nvim",
    config = function()
        local formatter = require("formatter")
        local default_formatters = require("formatter.defaults")
        local prettierd = default_formatters.prettierd
        local rubocop = default_formatters.rubocop
        local stylua = default_formatters.stylua
        formatter.setup({
            filetype = {
                javascript = {
                    prettierd
                },
                javascriptreact = {
                    prettierd
                },
                typescript = {
                    prettierd
                },
                typescriptreact = {
                    prettierd
                },
                css = {
                  prettierd
                },
                scss = {
                  prettierd
                },
                lua = {
                    stylua
                },
                 ruby = {
                  function()
                    return {
                      exe = 'bundle exec rubocop',
                      args = {
                        '--fix-layout',
                        '--stdin',
                        util.escape_path(util.get_current_buffer_file_name()),
                        '--format',
                        'files',
                        '|',
                        "awk 'f; /^====================$/{f=1}'",
                      },
                      stdin = true,
                    }
                end,
      },
                -- ruby = {
                --   rubocop
                -- }

            }

        })
    end
  },
  {
      'barrett-ruth/import-cost.nvim',
      build = 'sh install.sh yarn',
      config = function()
        require('import-cost').setup()
      end
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },
  'nvim-treesitter/nvim-treesitter-textobjects',
  'nvim-treesitter/nvim-treesitter-context',
  -- 'HiPhish/nvim-ts-rainbow2',

  --  'jbgutierrez/vim-better-comments'
   {'akinsho/bufferline.nvim', config = function()
      require("bufferline").setup{}
   end },

  { 'echasnovski/mini.nvim', version = false, config = function()
      mini_files = require('mini.files')
      require('mini.cursorword').setup()
      mini_files.setup()

      -- keybinds
      vim.keymap.set("n", "<leader>xf", function() mini_files.open() end)
    end
  },
  {
    "nvimdev/lspsaga.nvim",
    branch = "main",
    config = function()
      require("lspsaga").setup({})
    end,
    event="BufRead"
  },

  { 'tpope/vim-fugitive' },

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
  -- {
  --   "windwp/nvim-autopairs",
  --   config = function() require("nvim-autopairs").setup {} end
  -- },
  'tpope/vim-commentary',
  'suy/vim-context-commentstring',
  'JoosepAlviste/nvim-ts-context-commentstring',
  { 'ojroques/vim-oscyank', branch = 'main' },
  'tpope/vim-unimpaired',
  -- { 'xorid/swap-split.nvim', lazy = true },
  {
    "folke/trouble.nvim",
    config = function()
      trouble = require("trouble")
      trouble.setup {
        -- your configuration comes here
        -- or leave it empty to  the default settings
        -- refer to the configuration section below
        mode = "document_diagnostics"
      }
      vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
      vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
      vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
      vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
      vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
      vim.keymap.set("n", "xs", function() require("trouble").toggle("lsp_references") end)

    end
  },

  -- Smooth scroll
  { 'karb94/neoscroll.nvim', config=function()
    require('neoscroll').setup({
    })
    local t = {}
    t['<C-u>'] = {'scroll', {'-vim.wo.scroll', 'true', '125'}}
    t['<C-d>'] = {'scroll', { 'vim.wo.scroll', 'true', '125'}}
    
    require('neoscroll.config').set_mappings(t) 
  end },

  -- Ruby
  { 'tpope/vim-rails', lazy = true, event="BufRead"},

  -- Testing
  { 'vim-test/vim-test', lazy = true, event="BufRead" },

  -- autocomplete nvim-cmp
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  {
    "zbirenbaum/copilot-cmp",
    config = function ()
      require("copilot_cmp").setup()
    end
  },
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/cmp-nvim-lsp-document-symbol',
  'hrsh7th/cmp-nvim-lsp-signature-help',
  { 'hrsh7th/nvim-cmp', config=function()
require("nvim-cmp-config")
  end },

  -- { 'mrjones2014/legendary.nvim', lazy = true },

  -- snippet tool
  'hrsh7th/cmp-vsnip',
  'hrsh7th/vim-vsnip',
  'hrsh7th/vim-vsnip-integ',

  -- snippets
  { "rafamadriz/friendly-snippets" },
  -- { 'ults-io/vscode-react-javascript-snippets',
    -- build = 'yarn install --frozen-lockfile && yarn compile'
  -- },

  -- Navigation
  { 'ThePrimeagen/harpoon', config = function()
    harpoon_ui = require("harpoon.ui")
    harpoon_mark = require("harpoon.mark")

    vim.keymap.set("n", "<leader>hm", function() harpoon_mark.add_file() end)
    vim.keymap.set("n", "<leader>hv", function() harpoon_ui.toggle_quick_menu() end)
    vim.keymap.set("n", "<leader>hl", function() harpoon_ui.nav_next() end)
    vim.keymap.set("n", "<leader>hh", function() harpoon_ui.nav_prev() end)
  end
  },
  'unblevable/quick-scope',
  { 'ggandor/leap.nvim', config=function()
    require('leap').set_default_keymaps()
  end},

  -- telescope
  -- 'nvim-lua/popup.nvim',
  'nvim-lua/plenary.nvim',
  { 'nvim-telescope/telescope.nvim', config=function()
    require("telescope-config")
  end },
  'nvim-telescope/telescope-file-browser.nvim',

  -- Status line
  { 'nvim-lualine/lualine.nvim', config=function()
    require("lualine-config")
  end },

  { 
    'ruifm/gitlinker.nvim',
    config = function()
      require("gitlinker").setup({
        opts = {
          action_callback=require"gitlinker.actions".open_in_browser
        },
        mappings = "<leader>gb"

      })

    end
  },

  -- { 'liuchengxu/vim-which-key', lazy = true },
  -- { 'AckslD/nvim-whichkey-setup.lua', lazy = true },
  -- Test coverage
  { 'andythigpen/nvim-coverage', config=function()
    require('coverage').setup()
  end},

  -- fancy screenshots
  -- { 'krivahtoo/silicon.nvim', build = './install.sh', lazy = true },

  --html auto rename tags
  -- 'AndrewRadev/tagalong.vim',

--   {
--     'windwp/nvim-ts-autotag',
--     config=function()
--       require('nvim-ts-autotag').setup()
--     end

--   },
  -- color theme
  {
  'uloco/bluloco.nvim',
  lazy = false,
  priority = 1000,
  dependencies = { 'rktjmp/lush.nvim' },
  config = function()
    require("bluloco").setup({
      terminal = vim.fn.has("gui_running") == 1,
      transparent=true,
    })
    -- your optional config goes here, see below.
  end,
  },
  'folke/lsp-colors.nvim',
  { 'Shatur/neovim-ayu', lazy = true },
  { "catppuccin/nvim", name = "catppuccin" },
  -- current color theme should NOT be lazy loaded
  { 'bluz71/vim-nightfly-guicolors', lazy = false },
  { 'rafalbromirski/vim-aurora', lazy = true },
  { 'tiagovla/tokyodark.nvim', lazy = true },

  -- syntax files
  'HerringtonDarkholme/yats.vim'
})

-- vim.opt.showbreak = ">>>"
vim.opt.showbreak = " 󱞪 "
-- vim.cmd("command! Fug lua print()")
-- vim.api.nvim_set_keymap('n', '<leader>gb', '<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr>', {silent = true})

