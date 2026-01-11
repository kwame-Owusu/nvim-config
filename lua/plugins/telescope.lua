return {
    "nvim-telescope/telescope.nvim",
    version = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
        local builtin = require("telescope.builtin")

        -- Keymaps
        vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Telescope: find files" })
        vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Telescope: find git files" })
        vim.keymap.set("n", "<leader>ps", builtin.live_grep, { desc = "Telescope: live grep" })

        vim.keymap.set("n", "<leader>pw", function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end, { desc = "Telescope: grep string" })

        vim.keymap.set("n", "<leader>pws", builtin.grep_string, { desc = "Telescope: grep word under cursor" })
    end,
}
