local setup_ok, configs = pcall(require, "nvim-treesitter.configs")

if not setup_ok then
    vim.notify("treesitter not working properly")
    return
end



configs.setup {
    ensure_installed = { "c", "lua", "cpp", "python", "java", "javascript", "svelte", "tsx", "html", "typescript", "css" },
    sync_install = false,
    ignore_install = { "" }, -- List of parsers to ignore installing
    highlight = {
        enable = true,     -- false will disable the whole extension
        disable = { "" },  -- list of language that will be disabled
        additional_vim_regex_highlighting = true,

    },
    indent = { enable = true, disable = { "yaml" } },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
}
