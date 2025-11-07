return {
  "sainnhe/everforest",
  priority = 1000,  -- ensure it's loaded early
  config = function()
    -- Set background style and enable transparency
    vim.g.everforest_background = "medium"       -- or "soft"
    vim.g.everforest_transparent_background = 1

    -- Apply the colorscheme
    vim.cmd("colorscheme everforest")

    -- Optional: transparent terminal background
    vim.cmd([[highlight Normal guibg=NONE ctermbg=NONE]])
    vim.cmd([[highlight NormalNC guibg=NONE ctermbg=NONE]])
  end,
}
