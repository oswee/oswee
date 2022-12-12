local handlers = {}

handlers.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		virtual_text = false,
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

local function lsp_document_formatting(client, bufnr)
	if client.server_capabilities.document_formatting then
		local lsp_formatting_group = vim.api.nvim_create_augroup("LspFormatting", { clear = true })

		vim.api.nvim_create_autocmd("CursorHold", {
			buffer = bufnr,
			group = lsp_formatting_group,
			callback = function()
				vim.lsp.buf.format({ bufnr = bufnr }, 1000)
			end,
		})
	end
end

local function lsp_document_highlight(client, bufnr)
	if client.server_capabilities.document_highlight then
		local lsp_highlight_group = vim.api.nvim_create_augroup("LspDocumentHighlight", { clear = true })

		vim.api.nvim_create_autocmd("CursorHold", {
			buffer = bufnr,
			group = lsp_highlight_group,
			callback = function()
				vim.lsp.buf.document_highlight()
			end,
		})

		vim.api.nvim_create_autocmd("CursorMoved", {
			buffer = bufnr,
			group = lsp_highlight_group,
			callback = function()
				vim.lsp.buf.clear_references()
			end,
		})
	end
end

local function lsp_keymaps(bufnr)
	-- All mappings are moved to Lspsaga/Whichkey

	-- vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
	-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
	-- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr }) -- what is alternative in Lspsaga?
	-- vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = bufnr })
	-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr })
	-- vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr })
	-- vim.keymap.set("n", "C-k", vim.lsp.buf.signature_help, { buffer = bufnr })
	-- vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, { buffer = bufnr })
	-- vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })
	vim.keymap.set("n", "<Leader>f", vim.diagnostic.open_float, { buffer = bufnr })
	-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { buffer = bufnr })
	-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { buffer = bufnr })
	-- vim.keymap.set("n", "<Leader>g", vim.lsp.diagnostic.setloclist, { buffer = bufnr })

	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
end

-- Execute only when language server attaches the buffer
function handlers.on_attach(client, bufnr)
	lsp_document_highlight(client, bufnr)
	lsp_document_formatting(client, bufnr)
	lsp_keymaps(bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

if not ok then
	local errmsg = "[LSP] `cmp_nvim_lsp` plugin not installed! Please install via your plugin manager."
	vim.api.nvim_err_writeln(errmsg)
	return
end

handlers.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return handlers
