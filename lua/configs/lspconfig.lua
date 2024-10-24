-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = { "bashls", "cmake", "pylsp", "clangd" }
local nvlsp = require "nvchad.configs.lspconfig"

-- overwrite default "gr" keymap
local overwrite_on_attach = function(client, bufnr)
  nvlsp.on_attach(client, bufnr)
  vim.keymap.set("n", "gr", "<cmd> Telescope lsp_references<cr>", { buffer = bufnr })
end

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = overwrite_on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- manually set up LSP lua_ls
lspconfig.lua_ls.setup {
  on_attach = overwrite_on_attach,
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
