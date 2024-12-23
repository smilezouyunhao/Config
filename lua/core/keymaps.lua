local utils = require("core.utils")
local snacks = require("snacks")

-- Map a key combination to a command
---@param modes string|string[]: The mode(s) to map the key combination to
---@param lhs string: The key combination to map
---@param rhs string|function: The command to run when the key combination is pressed
---@param opts table: Options to pass to the keymap
local map = function(modes, lhs, rhs, opts)
    local options = { silent = true }
    if type(modes) == "string" then
        modes = { modes }
    end
    for _, mode in ipairs(modes) do
        vim.keymap.set(mode, lhs, rhs, options)
    end
end

local copilot_toggle_opts = {
    name = "Copilot Completion",
    get = function()
        return not require("copilot.client").is_disabled()
    end,
    set = function()
        if state then
            require("copilot.command").enabled()
        else
            require("copilot.command").disable()
        end
    end,
}


-- Rolling
map("n", "<C-d>", '9j', { desc = "Down 9 Lines" })
map("n", "<C-u>", '9k', { desc = "Up 9 Lines" })

-- Save key strokes (now we do not need to press shift to enter command mode)
--map({ "n", "x" }, ";", ":", { desc = "Enter Command Mode" })

-- Delete a word
map("n", "dw", 'viwd', { desc = "Delete a Word" })

-- Reselect the text that has just been pasted
map("n", "<leader>v", "printf('`[%s`]', getregtype()[0])", {
  expr = true,
  desc = "Reselect Last Pasted area",
})

-- Always use very magic mode for searching
map("n", "/", [[/\v]])

-- Split window
map("n", "<leader>s", ":split<CR>", { desc = "Split by Horizantal" })
map("n", "<leader>v", ":vsplit<CR>", { desc = "Split by Vertical" })

-- Move current line up and down
map("v", "K", ":move '<-2<CR>gv-gv", { desc = "Move Line Up" })
map("v", "J", ":move '>+1<CR>gv-gv", { desc = "Move Line Down" })

-- Indent Code
map("v", "<", "<gv", { desc = "Indent -4 Space" })
map("v", ">", ">gv", { desc = "Indent +4 Space" })

-- Go to start or end of line easier
map({ "n", "x" }, "H", "^", { desc = "Go to Start of Line" })
map({ "n", "x" }, "L", "g_", { desc = "Go to End of Line" })

-- Turn the word under cursor to upper case(lower case)
map("i", "<C-u>", "<Esc>viwUea", { desc = "Turn to Upper Case" })
map("i", "<C-d>", "<Esc>viwuea", { desc = "Turn to Lower Case" })

-- Shortcut for faster save
map("n", "<leader>w", "<cmd>w<CR>", { desc = " Save the file " })
-- Save the file and quit
map("n", "<leader>q", "<cmd>x<CR>", { desc = " Save The File and Quit " })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Lazy
map("n", "<leader>l", ":Lazy<CR>", { desc = "Lazy" })

-- Telescope
map("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find Files" })
map("n", "<leader>re", ":Telescope oldfiles<CR>", { desc = "Find Recent Files" })
map("n", "<leader>fs", ":Telescope live_grep<CR>", { desc = "Find String in CWD" })
map("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Find Buffers" })
map("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = "Find Help Tags" })

-- Neotree
map("n", "<leader>nt", ":Neotree float toggle<CR>", { desc = "Neotree Toggle" })
map("n", "<leader>gs", ":Neotree float git_status<CR>", { desc = "Neotree Git_Status" })
map("n", "<leader>nb", ":Neotree float buffers<CR>", { desc = "Neotree Buffers" })

-- Git_signs
map("n", "<leader>ghd", ":Gitsigns diffthis<CR>", { desc = "Git_Signs Diffthis" })
map("n", "<leader>ght", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Git_Signs Toggle_Current_Line_Blame" })
map("n", "<leader>gm", function() package.loaded.gitsigns.blame_line { full = true } end, { desc = "Git_Signs Blame Line" })

-- Bufferline
map("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Cycle Buffer Next" })
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Cycle Buffer Prev" })
map("n", "<leader>bp", ":BufferLinePick<CR>", { desc = "Buffer Pick" })
map("n", "<leader>bc", ":BufferLinePickClose<CR>", { desc = "Buffer Pick Close" })

-- Todo-Comments
map("n", "<leader>fd", ":TodoTelescope<CR>", { desc = "Todo Telescope" })

-- Clear search with <esc>
map("n", "<Esc>", ":noh<CR><Esc>", { desc = "Escape and Clear Hlsearch" })
