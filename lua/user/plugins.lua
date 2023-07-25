local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim",
        install_path }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float({
                border = "single"
            })
        end
    }
}

-- Install your plugins here
return packer.startup(function(use)
    -- My plugins here
    use "wbthomason/packer.nvim"  -- Have packer manage itself
    use "nvim-lua/popup.nvim"     -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim"   -- Useful lua functions used ny lots of plugins
    use "akinsho/toggleterm.nvim" -- useful terminal inside neovim

    -- plugins for bufferline
    use "akinsho/bufferline.nvim"
    use "moll/vim-bbye"

    -- colorscheme plugins
    use { 'nyoom-engineering/oxocarbon.nvim' } -- oxocarbon colourscheme for neovim

    -- cmp plugins
    use "hrsh7th/nvim-cmp"         -- The completion plugin
    use "hrsh7th/cmp-buffer"       -- buffer completions
    use "hrsh7th/cmp-path"         -- path completions
    use "hrsh7th/cmp-cmdline"      -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"

    -- snippets
    use "L3MON4D3/LuaSnip"             -- snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- plugins for nvim tree i.e. file explorer
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'

    -- Telescope
    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-media-files.nvim"

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }

    -- LSP
    use "williamboman/mason.nvim"         -- simple to use language server installer
    use "williamboman/mason-lspconfig.nvim"
    use "neovim/nvim-lspconfig"           -- enable LSP
    use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
    use "RRethy/vim-illuminate"

    -- Comment support
    use "terrortylor/nvim-comment"
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    -- for creation of brackets in pair
    use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter

    -- Used for markdown preview
    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        ft = { "markdown" }
    })

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
