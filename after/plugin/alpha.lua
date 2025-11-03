local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

vim.api.nvim_set_hl(0, "String", { fg = "#B6CEB4" })
vim.api.nvim_set_hl(0, "AlphaButtonIcon", { fg = "#B6CEB4", bold = true }) -- light blue
vim.api.nvim_set_hl(0, "AlphaButtonText", { fg = "#B6CEB4" })              -- green
dashboard.section.header.val = {
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
    "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
    "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
    "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
    "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
    "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
    "",
    "               [ @kwame_owusu ]                     ",
    "",
}



dashboard.section.buttons.val = {
    dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("f", "󰍉  Find file", ":Telescope find_files<CR>"),
    dashboard.button("t", "  Browse cwd", ":NvimTreeOpen<CR>"),
    dashboard.button("c", "  Config", ":e ~/.config/nvim/<CR>"),
    dashboard.button("q", "󰅙  Quit", ":q!<CR>"),
}
-- iterating over buttons
for _, button in ipairs(dashboard.section.buttons.val) do
    button.opts.hl = "AlphaButtonIcon"
    button.opts.hl_shortcut = "AlphaButtonText"
end

dashboard.section.footer.val = {
    "1% better everyday",
}
dashboard.section.header.opts.hl = "String" -- header ASCII art color
dashboard.section.footer.opts.hl = "String" -- footer color

dashboard.opts.opts.noautocmd = false

alpha.setup(dashboard.opts)
