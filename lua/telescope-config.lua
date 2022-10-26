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
        ["q"] = actions.close
      },
    },
  }
}

require("telescope").load_extension "file_browser"
