local setup_ok, ufo = pcall(require, "ufo")

if not setup_ok then
	vim.notify("ufo is not working")
	return
end

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set("n", "zr", ufo.openAllFolds)
vim.keymap.set("n", "zm", ufo.closeAllFolds)

ufo.setup({
	provider_selector = function(bufnr, filetype, buftype)
		return { "treesitter", "indent" }
	end,
})
