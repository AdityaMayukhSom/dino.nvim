-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	vim.notify("nvim tree not working")
	return
end

-- local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
-- if not config_status_ok then
-- 	vim.notify("nvim tree config not working")
-- 	return
-- end

local function tree_on_attach(bufnr)
	local api_status_ok, api = pcall(require, "nvim-tree.api")
	if not api_status_ok then
		vim.notify("nvim tree api not working")
		return
	end

	local function opts(desc)
		return {
			desc = "nvim-tree: " .. desc,
			buffer = bufnr,
			noremap = true,
			silent = true,
			nowait = true,
		}
	end

	-- Default mappings. Feel free to modify or remove as you wish.
	--
	-- BEGIN_DEFAULT_ON_ATTACH
	vim.keymap.set("n", "<C-]>", api.tree.change_root_to_node, opts("CD"))
	vim.keymap.set("n", "<C-e>", api.node.open.replace_tree_buffer, opts("Open: In Place"))
	vim.keymap.set("n", "<C-k>", api.node.show_info_popup, opts("Info"))
	vim.keymap.set("n", "<C-r>", api.fs.rename_sub, opts("Rename: Omit Filename"))
	vim.keymap.set("n", "<C-t>", api.node.open.tab, opts("Open: New Tab"))
	vim.keymap.set("n", "<C-v>", api.node.open.vertical, opts("Open: Vertical Split"))
	vim.keymap.set("n", "<C-x>", api.node.open.horizontal, opts("Open: Horizontal Split"))
	vim.keymap.set("n", "<BS>", api.node.navigate.parent_close, opts("Close Directory"))
	vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "<Tab>", api.node.open.preview, opts("Open Preview"))
	vim.keymap.set("n", ">", api.node.navigate.sibling.next, opts("Next Sibling"))
	vim.keymap.set("n", "<", api.node.navigate.sibling.prev, opts("Previous Sibling"))
	vim.keymap.set("n", ".", api.node.run.cmd, opts("Run Command"))
	vim.keymap.set("n", "-", api.tree.change_root_to_parent, opts("Up"))
	vim.keymap.set("n", "a", api.fs.create, opts("Create"))
	vim.keymap.set("n", "bd", api.marks.bulk.delete, opts("Delete Bookmarked"))
	vim.keymap.set("n", "bmv", api.marks.bulk.move, opts("Move Bookmarked"))
	vim.keymap.set("n", "B", api.tree.toggle_no_buffer_filter, opts("Toggle Filter: No Buffer"))
	vim.keymap.set("n", "c", api.fs.copy.node, opts("Copy"))
	vim.keymap.set("n", "C", api.tree.toggle_git_clean_filter, opts("Toggle Filter: Git Clean"))
	vim.keymap.set("n", "[c", api.node.navigate.git.prev, opts("Prev Git"))
	vim.keymap.set("n", "]c", api.node.navigate.git.next, opts("Next Git"))
	vim.keymap.set("n", "d", api.fs.remove, opts("Delete"))
	vim.keymap.set("n", "D", api.fs.trash, opts("Trash"))
	vim.keymap.set("n", "E", api.tree.expand_all, opts("Expand All"))
	vim.keymap.set("n", "e", api.fs.rename_basename, opts("Rename: Basename"))
	vim.keymap.set("n", "]e", api.node.navigate.diagnostics.next, opts("Next Diagnostic"))
	vim.keymap.set("n", "[e", api.node.navigate.diagnostics.prev, opts("Prev Diagnostic"))
	vim.keymap.set("n", "F", api.live_filter.clear, opts("Clean Filter"))
	vim.keymap.set("n", "f", api.live_filter.start, opts("Filter"))
	vim.keymap.set("n", "g?", api.tree.toggle_help, opts("Help"))
	vim.keymap.set("n", "gy", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
	vim.keymap.set("n", "H", api.tree.toggle_hidden_filter, opts("Toggle Filter: Dotfiles"))
	vim.keymap.set("n", "I", api.tree.toggle_gitignore_filter, opts("Toggle Filter: Git Ignore"))
	vim.keymap.set("n", "J", api.node.navigate.sibling.last, opts("Last Sibling"))
	vim.keymap.set("n", "K", api.node.navigate.sibling.first, opts("First Sibling"))
	vim.keymap.set("n", "m", api.marks.toggle, opts("Toggle Bookmark"))
	vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "O", api.node.open.no_window_picker, opts("Open: No Window Picker"))
	vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
	vim.keymap.set("n", "P", api.node.navigate.parent, opts("Parent Directory"))
	vim.keymap.set("n", "q", api.tree.close, opts("Close"))
	vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
	vim.keymap.set("n", "R", api.tree.reload, opts("Refresh"))
	vim.keymap.set("n", "s", api.node.run.system, opts("Run System"))
	vim.keymap.set("n", "S", api.tree.search_node, opts("Search"))
	vim.keymap.set("n", "U", api.tree.toggle_custom_filter, opts("Toggle Filter: Hidden"))
	vim.keymap.set("n", "W", api.tree.collapse_all, opts("Collapse"))
	vim.keymap.set("n", "x", api.fs.cut, opts("Cut"))
	vim.keymap.set("n", "y", api.fs.copy.filename, opts("Copy Name"))
	vim.keymap.set("n", "Y", api.fs.copy.relative_path, opts("Copy Relative Path"))
	vim.keymap.set("n", "<2-LeftMouse>", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "<2-RightMouse>", api.tree.change_root_to_node, opts("CD"))
	-- END_DEFAULT_ON_ATTACH

	-- Mappings migrated from view.mappings.list
	--
	-- You will need to insert "your code goes here" for any mappings with a custom action_cb
	vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
	vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
