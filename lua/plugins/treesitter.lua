return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",  -- ensures parsers stay updated
  config = function()
    require("nvim-treesitter.configs").setup({
      -- Parsers to install
      ensure_installed = {
        "c",
        "javascript",
        "typescript",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "markdown",
        "markdown_inline",
        "go",
        "python",
      },

      -- Install parsers synchronously
      sync_install = false,

      -- Automatically install missing parsers when entering buffer
      auto_install = true,

      highlight = {
        enable = true,
        -- Set to true if you want both TS and Vim regex highlighting
        additional_vim_regex_highlighting = false,
      },
    })
  end,
}
