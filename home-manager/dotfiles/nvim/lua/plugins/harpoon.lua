return {
    "theprimeagen/harpoon",

    config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        vim.keymap.set("n", "<leader>a", mark.add_file, {
            desc = "Add file to Harpoon"
        })

        vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu, {
            desc = "Open Harpoon UI"
        })

        vim.keymap.set("n", "<leader>n", function() ui.nav_file(1) end, {
            desc = "Open Harpoon file 1"
        })
        vim.keymap.set("n", "<leader>e", function() ui.nav_file(2) end, {
            desc = "Open Harpoon file 2"
        })
        vim.keymap.set("n", "<leader>i", function() ui.nav_file(3) end, {
            desc = "Open Harpoon file 3"
        })
        vim.keymap.set("n", "<leader>o", function() ui.nav_file(4) end, {
            desc = "Open Harpoon file 4"
        })
    end
}
