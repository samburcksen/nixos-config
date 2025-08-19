return {
    "theprimeagen/harpoon",

    config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        vim.keymap.set("n", "<leader>a", mark.add_file, {
            desc = "Add file to Harpoon"
        })
        vim.keymap.set("n", "<C-s>", ui.toggle_quick_menu, {
            desc = "Open Harpoon UI"
        })

        vim.keymap.set("n", "<C-n>", function() ui.nav_file(1) end)
        vim.keymap.set("n", "<C-e>", function() ui.nav_file(2) end)
        vim.keymap.set("n", "<C-i>", function() ui.nav_file(3) end)
        vim.keymap.set("n", "<C-o>", function() ui.nav_file(4) end)
    end
}
