require "nvchad.options"

local opt = vim.opt
local o = vim.o
local g = vim.g

---------------------------
----- My options ----------
---------------------------

opt.conceallevel = 1
opt.scrolloff = 10
opt.relativenumber = true
opt.linebreak = true
-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.diagnostic.enable(false)
