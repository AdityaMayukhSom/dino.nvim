local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Function to install ripgrep using apt if it's not installed
local function install_ripgrep()
	-- Check if ripgrep is already installed
	if vim.fn.executable("rg") == 1 then
		-- ripgrep or similar type of utility is already installed, hence no need to install it again
		-- print("'ripgrep' is already installed, can use telescope's live grep facility.")
		return true
	else
		-- Install ripgrep using apt-get
		print("'ripgrep' is not installed, please install 'ripgrep' to use telescope's live_grep facility.")
		-- to install ripgrep using lia itself, use os.execute utility
		local install_command = "silent !sudo apt-get install ripgrep"
		print("try : " .. install_command)
		-- os.execute(install_command)
		return false
	end
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({
				border = "single",
			})
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used by lots of plugins
	use("akinsho/toggleterm.nvim") -- useful terminal inside neovim
	use("lewis6991/gitsigns.nvim")

	-- plugins for bufferline
	use("akinsho/bufferline.nvim")
	use("moll/vim-bbye")

	-- colorscheme plugins
	use("nyoom-engineering/oxocarbon.nvim") -- oxocarbon colourscheme for neovim
	-- use("navarasu/onedark.nvim")         -- onedark colourscheme for neovim
	-- use("ayu-theme/ayu-dark")
	-- use("Shatur/neovim-ayu")
	use("Mofiqul/vscode.nvim")

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")

	-- status line configuration
	use({
		"nvim-lualine/lualine.nvim",
		requires = {
			"nvim-tree/nvim-web-devicons",
			opt = true,
		},
	})
	-- auto close and rename tags
	use("windwp/nvim-ts-autotag")

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- plugins for nvim tree i.e. file explorer
	use("kyazdani42/nvim-web-devicons")
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons",
		},
	})

	-- used in contrast to nvim LSP for maintaining language servers
	-- use({ "neoclide/coc.nvim", branch = "release" })

	-- Telescope
	-- Call the install_ripgrep function to check and install ripgrep
	install_ripgrep()
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-media-files.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	-- Folding
	use({
		"kevinhwang91/nvim-ufo",
		requires = "kevinhwang91/promise-async",
	})

	-- LSP
	use("williamboman/mason.nvim") -- simple to use language server installer
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig") -- enable LSP
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	-- automatically highlighting other uses of the word under the cursor using either LSP, Tree-sitter, or regex matching
	use("RRethy/vim-illuminate")

	-- Comment support
	use("terrortylor/nvim-comment")
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- for creation of brackets in pair
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter

	-- for tworkspace diagnostics
	use("folke/trouble.nvim")

	-- Used for markdown preview
	-- use({
	-- 	"iamcco/markdown-preview.nvim",
	-- 	run = "cd app && npm install",
	-- 	ft = { "markdown" },
	-- })

	-- used to configure rust with neovim
	-- use("rust-lang/rust.vim")
	-- use("simrat39/rust-tools.nvim")

	-- for running projects (especially for cp)
	-- use("CRAG666/code_runner.nvim")
	-- test case runner for competitive programming
	-- use({
	-- 	"xeluxee/competitest.nvim",
	-- 	requires = "MunifTanjim/nui.nvim",
	-- 	config = function()
	-- 		require("competitest").setup()
	-- 	end,
	-- })

	-- to enable smooth scrolling
	use("karb94/neoscroll.nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		packer.sync()
	end
end)
