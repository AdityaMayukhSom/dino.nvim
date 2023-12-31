local setup_ok, lualine = pcall(require, "lualine")
if not setup_ok then
	vim.notify("lualine not working")
	return
end

lualine.setup({
	options = {
		icons_enabled = false,
		theme = "auto",
		component_separators = { left = "\\", right = "\\" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	padding = 3,
	-- things to show when the buffer is active or selected
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = {
			"encoding",
			--"fileformat",
			"filetype",
		},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	-- what to show when the buffer is inactive
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = { "toggleterm", "nvim-tree" },
})
