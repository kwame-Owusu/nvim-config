return {
    -- not using vim.cmd("colorscheme <theme_name>")
    -- because themery.nvim will take care of that
    {
        "ellisonleao/gruvbox.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("gruvbox").setup({
                terminal_colors = true,
                undercurl = true,
                underline = true,
                bold = false,
                italic = {
                    strings = true,
                    emphasis = true,
                    comments = true,
                    operators = false,
                    folds = true,
                },
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                inverse = true,
                contrast = "",
                palette_overrides = {},
                overrides = {},
                dim_inactive = false,
                transparent_mode = true,
            })
        end,
    },

    {
        "oskarnurm/koda.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("koda").setup({
                transparent = false,
                theme = { dark = "dark" }
            })
        end,
    },

    {
        "neanias/everforest-nvim",
        version = false,
        lazy = false,
        priority = 1000,
        config = function()
            require("everforest").setup({
                background = "hard", -- options: "low", "medium", "hard"
                transparent_background_level = 1,
            })
        end,
    },
}
