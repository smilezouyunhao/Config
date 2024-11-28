return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    config = function()
        require("snacks").setup({
            --configuration comes here
            notifier = { enabled = true },
            lazygit = {
                configure = false,
                win = {
                    position = "float",
                    width = 0.99,
                    height = 0.99,
                },
            },
            terminal = {
                win = {
                    position = "right",
                    width = 0.5,
                    wo = {
                        winbar = "", -- hidde terminal title
                    },
                },
            },
        })
    end,
}
