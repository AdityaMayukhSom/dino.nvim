local status_ok, trouble = pcall(require, "trouble")
if not status_ok then
	print("could not successfully load 'trouble'")
	return
end

-- settings without a patched font or icons
trouble.setup({
	icons = false,
	fold_open = "[~]", -- icon used for open folds
	fold_closed = "[+]", -- icon used for closed folds
	indent_lines = false, -- add an indent guide below the fold icons
	signs = {
		-- icons / text used for a diagnostic
		error = "error",
		warning = "warn",
		hint = "hint",
		information = "info",
	},
	-- enabling this will use the signs defined in your lsp client
	use_diagnostic_signs = false,
})

-- workspace diagnostics using trouble
vim.keymap.set("n", "<leader>tt", ":TroubleToggle<CR>")
vim.keymap.set("n", "<leader>tw", function()
	trouble.toggle("workspace_diagnostics")
end)
vim.keymap.set("n", "<leader>td", function()
	trouble.toggle("document_diagnostics")
end)
vim.keymap.set("n", "<leader>tq", function()
	trouble.toggle("quickfix")
end)
vim.keymap.set("n", "<leader>tl", function()
	trouble.toggle("loclist")
end)
