-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = { "bashls", "pylsp", "csharp_ls", "clangd", "neocmake" }
local nvlsp = require "nvchad.configs.lspconfig"

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach(client, bufnr),
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }

  if lsp == "clangd" then
    vim.keymap.set(
      "n",
      "<leader>ss",
      ":ClangdSwitchSourceHeader<CR>",
      { noremap = true, silent = true, desc = "Toggle source header" }
    )
    vim.keymap.set("n", "<leader>;", "A;<Esc>", { noremap = true, silent = true, desc = "Add semicolon" })
  end
end
