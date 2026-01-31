vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.api.nvim_set_keymap("n", "<leader>tf", "<Plug>PlenaryTestFile", { noremap = false, silent = false })

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv") --when searching for things keep cursor in middle
vim.keymap.set("n", "N", "Nzzzv") --when searching for things keep cursor in middle but backwards
vim.keymap.set("n", "=ap", "ma=ap'a")
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")

-- splitting & resizing
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "split window vertically" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "split window horizontally" })
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "decrease window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "increase window width" })

-- better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")



-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("n", "<leader>w", ":w<CR>") --allowing us to save a bit easier
vim.keymap.set("n", "<leader>q", ":q<CR>") --allowing us to quit a bit easier

-- remaps for using LivePreview commands, mainly for starting and closing servers
vim.keymap.set("n", "<leader>ls", ":LivePreview start<CR>") --start live server
vim.keymap.set("n", "<leader>lc", ":LivePreview close<CR>") --close live server

-- bindings for gopher.nvim
vim.keymap.set("n", "<leader>gsj", ":GoTagAdd json<CR>", { desc = "add json tags to structs" })
vim.keymap.set("n", "<leader>gsjr", ":GoTagRm json<CR>", { desc = "remove json tags to structs" })
vim.keymap.set("n", "<leader>gsy", ":GoTagAdd yaml<CR>", { desc = "add yaml tags to structs" })
vim.keymap.set("n", "<leader>gsyr", ":GoTagAdd yaml<CR>", { desc = "remove yaml tags to structs" })
vim.keymap.set("n", "<leader>gmt", ":GoMod tidy<CR>", { desc = "updates our dependencies in go.mod" })
vim.keymap.set("n", "<leader>gie", ":GoIfErr <CR>", { desc = "auto generate if err blocks" })



-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d")

-- This is going to get me cancelled
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("v", "jk", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "s", "<nop>") --needed for live preview
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", function()
    require("conform").format({ bufnr = 0 })
end)

vim.keymap.set("n", "<C-cK>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-cJ>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")


vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- allows us to replace the current char the cursor is on
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set(
    "n",
    "<leader>ee",
    "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)

vim.keymap.set(
    "n",
    "<leader>ea",
    "oassert.NoError(err, \"\")<Esc>F\";a"
)

vim.keymap.set(
    "n",
    "<leader>ef",
    "oif err != nil {<CR>}<Esc>Olog.Fatalf(\"error: %s\\n\", err.Error())<Esc>jj"
)

vim.keymap.set(
    "n",
    "<leader>el",
    "oif err != nil {<CR>}<Esc>O.logger.Error(\"error\", \"error\", err)<Esc>F.;i"
)

vim.keymap.set("n", "<leader>ca", function()
    require("cellular-automaton").start_animation("make_it_rain")
end)

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
