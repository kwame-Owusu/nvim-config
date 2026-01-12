return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    lazy = false,
    config = function()
        require("nvim-treesitter.config").setup({
            -- Parsers to install
            ensure_installed = {
                "c",
                "javascript",
                "typescript",
                "lua",
                "vim",
                "html",
                "vimdoc",
                "query",
                "markdown",
                "markdown_inline",
                "go",
                "python",
                "css",
                "json",
                "toml",
                "yaml",
                "tsx",
                "rust",
                "astro",
            },

            -- Install parsers synchronously
            sync_install = false,
            auto_install = false,

            highlight = {
                enable = true,
                -- Set to true if you want both TS and Vim regex highlighting
                additional_vim_regex_highlighting = false,
            },
        })
    end,
}
