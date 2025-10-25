local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
    [[                                                                       ]],
    [[                                                                       ]],
    [[                                                                       ]],
    [[                                                                       ]],
    [[                                                                     ]],
    [[       ████ ██████           █████      ██                     ]],
    [[      ███████████             █████                             ]],
    [[      █████████ ███████████████████ ███   ███████████   ]],
    [[     █████████  ███    █████████████ █████ ██████████████   ]],
    [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
    [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
    [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
    [[                                                                       ]],
    [[                               [ @kwame_owusu ]                        ]],
    [[                                                                       ]],
}

dashboard.section.buttons.val = {
    dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("f", "󰍉  Find file", ":Telescope find_files<CR>"),
    dashboard.button("t", "  Browse cwd", ":NvimTreeOpen<CR>"),
    dashboard.button("r", "  Browse src", ":e ~/.local/src/<CR>"),
    dashboard.button("c", "  Config", ":e ~/.config/nvim/<CR>"),
    dashboard.button("p", "  Plugins", ":PackerSync<CR>"),
    dashboard.button("q", "󰅙  Quit", ":q!<CR>"),
}

dashboard.section.footer.val = function()
    return vim.g.startup_time_ms or "become a good programmer"
end

dashboard.section.buttons.opts.hl = "Keyword"
dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
