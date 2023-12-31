local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	vim.notify("lspconfig not setup properly")
	return
end

require("user.lsp.mason")
require("user.lsp.null-ls")

local handlers_status_ok, handlers = pcall(require, "user.lsp.handlers")
if not handlers_status_ok then
	vim.notify("handlers.nvim not loaded properly")
	return
end
handlers.setup()
