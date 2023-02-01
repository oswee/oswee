local null_ls = require("null-ls")

local zk_custom_actions = {
	method = null_ls.methods.CODE_ACTION,
	filetypes = { "markdown" },
	generator = {
		fn = function(context)
			-- print(vim.inspect(context))
			if '[[pre-link]]' then -- some more advanced logic
				return {
					{
						title = "Create new note with default template",
						action = function()
							vim.cmd('normal va[')
							-- Get the text of "pre-link"
							-- Execute ZkNew custom command
							-- Prompt for new note title
							-- Put the "pre-link" text as new note title placeholder
							-- Create new note
							-- Get the link of the new note
							-- Replace [[pre-link]] with [new note title](link-of-new-note.md)
							-- End
						end
					}
				}
			end
		end
	}
}

null_ls.register(zk_custom_actions)
