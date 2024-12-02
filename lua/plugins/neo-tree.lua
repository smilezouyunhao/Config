return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
          "MunifTanjim/nui.nvim",
        },

        config = function()
            require("neo-tree").setup({
                event_handlers = {
                    -- Close Neotree after Open File
                    {
                        event = "file_open_requested",
                        handler = function()
                            -- auto close
                            -- vim.cmd("Neotree close")
                            -- OR
                            -- require("neo-tree.command").execute({ action = "close" })
                        end,
                    },
                },
                window = {
                    mappings = {
                        ['e'] = function() vim.api.nvim_exec('Neotree focus filesystem left', true) end,
                        ['b'] = function() vim.api.nvim_exec('Neotree focus buffers left', true) end,
                        ['g'] = function() vim.api.nvim_exec('Neotree focus git_status left', true) end,
                    },
                },
            })
        end,
    }
}
