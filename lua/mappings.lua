require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
map("n", "nh", ":nohl<CR>", { desc = "Clear search highlights" })



map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>", { desc = "Save file" } )

map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>sh", "<C-w>h", { desc = "Split window horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
map("n", "<leader>sx", "<C-w>q", { desc = "Close current split" })
map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })


-- telescope
map("n", "<leader>fc", "<cmd>Telescope grep_string<CR>", { desc = "Find the string under the cursor in cwd" })
