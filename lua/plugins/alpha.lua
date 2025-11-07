return {
  "goolord/alpha-nvim",
  dependencies = { "echasnovski/mini.icons", "nvim-lua/plenary.nvim" },

  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Highlight groups
    vim.api.nvim_set_hl(0, "String", { fg = "#B6CEB4" })
    vim.api.nvim_set_hl(0, "AlphaButtonIcon", { fg = "#B6CEB4", bold = true })
    vim.api.nvim_set_hl(0, "AlphaButtonText", { fg = "#B6CEB4" })

    -- Header (ASCII logo)
    dashboard.section.header.val = {
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
      "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
      "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
      "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
      "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
      "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
      "",
      "               [ @kwame_owusu ]                     ",
      "",
    }

    -- Buttons
    dashboard.section.buttons.val = {
      dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", "󰍉  Find file", ":Telescope find_files<CR>"),
      dashboard.button("t", "  Browse cwd", ":NvimTreeOpen<CR>"),
      dashboard.button("c", "  Config", ":e ~/.config/nvim/<CR>"),
      dashboard.button("q", "󰅙  Quit", ":q!<CR>"),
    }

    -- Apply highlight styles to buttons
    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = "AlphaButtonIcon"
      button.opts.hl_shortcut = "AlphaButtonText"
    end

    -- Footer
    dashboard.section.footer.val = { "1% better everyday" }

    -- Highlight groups for header/footer
    dashboard.section.header.opts.hl = "String"
    dashboard.section.footer.opts.hl = "String"

    -- Options
    dashboard.opts.opts.noautocmd = false

    -- Setup
    alpha.setup(dashboard.opts)
  end,
}
