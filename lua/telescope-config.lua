local actions = require('telescope.actions')

require('telescope').setup{
  extensions={
    file_browser={
      
    },
  },
  defaults = {
    file_ignore_patterns = { "node%_modules/.*", ".git/.*" },
    mappings = {
      n = {
        ["q"] = actions.close,
        ['<c-t>'] = actions.delete_buffer
      },
      i = {
        ['<c-t>'] = actions.delete_buffer
      }
    },
  }
}

require("telescope").load_extension "file_browser"
