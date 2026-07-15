return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    config = function()
        local parsers = {
            "c", "javascript", "typescript", "lua", "vim",
            "html", "vimdoc", "query", "markdown", "markdown_inline",
            "go", "python", "css", "json", "toml", "yaml",
            "tsx", "rust", "astro",
        }

        vim.api.nvim_create_autocmd('FileType', {
            pattern = parsers,
            callback = function() vim.treesitter.start() end,
        })

        require('nvim-treesitter').install(parsers)
    end,
}
