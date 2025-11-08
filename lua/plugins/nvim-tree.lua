return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.opt.termguicolors = true

    require("nvim-tree").setup({
      renderer = {
        highlight_git = true,
        highlight_opened_files = "none",
        root_folder_modifier = ":~",
      },
      view = {
        side = "left",
        width = 30,
      },
      filters = {
        dotfiles = true,
      },
      git = {
        enable = true,
        ignore = false,
      },
    })

    -- Transparent background
    vim.cmd([[
      highlight NvimTreeNormal guibg=NONE ctermbg=NONE
      highlight NvimTreeEndOfBuffer guibg=NONE ctermbg=NONE
      highlight NvimTreeVertSplit guibg=NONE ctermbg=NONE
    ]])

    vim.keymap.set("n", "<C-n>", ":NvimTreeFindFileToggle<CR>")
  end,
}
