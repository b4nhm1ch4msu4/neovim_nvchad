-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = { "bashls", "cmake", "pylsp", "clangd" }
local nvlsp = require "nvchad.configs.lspconfig"

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach(client, bufnr),
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- manually set up LSP lua_ls
lspconfig.lua_ls.setup {
  on_attach = nvlsp.on_attach(client, bufnr),
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
}
