local actions = require('telescope.actions')

require('telescope').setup{
  defaults = {
    file_ignore_patterns = { "node%_modules/.*", ".git/.*" },
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  }
}
