return {
	'blindFS/vim-taskwarrior',
	enabled = false,
	lazy = false,
	config = function()
		vim.g.task_rc_override = 'rc.defaultwidth=0'
		vim.g.default_rc_override = 'rc.defaultheight=0'
	end,
}
