require("kwame")
require("kwame.everforest")
vim.o.background = "dark" -- or "light" for light mode

--allowing to have transparent background in neovim
vim.cmd [[
  hi Normal guibg=NONE ctermbg=NONE
  hi NormalNC guibg=NONE ctermbg=NONE
  hi EndOfBuffer guibg=NONE ctermbg=NONE
]]
