return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        config = function()
            require("noice").setup({
                presets = {
                    bottom_search = false,
                    long_message_to_split = true,
                    command_palette = true,
                    lsp_doc_border = true,
                },
            })
        end
    }
}
