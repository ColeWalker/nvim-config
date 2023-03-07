local lspconfig = require("lspconfig")
local cmp = require 'cmp'



local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end -- Mappings.

  local opts = { noremap = true, silent = true }
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  --...
  vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
  vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
  vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
  vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
  vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
  vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
  vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
  vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
  vim.cmd("command! LspDiagPrev lua vim.diagnostic.goto_prev()")
  vim.cmd("command! LspDiagNext lua vim.diagnostic.goto_next()")
  vim.cmd("command! LspDiagLine lua vim.diagnostic.open_float()")
  vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")
  if client.server_capabilities.documentFormattingProvider then
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format { async = false}")
  end
end


local capabilities = require('cmp_nvim_lsp').default_capabilities()


lspconfig.cssls.setup {
  capabilities = capabilities
}


ts_options = {
  init_options = {
    preferences = {
      importModuleSpecifierPreference = "project-relative"
    }
  },
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}

require("typescript").setup({
  disable_commands = false, -- prevent the plugin from creating Vim commands
  debug = false, -- enable debug logging for commands
  go_to_source_definition = {
    fallback = true, -- fall back to standard LSP definition on failure
  },
  server = ts_options
})


lspconfig.solargraph.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false

    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
  settings = {
    solargraph = {
      autoformat = false,
      formatting = false
    }
  }
}
lspconfig.sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
  end,

}

require 'nvim-treesitter.configs'.setup {
  context_commentstring = true,
  ensure_installed = "all",
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  rainbow = {
    enable = true,
    extended_mode = true
  },
  textobjects = {
    lsp_interop = {
      enable = true,
      border = 'none',
      peek_definition_code = {
        ["<leader>df"] = "@function.outer",
        ["<leader>dF"] = "@class.outer",
      },
    },
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["ib"] = "@block.inner",
        ["ab"] = "@block.outer",
      },
    },
    rainbow = {
      enable = true,
      extended_mode = true
    }
  },
}

local vim = vim
local opt = vim.o

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.api.nvim_create_autocmd({ "BufEnter" }, { pattern = { "*" }, command = "normal zx", })

local null_ls = require('null-ls')
null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.formatting.prettierd.with({
      disabled_filetypes = { "json" },
    }),
    null_ls.builtins.diagnostics.rubocop.with({
      command = "bundle",
      -- TODO: check if .rubocop-future exists, if not, just bundle exec rubocop
      args = vim.list_extend({ 'exec', 'rubocop', '-c', '.rubocop-future.yml' },
        null_ls.builtins.diagnostics.rubocop._opts.args)
    }),
    null_ls.builtins.formatting.rubocop.with({
      command = "bundle",
      args = vim.list_extend({ 'exec', 'rubocop' }, null_ls.builtins.formatting.rubocop._opts.args)
    }),
  },
  on_attach = function(client, bufnr)
    -- client.name="null-ls-1"
    on_attach(client, bufnr)
  end,
})

-- null_ls.setup({
--   sources = {
--     null_ls.builtins.diagnostics.rubocop,
--     null_ls.builtins.formatting.rubocop,
--     null_ls.builtins.formatting.rufo
--   },
--   on_attach = function(client, bufnr)
--     client.name="null-ls-2"
--     print('hello')
--     on_attach(client,bufnr)
--   end,
-- })
