return {
  "epwalsh/obsidian.nvim",
  enabled = false,
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  -- ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    -- refer to `:h file-pattern` for more examples
    "BufReadPre /mnt/c/Users/mike_pham/Documents/Mike/Test/*.md",
    "BufNewFile /mnt/c/Users/mike_pham/Documents/Mike/Test/*.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    workspaces = {
      {
        name = "test",
        path = "/mnt/c/Users/mike_pham/Documents/Mike/Test",
        overrides = {
          notes_subdir = "9. Home",
          daily_notes = {
            folder = "5. DaybyDay",
            template = "Wonderful Day",
          },
          mappings = {
            -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
            ["gf"] = {
              action = function()
                return require("obsidian").util.gf_passthrough()
              end,
              opts = { noremap = false, expr = true, buffer = true },
            },
            -- Toggle check-boxes.
            ["<leader>cb"] = {
              action = function()
                return require("obsidian").util.toggle_checkbox()
              end,
              opts = { buffer = true },
            },
            -- Smart action depending on context, either follow link or toggle checkbox.
            ["<cr>"] = {
              action = function()
                return require("obsidian").util.smart_action()
              end,
              opts = { buffer = true, expr = true },
            },
          },
          new_notes_location = "current_dir",
          wiki_link_func = "use_path_only",
          disable_frontmatter = true,
          templates = {
            folder = "4. Templates",
          },
          attachments = {
            folder = "6. Attachments",
          },
        },
      },
    },
  },
}
