return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local present, lualine = pcall(require, "lualine")
        if not present then
            return
        end

        lualine.setup({
            options = {
                icons_enabled = true,
                theme = "gruvbox",
                disabled_filetypes = {},
                section_separators = {},
                component_separators = {},
                always_divide_middle = true,
                globalstatus = false,
            },
            sections = {
                lualine_a = {
                    { "mode", icon = "" },
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
