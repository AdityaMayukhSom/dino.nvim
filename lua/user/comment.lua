local status_ok, nvim_comment = pcall(require, "nvim_comment")
if not status_ok then
	vim.notify("nvim_comment not available")
	return
end

-- context_commentstring nvim-treesitter module is deprecated, use require('ts_context_commentstring').setup {} and set vim.g.skip_ts_context_commentstring_module = true to speed up loading instead.
-- This feature will be removed in ts_context_commentstring version in the future
-- This setting is related to treesitter
require("ts_context_commentstring").setup({})
vim.g.skip_ts_context_commentstring_module = true

nvim_comment.setup({
	-- Linters prefer comment and line to have a space in between markers
	marker_padding = true,
	-- should comment out empty or whitespace only lines
	comment_empty = false,
	-- trim empty comment whitespace
	comment_empty_trim_whitespace = true,
	-- Should key mappings be created
	create_mappings = true,
	-- Normal mode mapping left hand side
	line_mapping = "gcc",
	-- Visual/Operator mapping left hand side
	operator_mapping = "gc",
	-- text object mapping, comment chunk,,
	comment_chunk_text_object = "ic",
	-- Hook function to call before commenting takes place
	hook = function()
		require("ts_context_commentstring.internal").update_commentstring()
	end,
})