end

-- local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup({
	disable_netrw = true,
	hijack_netrw = true,
	-- ignore_ft_on_setup = {
	--     "startify",
	--     "dashboard",
	--     "alpha",
	-- },
	-- auto_close = 1,
	open_on_tab = false,
	hijack_cursor = false,
	update_cwd = true,
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	diagnostics = {
		enable = true,
		icons = {
			hint = "H",
			info = "I",
			warning = "W",
			error = "E",
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 500,
	},
	sort = {
		sorter = "extension",
		folders_first = true,
	},
	view = {
		centralize_selection = false,
		cursorline = true,
		debounce_delay = 15,
		width = 40,
		side = "right",
		preserve_window_proportions = true,
		number = false,
		relativenumber = false,
		signcolumn = "yes",
		float = {
			enable = true,
			quit_on_focus_loss = false,
			open_win_config = {
				relative = "editor",
				border = "single",
				width = 40,
				height = vim.o.lines,
				row = 0,
				col = vim.o.columns,
			},
		},
	},
	on_attach = tree_on_attach,
	actions = {
		-- quit_on_open = true,
		-- window_picker = { enable = true },
	},
	renderer = {
		add_trailing = false,
		group_empty = false,
		full_name = false,
		root_folder_label = ":~:s?$?/..?",
		indent_width = 2,
		special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md", "LICENSE" },
		symlink_destination = true,
		highlight_git = false,
		highlight_diagnostics = false,
		highlight_opened_files = "all",
		highlight_modified = "all",
		highlight_bookmarks = "all",
		highlight_clipboard = "name",
		indent_markers = {
			enable = true,
			inline_arrows = true,
			icons = {
				corner = "⊢",
				edge = "│",
				item = "⊢",
				bottom = "─",
				none = " ",
			},
		},
		icons = {
			web_devicons = {
				file = {
					enable = false,
					color = true,
				},
				folder = {
					enable = false,
					color = true,
				},
			},
			git_placement = "after",
			modified_placement = "after",
			diagnostics_placement = "signcolumn",
			bookmarks_placement = "signcolumn",
			padding = " ",
			symlink_arrow = " ➛ ",
			show = {
				file = true,
				folder = true,
				folder_arrow = false,
				git = true,
				modified = true,
				diagnostics = false,
				bookmarks = false,
			},
			glyphs = {
				default = "λ",
				symlink = "ζ",
				bookmark = "󰆤",
				modified = "●",
				folder = {
					arrow_closed = "˅",
					arrow_open = "˄",
					default = "[+]",
					open = "(~)",
					empty = "[*]",
					empty_open = "(!)",
					symlink = "[>]",
					symlink_open = "(|>)",
				},
				git = {
					unstaged = "U",
					staged = "S",
					unmerged = "M",
					renamed = "R",
					untracked = "A",
					deleted = "D",
					ignored = "I",
				},
			},
		},
	},
	modified = {
		enable = true,
		show_on_dirs = true,
		show_on_open_dirs = true,
	},
})
