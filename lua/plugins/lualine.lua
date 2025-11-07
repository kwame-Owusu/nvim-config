return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "sainnhe/everforest" },

  config = function()
    local custom = require("lualine.themes.everforest")
    -- Powerline Separators
    local powerline = {
      right = "\u{e0b0}",
      left = "\u{e0b2}",
      right_filled = "\u{e0b1}",
      left_filled = "\u{e0b3}",
    }

    -- Round Separators
    local round = {
      right = "\u{e0b4}",
      left = "\u{e0b6}",
      right_filled = "\u{e0b5}",
      left_filled = "\u{e0b7}",
    }

    -- Extra Separators
    local extra = {
      block = "\u{2588}",
      vertical = "\u{2502}",
      vertical_thick = "\u{2503}",
      right_triangle = "\u{e0ba}",
      left_triangle = "\u{e0bc}",
      right_semi = "\u{e0bb}",
      left_semi = "\u{e0bd}",
    }

    -- Custom theme (transparent background)
    -- we can replace "everforest" below with "dracula", "catppuccin", etc.
    custom.normal.c.bg = "none"
    custom.insert.c.bg = "none"
    custom.visual.c.bg = "none"
    custom.replace.c.bg = "none"
    custom.command.c.bg = "none"
    custom.inactive.c.bg = "none"

    -- Setup Lualine
    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = custom,
        component_separators = { left = round.right_filled, right = round.left_filled },
        section_separators = { left = round.right, right = round.left },
        refresh = {
          statusline = 100,
          tabline = 100,
          winbar = 100,
        },
        disabled_filetypes = {
          statusline = { "alpha" },
          winbar = {},
        },
        always_divide_middle = true,
        globalstatus = true,
      },
      sections = {
        lualine_a = {
          { "mode", icon = "", separator = { left = round.left, right = round.right } },
        },
        lualine_b = {
          {
            "filename",
            icon = "",
            colored = true,
          },
          {
            "branch",
            icon = "",
            colored = true,
          },
        },
        lualine_c = {
          {
            "encoding",
            icon = " ",
            "filename",
            color = { bg = "NONE" },
          },
        },
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_lsp" },
            sections = { "error", "warn" },
            always_visible = true,
          },
        },
        lualine_y = {
          { "filetype" },
          { "progress", icon = "󰲽" },
        },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    })
  end,
}
