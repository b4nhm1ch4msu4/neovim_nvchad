return {
  "Exafunction/codeium.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },
  event = "BufEnter",
  config = function()
    require("codeium").setup {
      virtual_text = {
        enabled = true,
        key_bindings = {
          accept = "<A-y>",
        },
      },
    }
  end,
}
