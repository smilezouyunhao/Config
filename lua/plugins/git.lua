return {
    -- Git_Signs
    {
        "lewis6991/gitsigns.nvim",
        event = "BufRead",
        dependencies = { "nvim-lua/plenary.nvim" },

        config = function()
            require("gitsigns").setup({
            })
        end,
    },

    -- Lazygit
    {
        "kdheepak/lazygit.nvim",
        lazy = true,
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        -- setting the keybinding for LazyGit with 'keys' is recommended in
        -- order to load the plugin when the command is run for the first time
        keys = {
            { "<leader>lg", ":LazyGit<cr>", desc = "LazyGit" },
        },
    },
}
