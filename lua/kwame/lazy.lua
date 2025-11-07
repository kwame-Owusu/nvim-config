    -- Bootstrap lazy.nvim
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not (vim.uv or vim.loop).fs_stat(lazypath) then
        local lazyrepo = "https://github.com/folke/lazy.nvim.git"
        local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
        if vim.v.shell_error ~= 0 then
            vim.api.nvim_echo({
                { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
                { out,                            "WarningMsg" },
                { "\nPress any key to exit..." },
            }, true, {})
            vim.fn.getchar()
            os.exit(1)
        end
    end
    vim.opt.rtp:prepend(lazypath)

    -- Make sure to setup `mapleader` and `maplocalleader` before
    -- loading lazy.nvim so that mappings are correct.
    -- This is also a good place to setup other settings (vim.opt)
    vim.g.mapleader = " "
    vim.g.maplocalleader = "\\"

    -- Setup lazy.nvim
    require("lazy").setup({
        spec = {
            -- import your plugins
            { import = "plugins" },
        },
        -- Configure any other settings here. See the documentation for more details.
        -- colorscheme that will be used when installing plugins.
        install = { colorscheme = { "habamax" } },
        -- automatically check for plugin updates
        checker = { enabled = true },
    }) -- Packer can manage itself

    local plugins = {
        {
            'nvim-telescope/telescope.nvim',
            version = '0.1.8',
            -- or                            , branch = '0.1.x',
            dependencies = { { 'nvim-lua/plenary.nvim' } }
        },
        { "catppuccin/nvim",      name = "catppuccin" },
        { "rebelot/kanagawa.nvim" },
        -- preview of html files and similar
        {
            'brianhuster/live-preview.nvim',
            dependencies = {
                'nvim-telescope/telescope.nvim',
            },
        },
        -- nvim autopairs to pair brackets and similar
        {
            "windwp/nvim-autopairs",
            event = "InsertEnter",
            config = function()
                require("nvim-autopairs").init {}
            end
        },

        --code formatter configuration
        {
            'stevearc/conform.nvim',
            config = function()
                require("conform").init({
                    formatters_by_ft = {
                        python = { "black" },
                        javascript = { "prettier" },
                        typescript = { "prettier" },
                        html = { "prettier" },
                        css = { "prettier" },
                        json = { "prettier" },
                        markdown = { "prettier" },
                        go = { "gofmt" },
                    },
                    format_on_save = {
                        timeout_ms = 500,
                        lsp_fallback = true,
                    },
                })
            end
        },

        { 'ThePrimeagen/harpoon' },
        { 'mbbill/undotree' },
        {
            'nvim-tree/nvim-tree.lua',
            dependencies = {
                'nvim-tree/nvim-web-devicons',
            },
        },
        { 'tpope/vim-fugitive' },
        {
            'VonHeikemen/lsp-zero.nvim',
            dependencies = {
                { 'neovim/nvim-lspconfig' },   -- Required LSP config
                { 'williamboman/mason.nvim' }, -- optional: LSP server manager
                { 'williamboman/mason-lspconfig.nvim' },
                { 'hrsh7th/nvim-cmp' },        -- Completion plugin
                { 'hrsh7th/cmp-nvim-lsp' },    -- LSP source for nvim-cmp
            }
        },
        { 'saadparwaiz1/cmp_luasnip' },
        ({
            "L3MON4D3/LuaSnip",
            -- follow latest release.
            version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
            -- install jsregexp (optional!:).
            build = "make install_jsregexp"
        }),
        --alpha config for the dashboard
        {
            'goolord/alpha-nvim',
            dependencies = {
                'echasnovski/mini.icons',
                'nvim-lua/plenary.nvim'
            },
            config = function()
                require 'alpha'.init(require 'alpha.themes.dashboard'.config)
            end
        },

        {
            'nvim-lualine/lualine.nvim',
            dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }
        }
    }
