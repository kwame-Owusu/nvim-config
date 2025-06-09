require("kwame")
print("hello")

vim.wo.relativenumber = true
vim.opt.number = true  -- ensures the absolute number is shown for the current line



vim.o.background = "dark" -- or "light" for light mode
-- Configure Everforest options (optional)
vim.g.everforest_background = 'medium'  -- 'hard', 'medium', 'soft'
vim.g.everforest_better_performance = 1
vim.g.everforest_disable_italic_comment = 0

-- Apply the colorscheme
vim.cmd.colorscheme('everforest')

--allowing to have transparent background in neovim
vim.cmd [[
  hi Normal guibg=NONE ctermbg=NONE
  hi NormalNC guibg=NONE ctermbg=NONE
  hi EndOfBuffer guibg=NONE ctermbg=NONE
]]



