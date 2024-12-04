return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
          "MunifTanjim/nui.nvim",
        },
        cmd = 'Neotree',

        config = function()
            require("neo-tree").setup({
                popup_border_style = 'rounded',
                opts = {
                    close_if_last_window = true,
                    sources = { 'filesystem', 'buffers', 'git_status' },
                },
                source_selector = {
                    winbar = true,
                    show_scrolled_off_parent_node = true,
                    statusline = false,
                    padding = { left = 1, right = 0 },
                    sources = {
                        { source = 'filesystem', display_name = '  Files' }, --      
                        { source = 'buffers', display_name = '  Buffers' }, --      
                        { source = 'git_status', display_name = ' 󰊢 Git' }, -- 󰊢      
                    },
                },
                event_handlers = {
                    -- Close neo-tree when opening a file.
                    {
                        event = 'file_opened',
                        handler = function()
                        require('neo-tree').close_all()
                        end,
                    },
                },
                window = {
                    mappings = {
                        ['<S-Tab>'] = 'prev_source',
                        ['<Tab>'] = 'next_source',

                        ['p'] = {
                            'toggle_preview',
                            nowait = true,
                            config = { use_float = true },
                        },
                    },
                },
            })
        end,
    }
}
