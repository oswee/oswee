local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
	return
end

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

return {
	capabilities = capabilities,
}
