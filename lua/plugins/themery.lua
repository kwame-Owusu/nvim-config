return {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
        require("themery").setup({
            themes = { "gruvbox", "koda", "everforest" },
            livePreview = true,
        })
    end
}
