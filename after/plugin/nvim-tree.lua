vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

require('nvim-tree').setup({
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
        dotfiles = true, -- Show hidden/dot files
    },
    git = {
        enable = true,
        ignore = false, -- Show files that are in .gitignore
    },
})

vim.cmd([[
  highlight NvimTreeNormal guibg=NONE ctermbg=NONE
  highlight NvimTreeEndOfBuffer guibg=NONE ctermbg=NONE
  highlight NvimTreeVertSplit guibg=NONE ctermbg=NONE
]])

vim.keymap.set("n", "<c-n>", ":NvimTreeFindFileToggle<CR>")
