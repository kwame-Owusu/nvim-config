return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x", -- optional, depending on your setup
    dependencies = {
        { "neovim/nvim-lspconfig" },
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
        { "hrsh7th/nvim-cmp" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "L3MON4D3/LuaSnip" },
        { "saadparwaiz1/cmp_luasnip" },
    },

    config = function()
        local lsp_zero = require("lsp-zero")

        -- Extend LSP config
        lsp_zero.extend_lspconfig()

        -- Attach function (keymaps)
        lsp_zero.on_attach(function(client, bufnr)
            local opts = { buffer = bufnr, remap = false }
            local keymap = vim.keymap.set

            keymap("n", "gd", vim.lsp.buf.definition, opts)
            keymap("n", "K", vim.lsp.buf.hover, opts)
            keymap("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
            keymap("n", "<leader>vd", vim.diagnostic.open_float, opts)
            keymap("n", "[d", vim.diagnostic.goto_next, opts)
            keymap("n", "]d", vim.diagnostic.goto_prev, opts)
            keymap("n", "<leader>vca", vim.lsp.buf.code_action, opts)
            keymap("n", "<leader>vrr", vim.lsp.buf.references, opts)
            keymap("n", "<leader>vrn", vim.lsp.buf.rename, opts)
            keymap("n", "<C-sk>", vim.lsp.buf.signature_help, opts)
        end)

        -- Mason setup
        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed = {
                "ts_ls",
                "lua_ls",
                "eslint",
                "pyright",
                "gopls",
                "html",
                "cssls",
                "clangd",
                "rust_analyzer",
            },
            handlers = {
                lsp_zero.default_setup,
                lua_ls = function()
                    require("lspconfig").lua_ls.setup({
                        settings = {
                            Lua = {
                                diagnostics = { globals = { "vim" } },
                            },
                        },
                    })
                end,
            },
        })

        -- nvim-cmp setup
        local cmp = require("cmp")
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            sources = {
                { name = "nvim_lsp" },
                { name = "buffer" },
                { name = "path" },
                { name = "luasnip" },
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<C-o>"] = cmp.mapping.select_next_item(cmp_select),
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.confirm({ select = true })
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
        })

        vim.lsp.enable("astro")
        vim.lsp.enable("postgres_lsp")

        -- Capabilities
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        vim.lsp.config("ts_ls", {
            capabilities = capabilities
        })
        vim.lsp.config("astro", {
            capabilities = capabilities
        })
        vim.lsp.config("html", {
            capabilities = capabilities
        })
        vim.lsp.config("lua_ls", {
            capabilities = capabilities
        })
        vim.lsp.config("postgres_lsp", {
            capabilities = capabilities
        })
        vim.lsp.config("gopls", {
            capabilities = capabilities,
            cmd = { "gopls" },
            filetypes = { "go", "mod", "gowork", "gotmpl" },
            settings = {
                gopls = {
                    completeUnimported = true,
                    analyses = {
                        unusedparams = true
                    }
                }
            }
        })

        -- Diagnostics config
        vim.diagnostic.config({
            virtual_text = true,
            signs = true,
            underline = true,
            update_in_insert = false,
        })
    end,
}
