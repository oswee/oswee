local lc = require('helpers.common').loadConfig

local Ui = {}

function Ui.devicons()
	return {
		'kyazdani42/nvim-web-devicons',
		opt = true,
	}
end

function Ui.nvimnotify()
	return {
		'rcarriga/nvim-notify',
		requires = Ui.telescope(),
		config = lc(require('modules.ui.notify')),
	}
end

function Ui.theme()
	return {
		'ellisonleao/gruvbox.nvim',
		requires = { 'rktjmp/lush.nvim' },
		config = lc(require('modules.ui.gruvbox')),
	}
end

function Ui.netrw()
	return {
		config = lc(require('modules.ui.netrw')),
	}
end

function Ui.nerdtree()
	return {
		'preservim/nerdtree',
		wants = 'nvim-web-devicons',
		requires = Ui.devicons(),
		config = lc(require('modules.ui.nerdtree')),
	}
end

function Ui.nvimtree()
	return {
		'kyazdani42/nvim-tree.lua',
		wants = 'nvim-web-devicons',
		requires = Ui.devicons(),
		config = lc(require('modules.ui.nvim-tree')),
	}
end

function Ui.statusline()
	return {
		'hoob3rt/lualine.nvim',
		wants = 'nvim-web-devicons',
		requires = {
			Ui.devicons(),
			Ui.lualinelspprogress(),
		},
		config = lc(require('modules.ui.lualine')),
	}
end

function Ui.lualinelspprogress()
	return {
		'arkav/lualine-lsp-progress',
		config = lc(require('modules.ui.lualine-lsp-progress')),
	}
end

function Ui.telescope()
	return {
		'nvim-telescope/telescope.nvim',
		requires = {
			{ 'nvim-lua/popup.nvim' },
			{ 'nvim-lua/plenary.nvim' },
			{ 'nvim-telescope/telescope-fzy-native.nvim' },
			{ 'jvgrootveld/telescope-zoxide' },
			{ 'nvim-telescope/telescope-media-files.nvim' },
			{ 'nvim-telescope/telescope-file-browser.nvim' },
		},
		config = lc(require('modules.ui.telescope')),
	}
end

function Ui.dashboard()
	return {
		'glepnir/dashboard-nvim',
		requires = Ui.telescope(),
		config = lc(require('modules.ui.dashboard')),
	}
end

function Ui.whichkey()
	return {
		'folke/which-key.nvim',
		config = lc(require('modules.ui.which-key')),
	}
end

function Ui.vimwiki()
	return {
		'vimwiki/vimwiki',
		config = lc(require('modules.ui.vimwiki')),
	}
end

function Ui.vimzettel()
	return {
		'michal-h21/vim-zettel',
		requires = {
			{ 'vimwiki/vimwiki' },
			{ 'junegunn/fzf' },
			{ 'junegunn/fzf.vim' },
		},
		config = lc(require('modules.ui.vimzettel')),
	}
end

function Ui.symbols()
	return {
		'simrat39/symbols-outline.nvim',
		config = lc(require('modules.ui.symbols-outline')),
	}
end

function Ui.fugitive()
	return {
		'tpope/vim-fugitive',
	}
end

function Ui.vimrooter()
	return {
		'airblade/vim-rooter',
	}
end

function Ui.lazygit()
	return {
		'kdheepak/lazygit.nvim',
		config = lc(require('modules.ui.lazygit')),
	}
end

function Ui.startuptime()
	return {
		'dstein64/vim-startuptime',
		cmd = 'StartupTime',
	}
end

function Ui.telekasten()
	return {
		'renerocksai/telekasten.nvim',
		requires = {
			{ 'nvim-telescope/telescope.nvim' },
			{ 'renerocksai/calendar-vim' },
		},
		config = lc(require('modules.ui.telekasten')),
	}
end

function Ui.zknvim()
	return {
		'mickael-menu/zk-nvim',
		-- requires = {
		-- 	{ "nvim-telescope/telescope.nvim" },
		-- 	{ "renerocksai/calendar-vim" },
		-- },
		config = lc(require('modules.ui.zk-nvim')),
	}
end

function Ui.noice()
	return {
		'folke/noice.nvim',
		event = 'VimEnter',
		requires = {
			{ 'MunifTanjim/nui.nvim' },
			{ 'rcarriga/nvim-notify' },
		},
		config = lc(require('modules.ui.noice')),
	}
end

return Ui
