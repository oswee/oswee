local set = vim.opt
local cmd = vim.cmd
local home = vim.env.HOME
local config = home .. "/.config/nvim"
local has = vim.fn.has

cmd("filetype plugin on")
cmd("filetype indent off")
cmd("syntax on")

vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- https://www.reddit.com/r/neovim/comments/rvwsl3/introducing_filetypelua_and_a_call_for_help/
-- vim.g.do_filetype_lua = true
vim.g.did_load_filetypes = false

-- if vim.opt.diff:get() then
--   vim.opt.foldopen = ''
-- else
--   vim.opt.foldopen = 'all'
-- end

-- To read the what each does use `:h <setting name>` or `:options`

-- TODO: Git this right
-- set.confirm = true
-- set.guioptions = set.guioptions + "c"

set.shortmess = set.shortmess + "c" --
set.iskeyword = set.iskeyword + "-" -- Treat dash separated words as a word text object (when navigating with `w` and `b`)
set.compatible = false --
if not has("gui_running") then
	set.t_Co = 256
end
if has("+termguicolors") then
	cmd('let &t_8f = "\\<Esc>[38;2;%lu;%lu;%lum"')
	cmd('let &t_8b = "\\<Esc>[48;2;%lu;%lu;%lum"')
	set.termguicolors = true
end
set.autochdir = true
set.fileencoding = "UTF-8" -- File-content encoding for the current buffer
set.hidden = true -- Hide buffers instead of closing them
set.wrap = false -- Long line wrapping
set.clipboard = "unnamedplus" -- Copy into primary clipboard
set.mouse = "a" -- Enables mouse support
set.number = true -- Show line numbers for current line in the gutter
set.relativenumber = false -- Enable relative line numbers
set.undolevels = 1000 -- Maximum number of changes that can be undone

-- local undodir = "/tmp/.vim-undo-dir"
-- if fn.isdirectory(undodir) == 0 then fn.mkdir(undodir, "", 0755) end
-- set.undodir = undodir

set.undofile = true -- Enable undo history writing into the file
-- set.undodir = config .. "/undodir//" -- Set the undo file directory
set.undodir = "/home/dzintars/.tmp/undodir/" -- Set the undo file directory
set.undoreload = 10000 -- Maximum number lines to save for undo and buffer reload

-- Tabs
set.shiftwidth = 2 -- Number of space characters displayed for the indentation
set.expandtab = false -- Replaces tab characters with the space characters
set.tabstop = 2 -- Display each tab 2 spaces wide
set.softtabstop = 2 -- How many spaces tab or backspace keypress is worth
set.smarttab = true -- Makes tabs smarter. Recognizes that you have 2 vs 4 etc
set.list = true -- Display whitespaces
set.listchars = {
	nbsp = "⦸", -- CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
	extends = "»", -- RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
	precedes = "«", -- LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
	tab = "▷⋯", -- WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7) + MIDLINE HORIZONTAL ELLIPSIS (U+22EF, UTF-8: E2 8B AF)
	trail = "•", -- BULLET (U+2022, UTF-8: E2 80 A2)
}

-- Indentation
set.smartindent = true
set.autoindent = true -- Copy indent from current line when starting a new line
set.preserveindent = true
set.shiftround = false -- Don't always indent by multiple of shiftwidth
set.backspace = "indent,start,eol" -- Allow unrestricted backspacing in insert mode
set.signcolumn = "yes" -- Always show the signcolum, otherwise it would shift the text each time
set.swapfile = false --
set.showmode = false -- Hide vimmode from the commandline
set.updatetime = 300 -- Faster completion
set.timeoutlen = 500 -- Default timeout len is 1000ms
set.pumheight = 10 -- Make popup menu smaller
set.ruler = true -- Show cursor position all the time
set.cmdheight = 2 -- Give more space for the displayed messages at the bottom
set.modeline = true -- Enable modelines. At the top of the file Vim commands can be placed and auto executed
set.modelines = 5 -- How many lines in the file to look for the Vim commands (Potential danger ahead!)
set.conceallevel = 0 -- Enable `` visibility in the markdown files
set.laststatus = 2 -- Always display the status line
set.backup = false --
set.writebackup = false --
set.linebreak = true -- Wrap long lines at characters in 'breakat'
set.scrolloff = 3 -- Number of screen lines to show around the cursor
set.shell = "/usr/bin/sh" -- Shell to use for `!`, `:!`, `system()` etc.
set.completeopt = "menuone" -- Whether to use a popup menu for Insert mode completion
set.completeopt = set.completeopt + "noselect" -- don't automatically select canditate (for nvim-compe)
set.endofline = true -- Last line in the file has an end-of-line
set.fixendofline = true -- Fixed missing end-of-line at end of the text file

-- Windows --
-- set.splitright = true
-- set.splitbelow = true
-- set.eadirection = "hor"

-- set.foldmethod     = 'marker'                       -- Most likely this is overrided by TreeSitter config
set.ignorecase = true
set.smartcase = true

-- Sessions
set.sessionoptions = "blank" -- Save empty windows
vim.g.session_dir = config .. "/sessions"

-- airblade/vim-rooter
-- g.rooter_patterns = {'.git', 'WORKSPACE', 'Makefile',}

-- Disable distribution plugins
vim.g.loaded_gzip = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1

-- Disable Netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwfilehandlers = 1

vim.g.markdown_fenced_languages = { "bash", "lua", "go", "html", "python", "ruby", "vim", "css", "vim", "hcl" }
