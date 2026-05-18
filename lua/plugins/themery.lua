return {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
        require("themery").setup({
            themes = {
                "gruvbox",
                "koda",
                "everforest",
                "oh-lucy",
                "poimandres",
                -- Rose Pine Main Variant
                {
                    name = "Rose Pine Main",
                    colorscheme = "rose-pine",
                    before = [[
                        require("rose-pine").setup({
                            variant = "main",
                            extend_background_behind_borders = true,
                            styles = { bold = false, italic = false, transparency = false },
                        })
                    ]],
                },
                -- Rose Pine Moon Variant
                {
                    name = "Rose Pine Moon",
                    colorscheme = "rose-pine",
                    before = [[
                        require("rose-pine").setup({
                            variant = "moon",
                            extend_background_behind_borders = true,
                            styles = { bold = false, italic = false, transparency = false },
                        })
                    ]],
                },
            },
            livePreview = true,
        })
    end
}
