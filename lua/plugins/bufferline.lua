return {
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            {
                "echasnovski/mini.bufremove",
                version = "*",
                config = function()
                    require("mini.bufremove").setup({
                    silent = true,
                })
                end,
            },
        },
        config = function()
            require("bufferline").setup({
                options = {
                    show_buffer_close_icons = false,
                    --mode = 'tabs',
                    separator_style = 'thick',
                    show_close_icon = false,
                    diagnostics = 'nvim_lsp',
                    always_show_bufferline = true,

                    close_command = function(n) Snacks.bufdelete(n) end,
                },
            })
        end,
    }
}
