return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },

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

    -- Smart toggle function
    local function smart_nvimtree_toggle()
      local api = require("nvim-tree.api")
      local view = require("nvim-tree.view")

      if not view.is_visible() then
        api.tree.find_file({ open = true, focus = true })
      else
        -- Tree open
        if vim.bo.filetype == "NvimTree" then
          -- Focus is on the tree → close it
          api.tree.close()
        else
          -- Focus is elsewhere → focus the tree instead of reopening
          api.tree.focus()
        end
      end
    end

    vim.keymap.set("n", "<C-n>", smart_nvimtree_toggle, { desc = "Smart toggle NvimTree" })
  end,
}
