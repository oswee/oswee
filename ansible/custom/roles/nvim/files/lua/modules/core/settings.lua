local vim    = vim
local set    = vim.opt
local cmd    = vim.cmd
local g      = set
local home   = vim.env.HOME
local config = home .. '/.config/nvim'
local has    = vim.fn.has

cmd('filetype plugin on')
cmd('filetype indent off')
cmd('syntax on')

-- To read the what each does use `:h <setting name>` or `:options`

set.shortmess      = set.shortmess + 'c'            --
set.iskeyword      = set.iskeyword + '-'            -- Treat dash separated words as a word text object (when navigating with `w` and `b`)
set.compatible     = false                          --
if not has('gui_running') then
  set.t_Co = 256
end
set.background     = 'dark'                         -- Tell the VIM what the background color looks like (does not change the background itself)
if has('+termguicolors') then
  cmd('let &t_8f = "\\<Esc>[38;2;%lu;%lu;%lum"')
  cmd('let &t_8b = "\\<Esc>[48;2;%lu;%lu;%lum"')
  set.termguicolors = true
end
set.autochdir      = true
set.fileencoding   = 'UTF-8'                        -- File-content encoding for the current buffer
set.hidden         = true                           -- Hide buffers instead of closing them
set.wrap           = false                          -- Long line wrapping
set.clipboard      = 'unnamedplus'                  -- Copy into primary clipboard
set.mouse          = 'a'                            -- Enables mouse support
set.number         = true                           -- Show relative line number for current line in the gutter
set.relativenumber = true                           -- Enable ralative line numbers
set.undolevels     = 1000                           -- Maximum number of changes that can be undone

-- local undodir = "/tmp/.vim-undo-dir"
-- if fn.isdirectory(undodir) == 0 then fn.mkdir(undodir, "", 0755) end
-- set.undodir = undodir

set.undofile       = true                           -- Enable undo history writing into the file
set.undodir        = config .. '/undodir//'         -- Set the undo file directory
set.undoreload     = 10000                          -- Maximum number lines to save for undo and buffer reload
set.shiftwidth     = 2                              -- Number of space characters inserted for the indentation
set.tabstop        = 2                              -- Replace tab with 2 spaces
set.expandtab      = true                           -- Replaces tabs with spaces
set.softtabstop    = 2
set.autoindent     = true                           -- Copy indent from current line when starting a new line
set.smarttab       = true                           -- Makes tabs smarter. Recognizes that you have 2 vs 4 etc
set.smartindent    = true
set.shiftround     = false                          -- Don't always indent by multiple of shiftwidth
set.backspace      = 'indent,start,eol'             -- Allow unrestricted backspacing in insert mode
set.signcolumn     = 'yes'                          -- Always show the signcolum, otherwise it would shift the text each time
set.swapfile       = false                          --
set.showmode       = false                          -- Hide vimmode from the commandline
set.updatetime     = 300                            -- Faster completion
set.timeoutlen     = 500                            -- Default timeout len is 1000ms
set.pumheight      = 10                             -- Make popup menu smaller
set.ruler          = true                           -- Show cursor position all the time
set.cmdheight      = 2                              -- Give more space for the displayed messages at the bottom
set.modeline       = true                           -- Enable modelines. At the top of the file Vim commands can be placed and auto executed
set.modelines      = 5                              -- How many lines in the file to look for the Vim commands (Potential danger ahead!)
set.conceallevel   = 0                              -- Enable `` visibility in the markdown files
set.laststatus     = 2                              -- Always display the status line
set.backup         = false                          --
set.writebackup    = false                          --
set.linebreak      = true                           -- Wrap long lines at characters in 'breakat'
set.list           = true                           -- Show whitespaces
set.listchars      = {
  nbsp               = '⦸',                           -- CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
  extends            = '»',                           -- RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
  precedes           = '«',                           -- LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
  tab                = '▷⋯',                          -- WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7) + MIDLINE HORIZONTAL ELLIPSIS (U+22EF, UTF-8: E2 8B AF)
  trail              = '•',                           -- BULLET (U+2022, UTF-8: E2 80 A2)
}
set.scrolloff      = 3                              -- Number of screen lines to show around the cursor
set.shell          = '/usr/bin/sh'                  -- Shell to use for `!`, `:!`, `system()` etc.
set.completeopt    = 'menuone'                      -- Whether to use a popup menu for Insert mode completion
set.completeopt    = set.completeopt + 'noselect'   -- don't automatically select canditate (for nvim-compe)
set.endofline      = true                           -- Last line in the file has an end-of-line
set.fixendofline   = true                           -- Fixed missing end-of-line at end of the text file
set.splitright     = true
set.splitbelow     = true
set.foldmethod     = 'marker'
set.ignorecase     = true
set.smartcase      = true

set.sessionoptions = "blank"                        -- Save empty windows

-- airblade/vim-rooter
-- g.rooter_patterns = {'.git', 'WORKSPACE', 'Makefile',}

-- Disable distribution plugins
-- set.loaded_gzip = 1
-- set.loaded_tar = 1
-- set.loaded_tarPlugin = 1
-- set.loaded_zip = 1
-- set.loaded_zipPlugin = 1
-- set.loaded_getscript = 1
-- set.loaded_getscriptPlugin = 1
-- set.loaded_vimball = 1
-- set.loaded_vimballPlugin = 1
-- set.loaded_matchit = 1
-- set.loaded_matchparen = 1
-- set.loaded_2html_plugin = 1
-- set.loaded_logiPat = 1
-- set.loaded_rrhelper = 1
-- set.loaded_netrw = 1
-- set.loaded_netrwPlugin = 1
-- set.loaded_netrwSettings = 1
-- set.loaded_netrwfilehandlers = 1
