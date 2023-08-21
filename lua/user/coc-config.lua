local keyset = vim.keymap.set
local coc_opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
-- coc nvim for java
keyset(
	"i",
	"<TAB>",
	'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()',
	coc_opts
)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], coc_opts)
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<c-r>=coc#on_enter()"]], coc_opts)
keyset("i", "<c-space>", "coc#refresh()", { silent = true, expr = true })
keyset("n", "<leader>.", "<Plug>(coc-codeaction)", {})
keyset("n", "<leader>l", ":CocCommand eslint.executeAutofix<CR>", {})
keyset("n", "gd", "<Plug>(coc-definition)", { silent = true })
keyset("n", "K", ":call CocActionAsync('doHover')<CR>", coc_opts)
keyset("n", "<leader>rn", "<Plug>(coc-rename)", coc_opts)
keyset("n", "<leader>fmt", ":CocCommand prettier.formatFile<CR>", coc_opts)
keyset("i", "<C-Space>", "coc#refresh()", coc_opts)
keyset("i", "<TAB>", "coc#pum#visible() ? coc#pum#next(1) : '<TAB>'", coc_opts)
keyset("i", "<S-TAB>", "coc#pum#visible() ? coc#pum#prev(1) : '<C-h>'", coc_opts)
keyset("i", "<CR>", "coc#pum#visible() ? coc#pum#confirm() : '<C-G>u<CR><C-R>=coc#on_enter()<CR>'", coc_opts)
