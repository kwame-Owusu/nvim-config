-- ~/.config/nvim/lua/plugins/latex.lua
-- LaTeX setup for Neovim (lazy.nvim): VimTeX + texlab LSP + treesitter + snippets
--
-- System dependencies (install outside Neovim):
--   TeX Live (or MiKTeX)  -> provides latexmk, pdflatex/xelatex/lualatex
--   zathura (Linux) / Skim (macOS) / SumatraPDF (Windows) -> PDF viewer
--   Optional: biber (if you use biblatex), pygments (if you use minted)

return {
    -- Core: compiling, forward/inverse search, text objects, TOC, etc.
    {
        "lervag/vimtex",
        lazy = false, -- VimTeX lazy-loads itself; don't lazy-load it with lazy.nvim
        init = function()
            -- PDF viewer: "zathura" (Linux), "skim" (macOS), "sioyek", "general" (Windows/SumatraPDF)
            vim.g.vimtex_view_method = "zathura"
            -- macOS: vim.g.vimtex_view_method = "skim"
            -- Windows (SumatraPDF):
            -- vim.g.vimtex_view_general_viewer = "SumatraPDF"
            -- vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"

            vim.g.vimtex_compiler_method = "latexmk"
            -- Compile into ./build so your project root stays clean
            vim.g.vimtex_compiler_latexmk = {
                aux_dir = "build",
                out_dir = "build",
                callback = 1,
                continuous = 1,
                executable = "latexmk",
                options = {
                    "-verbose",
                    "-file-line-error",
                    "-synctex=1",
                    "-interaction=nonstopmode",
                },
            }

            -- Don't pop the quickfix window open on every warning
            vim.g.vimtex_quickfix_mode = 0
            vim.g.vimtex_quickfix_open_on_warning = 0

            -- Conceal makes \alpha show as α etc. Toggle with <localleader>lc if you dislike it
            vim.opt.conceallevel = 1
            vim.g.vimtex_syntax_conceal = {
                accents = 1,
                ligatures = 1,
                cites = 1,
                fancy = 1,
                spacing = 0,
                greek = 1,
                math_bounds = 0,
                math_delimiters = 1,
                math_fracs = 1,
                math_super_sub = 1,
                math_symbols = 1,
                sections = 0,
                styles = 1,
            }

            -- Use <localleader> = "," in tex files (default is "\")
            vim.g.maplocalleader = ","
        end,
        config = function()
            -- Open the PDF automatically the first time you start compiling
            vim.api.nvim_create_autocmd("User", {
                pattern = "VimtexEventCompileSuccess",
                once = true,
                callback = function() vim.cmd("VimtexView") end,
            })

            -- Prose-friendly settings for .tex files
            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "tex", "bib" },
                callback = function()
                    vim.opt_local.wrap = true
                    vim.opt_local.linebreak = true
                    vim.opt_local.spell = true
                    vim.opt_local.spelllang = "en_gb"
                    vim.opt_local.textwidth = 0
                    vim.opt_local.colorcolumn = ""
                    -- Move by visual lines, since paragraphs are long
                    vim.keymap.set({ "n", "v" }, "j", "gj", { buffer = true })
                    vim.keymap.set({ "n", "v" }, "k", "gk", { buffer = true })
                end,
            })
        end,
    },

    -- Treesitter: highlighting is handled by VimTeX for tex, but bibtex benefits.
    -- Keep "latex" out of highlight so it doesn't fight VimTeX's syntax.
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            opts.ensure_installed = opts.ensure_installed or {}
            vim.list_extend(opts.ensure_installed, { "latex", "bibtex" })
            opts.highlight = opts.highlight or {}
            opts.highlight.disable = opts.highlight.disable or {}
            table.insert(opts.highlight.disable, "latex")
        end,
    },

    -- LSP: texlab gives completion for refs/cites/labels, go-to-definition, diagnostics
    {
        "williamboman/mason.nvim",
        opts = {},
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
        opts = {
            ensure_installed = { "texlab" },
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- Let VimTeX own build + forward search; texlab does the rest
            vim.lsp.config("texlab", {
                settings = {
                    texlab = {
                        build = { onSave = false },
                        chktex = { onOpenAndSave = true, onEdit = false },
                        diagnostics = { ignoredPatterns = { "Overfull", "Underfull" } },
                    },
                },
            })
            vim.lsp.enable("texlab")
        end,
    },

    -- Snippets: fast math/environment expansion (e.g. "fm" -> $...$, "dm" -> \[...\])
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
    },
    {
        "iurimateus/luasnip-latex-snippets.nvim",
        dependencies = { "L3MON4D3/LuaSnip", "lervag/vimtex" },
        ft = { "tex", "latex", "markdown" },
        config = function()
            require("luasnip-latex-snippets").setup({ use_treesitter = false })
            require("luasnip").config.setup({ enable_autosnippets = true })
        end,
    },
}
