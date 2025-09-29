-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { 'sainnhe/everforest' }
    use { 'sainnhe/gruvbox-material' }
    use { 'morhetz/gruvbox' }
    use { "rebelot/kanagawa.nvim" }
    use { "catppuccin/nvim", as = "catppuccin" }
    use({
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    })
    -- preview of html files and similar
    use {
        'brianhuster/live-preview.nvim',
        requires = {
            'nvim-telescope/telescope.nvim',
        },
    }
    -- nvim autopairs to pair brackets and similar
    use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }

    --code formatter configuration
    use {
        'stevearc/conform.nvim',
        config = function()
            require("conform").setup({
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
    }

    use { 'ThePrimeagen/harpoon' }
    use { 'mbbill/undotree' }
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
    }
    use { 'tpope/vim-fugitive' }
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            { 'neovim/nvim-lspconfig' },   -- Required LSP config
            { 'williamboman/mason.nvim' }, -- Optional: LSP server manager
            { 'williamboman/mason-lspconfig.nvim' },
            { 'hrsh7th/nvim-cmp' },        -- Completion plugin
            { 'hrsh7th/cmp-nvim-lsp' },    -- LSP source for nvim-cmp
        }
    }
    use { 'saadparwaiz1/cmp_luasnip' }
    use({
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!:).
        run = "make install_jsregexp"
    })
end)
