require "nvchad.mappings"

local map = vim.keymap.set
---------------------------
----- My mappings -----
---------------------------
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- rebind j/k with gj/gk
map("n", "j", function()
  return vim.v.count == 0 and "gj" or "j"
end, { expr = true, noremap = true })

map("n", "k", function()
  return vim.v.count == 0 and "gk" or "k"
end, { expr = true, noremap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- useful edit keymaps
map("x", "<leader>p", [["_dP]], { desc = "Primeagen Copy" })
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll plus zz" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll plus zz" })
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Line Up" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Line Down" })

-- disable diagnostic
map(
  "n",
  "<leader>ud",
  ":lua vim.diagnostic.enable(not vim.diagnostic.is_enabled())<CR>",
  { desc = "Toggle Diagnostic", silent = true }
)
