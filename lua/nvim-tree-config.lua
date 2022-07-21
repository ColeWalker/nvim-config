require("nvim-tree").setup({
  open_on_setup = false,
  open_on_setup_file = false,
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    side="left",
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
  git = {
    ignore=false,
  },
})

