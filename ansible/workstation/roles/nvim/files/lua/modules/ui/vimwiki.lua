local g = vim.g

g.vimwiki_global_ext = 0  -- Disable wimwiki for any other markdown file
g.vimwiki_list = {
  {
    path = '~/vimwiki',
    syntax = 'markdown',
    ext = '.md',
  },
  {
    path = '~/code/github.com/dzintars/infra/docs/',
    syntax = 'markdown',
    ext = '.md',
  },
  {
    path = '~/code/github.com/dzintars/obsidian/',
    syntax = 'markdown',
    ext = '.md',
  },
}

