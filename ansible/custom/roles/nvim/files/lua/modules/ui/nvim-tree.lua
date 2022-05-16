local ok, _ = pcall(require, 'nvim-tree')
if not ok then return end

local vim = vim
local g = vim.g

g.nvim_tree_git_hl = 0
g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_root_folder_modifier = ':~'
g.nvim_tree_add_trailing = 1
g.nvim_tree_group_empty = 1
g.nvim_tree_icon_padding = ' '
g.nvim_tree_symlink_arrow = ' >> '
g.nvim_tree_respect_buf_cwd = 1
g.nvim_tree_create_in_closed_folder = 0
-- g.nvim_tree_refresh_wait = 500

g.nvim_tree_special_files = { 'README.md', 'Makefile', 'MAKEFILE', 'go.mod' }
g.nvim_tree_show_icons = {
  git = 0,
  folders = 1,
  files = 1,
  folder_arrows = 1,
  }
g.nvim_tree_icons = {
  default = '',
  symlink = '',
  git = {
    unstaged  = '窱',
    staged    = '✓',
    unmerged  = '',
    renamed   = '➜',
    untracked = '★',
    deleted   = '',
    ignored   = '◌',
  },
  folder = {
    arrow_open   = '',
    arrow_closed = '',
    default      = '',
    open         = '',
    empty        = '',
    empty_open   = '',
    symlink      = '',
    symlink_open = '',
  },
}

require('nvim-tree').setup {
  auto_reload_on_write = true,
  disable_netrw        = true,
  hijack_cursor        = false,
  hijack_netrw         = true,
  hijack_unnamed_buffer_when_opening = false,
  ignore_buffer_on_setup = false,
  ignore_ft_on_setup   = {},
  open_on_setup        = false,
  open_on_setup_file = false,
  open_on_tab = false,
  sort_by = "name",
  -- auto_close           = false,
  update_cwd           = false,
  -- update_to_buf_dir    = {
  --   enable = true,
  --   auto_open = true,
  -- },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    preserve_window_proportions = false,
    -- auto_resize = false,
    number = false,
    relativenumber = false,
    signcolumn = 'yes',
    mappings = {
      custom_only = false,
      list = {},
    },
  },
  renderer = {
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
    },
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    open_file = {
      quit_on_open = false,
      resize_window = false,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = {
            'notify',
            'packer',
            'qf',
            'diff',
            'fugitive',
            'fugitiveblame',
          },
          buftype = {
            'terminal',
            'help',
          }
        },
      },
    }
  },
  diagnostics = {
    enable = false,
    show_on_dirs = false,
    icons = {
      hint = '',
      info = '',
      warning = '',
      error = '',
    }
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {},
  },
  system_open = {
    cmd  = '',
    args = {},
  },
  filters = {
    dotfiles = false,
    custom = {},
    exclude = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  trash = {
    cmd = 'trash',
    require_confirm = true,
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      diagnostics = false,
      git = false,
      profile = false,
    },
  },
}
