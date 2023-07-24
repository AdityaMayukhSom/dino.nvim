local colorscheme = "oxocarbon" -- put the name of the desired colorscheme here

vim.opt.background = "dark" -- set this to dark or light, as oxocarbon is dark we set it as dark

-- vim.cmd("colorscheme oxocarbon") -- setting up colorscheme as oxocarbon

-- does the same thing as previous line but will not break our confighuration if the required colorscheme is not found
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme) 

-- if the required colorscheme is not found, we notify the user that the colorscheme is not found
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found")
    return
end
