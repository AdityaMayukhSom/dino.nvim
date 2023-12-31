local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Define a function to toggle the value of 'showtabline'
-- used to toggle if the top navigation bar should be visible or not
function toggle_showtabline()
	local showtabline = vim.o.showtabline
	vim.o.showtabline = showtabline == 0 and 2 or 0
end

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<A-h>", "<C-w>h", opts)
keymap("n", "<A-j>", "<C-w>j", opts)
keymap("n", "<A-k>", "<C-w>k", opts)
keymap("n", "<A-l>", "<C-w>l", opts)

keymap("n", "<A-e>", ":NvimTreeToggle<CR>", opts)
keymap("n", "n", ":undo<CR>", opts)
keymap("n", "r", ":redo<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Close current buffer
keymap("n", "<C-w>", ":Bdelete<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<A-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<A-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<A-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<A-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Text Wrap --
keymap("n", "<A-z>", ":set wrap!<CR>", opts)
keymap("i", "<A-z>", "<C-o>:set wrap!<CR>", opts)

-- Telescope --
keymap("n", "tf", "<cmd>Telescope find_files<cr>", opts)
keymap(
	"n",
	"ts",
	"<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_ivy({ previewer = true }))<cr>",
	opts
)

-- opens fuzzy finder
keymap("n", "tg", "<cmd>Telescope live_grep<cr>", opts)

-- toggling buffer tabs
keymap("n", "<leader>tb", ":lua toggle_showtabline()<CR>", opts)

-- git signs toggle
keymap("n", "gst", ":Gitsigns toggle_signs<CR>", opts)

-- shortcut to focus nvim tree
keymap("n", "<A-t>", ":NvimTreeFocus<CR>", opts)

-- code runner
-- keymap("n", "<leader>r", ":RunCode<CR>", opts)
-- keymap("n", "<leader>rf", ":RunFile<CR>", opts)
-- keymap("n", "<leader>rft", ":RunFile tab<CR>", opts)
-- keymap("n", "<leader>rp", ":RunProject<CR>", opts)
-- keymap("n", "<leader>rc", ":RunClose<CR>", opts)
-- keymap("n", "<leader>crf", ":CRFiletype<CR>", opts)
-- keymap("n", "<leader>crp", ":CRProjects<CR>", opts)

-- competitest runner
-- keymap("n", "RT", ":CompetiTest run<CR>", opts)
-- keymap("n", "DT", ":CompetiTest delete_testcase<CR>", opts)
-- keymap("n", "ET", ":CompetiTest edit_testcase<CR>", opts)
-- keymap("n", "AT", ":CompetiTest add_testcase<CR>", opts)
