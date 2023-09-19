vim.cmd('filetype plugin on')
vim.cmd('filetype indent off')
vim.cmd('syntax on')

vim.g.mapleader = ','
vim.g.maplocalleader = '\\'

-- Tabs
vim.opt.shiftwidth = 2
vim.opt.expandtab = false -- Replaces tab characters with the space characters
vim.opt.tabstop = 2 -- Display each tab 2 spaces wide
vim.opt.softtabstop = 2 -- How many spaces tab or backspace keypress is worth
vim.opt.smarttab = true -- Makes tabs smarter. Recognizes that you have 2 vs 4 etc

-- Indentation
vim.opt.smartindent = true
vim.opt.autoindent = true -- Copy indent from current line when starting a new line
vim.opt.preserveindent = true
vim.opt.shiftround = false -- Don't always indent by multiple of shiftwidth
vim.opt.backspace = 'indent,start,eol' -- Allow unrestricted backspacing in insert mode
vim.opt.signcolumn = 'yes' -- Always show the signcolum, otherwise it would shift the text each time

vim.opt.clipboard = 'unnamedplus' -- Copy into primary clipboard
vim.opt.mouse = 'a' -- Enables mouse support
vim.opt.number = true -- Show line numbers for current line in the gutter
vim.opt.relativenumber = true -- Enable relative line numbers
vim.opt.scrolloff = 4 -- Minimal number of screen lines to keep above and below the cursor

-- Undo
vim.opt.undolevels = 1000 -- Maximum number of changes that can be undone
vim.opt.undofile = true -- Enable undo history writing into the file
-- vim.opt.undodir = config .. "/undodir//" -- Set the undo file directory
vim.opt.undodir = '/home/dzintars/.tmp/undodir/' -- Set the undo file directory
vim.opt.undoreload = 10000 -- Maximum number lines to save for undo and buffer reload

vim.opt.list = true -- Display whitespaces
vim.opt.listchars = {
	nbsp = '⦸', -- CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
	extends = '»', -- RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
	precedes = '«', -- LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
	tab = '▷⋯', -- WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7) + MIDLINE HORIZONTAL ELLIPSIS (U+22EF, UTF-8: E2 8B AF)
	trail = '•', -- BULLET (U+2022, UTF-8: E2 80 A2)
	space = '⋅',
	eol = '↴',
}

vim.opt.wildmenu = true
vim.opt.wildmode = 'longest:full,full'
vim.opt.wildoptions = 'pum'

-- Enable folding
vim.opt.foldenable = true
vim.opt.foldmethod = 'expr'
vim.opt.foldlevel = 1
vim.opt.foldlevelstart = 1
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:,diff:⋅]]

-- https://github.com/nvim-telescope/telescope.nvim/issues/699
vim.wo.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.wo.foldenable = false -- can be enabled directly in opened file - using 'zi' - toogle fold

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
