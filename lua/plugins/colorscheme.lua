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

    {
        "Yazeed1s/oh-lucy.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            -- These MUST be set here so they are ready when
            -- you switch to the theme via Themery
            vim.g.oh_lucy_italic_comments = true
            vim.g.oh_lucy_italic_keywords = true
            vim.g.oh_lucy_transparent_background = true
        end,
    },
    {
        'olivercederborg/poimandres.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('poimandres').setup {
                -- leave this setup function empty for default config
                -- or refer to the configuration section
                -- for configuration options
            }
        end,

    }
}
