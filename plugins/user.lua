local prefix = "<leader>g"
return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim", -- optional
      "ibhagwan/fzf-lua", -- optional
    },
    event = "User AstroGitFile",
    keys = {
      { prefix .. "nt", "<cmd>Neogit<CR>", desc = "Open Neogit Tab Page" },
    },
    config = true,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "User AstroFile",
    config = function()
      require("copilot").setup {
        require("copilot").setup {
          filetypes = {
            markdown = true,
          },
          suggestion = { auto_trigger = true, debounce = 150 },
        },
      }
    end,
  },
}
