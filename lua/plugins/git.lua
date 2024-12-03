return {
    {
        "lewis6991/gitsigns.nvim",
        event = "BufRead",
        dependencies = { "nvim-lua/plenary.nvim" },

        config = function()
            require("gitsigns").setup({
            })
        end,
    },
}
