local is_installed, packer = pcall(require, 'packer')
local use = packer.use

local function bootstrap()
	local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
		vim.fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
		vim.api.nvim_command('packadd packer.nvim')
		vim.notify('Packer installed. Please restart Neovim and run :PackerSync to install all plugins.')
	end
end

if not is_installed then
	bootstrap()
else
	packer.init({
		display = {
			open_fn = function()
				return require('packer.util').float({ border = 'rounded' })
			end,
		},
		profile = {
			enable = true,
			threshold = 1,
		},
	})
	packer.startup(function()
		local ui = require('modules.ui')
		local editor = require('modules.editor')
		local completion = require('modules.completion')
		local lsp = require('modules.lsp')
		-- local dap = require("modules.dap")

		use({ 'wbthomason/packer.nvim' })

		-- UI
		use(ui.theme())
		-- use(ui.filemanager())
		-- use(ui.netrw())
		use(ui.nerdtree())
		use(ui.statusline())
		use(ui.lualinelspprogress())
		use(ui.telescope())
		use(ui.dashboard())
		-- use(ui.fugitive())
		use(ui.vimrooter())
		use(ui.lazygit())
		use(ui.whichkey())
		-- use(ui.vimwiki())
		-- use(ui.telekasten())
		-- use(ui.vimzettel())
		use(ui.zknvim())
		use(ui.nvimnotify())
		use(ui.startuptime())
		use(ui.symbols())

		-- Editor
		use(editor.treesitter())
		use(editor.gitsigns())
		use(editor.comment())
		-- use(editor.indentline())
		use(editor.editorconfig())
		use(editor.vimbazel())
		-- use(editor.vimjinja())  -- I think ansible-vim has better Jinja2 support
		-- use(editor.ansiblevim())
		use(editor.vimmarkdownfootnotes())
		use(editor.csscolor())

		-- Completion
		use(completion.cmp())
		use(completion.snippets())

		-- LSP
		use(lsp.config())
		use(lsp.null_ls())
		use(lsp.trouble())
		-- use(lsp.installer())  -- I think installing servers on my own is bit more flexible
		use(lsp.saga())
		-- use(lsp.signture())
		use(lsp.lspcolors())
		-- use(lsp.rusttools())

		-- DAP
		-- use(dap.config())
	end)
end
