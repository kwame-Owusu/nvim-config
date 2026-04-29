return {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
        require("themery").setup({
            themes = { "gruvbox", "koda", "everforest", "oh-lucy", "poimandres" },
            livePreview = true,
        })
    end
}
