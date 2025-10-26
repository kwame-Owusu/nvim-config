-- Round Separators
local round = {
    right = "\u{e0b4}",
    left = "\u{e2b6}",
    right_filled = "\u{e0b5}",
    left_filled = "\u{e0b7}",
}

-- custom theme with transparent middle section
-- themes: horizon, everforest, dracula, modus-vivendi, catppuccin, rose-pine, morta
local custom = require("lualine.themes.everforest")
custom.normal.c.bg = "none"
custom.insert.c.bg = "none"
custom.visual.c.bg = "none"
custom.replace.c.bg = "none"
custom.command.c.bg = "none"
custom.inactive.c.bg = "none"

require("lualine").setup({
    options = {
        icons_enabled = true,
        theme = custom,
        component_separators = { left = round.right_filled, right = round.left_filled },
        refresh = {
            statusline = 100,
            tabline = 100,
            winbar = 100,
        },
        section_separators = { left = round.right, right = round.left },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
    },
    sections = {
        lualine_a = { { "mode", icon = "", separator = { left = round.left, right = round.right } } },
        lualine_b = {
            {
                "filename",
                icon = "",
                colored = true,
            },
            {
                "branch",
                icon = "",
                colored = true,
            },
        },
        -- center components
        lualine_c = {
            {
                "encoding",
                icon = " ",
                "filename",
                color = { bg = "NONE" },
            },
        },
        lualine_x = {
            { "diagnostics", sources = { "nvim_lsp" }, sections = { "error", "warn" }, always_visible = true },
        },
        lualine_y = {
            {
                "filetype",
            },
            {
                "progress",
                icon = "󰲽",
            },
        },
    },
    inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
})
