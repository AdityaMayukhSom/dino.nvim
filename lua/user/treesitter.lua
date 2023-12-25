local setup_ok, configs = pcall(require, "nvim-treesitter.configs")

if not setup_ok then
	vim.notify("treesitter not working properly")
	return
end

configs.setup({
	ensure_installed = {
		"angular",
		"c",
		"lua",
		"cpp",
		"python",
		"java",
		"javascript",
		"svelte",
		"tsx",
		"html",
		"typescript",
		"css",
		"xml",
	},
	sync_install = false,
	ignore_install = { "" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" }, -- list of language that will be disabled
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true, disable = { "yaml" } },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	-- used for automatically opening and closing tags
	-- requires use("windwp/nvim-ts-autotag") as plugin
	-- REFER :: https://github.com/windwp/nvim-ts-autotag
	autotag = {
		enable = true,
		enable_rename = true,
		enable_close = true,
		enable_close_on_slash = true,
	},
})
