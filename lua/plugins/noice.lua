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
                    bottom_search = true,
                    long_message_to_split = true,
                    lsp_doc_border = true,
                },
                cmdline_popup = {
                    border = {
                        style = "none",
                        padding = { 2, 3 },
                    },
                    filter_options = {},
                    win_options = {
                        winhightlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
                    },
                },
            })
        end
    }
}
