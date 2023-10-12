-- customize mason plugins
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        -- "lua_ls",
      })
    end,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        -- "prettier",
        -- "stylua",
      })
      opts.handlers = {
        deno_fmt = function()
          local null_ls = require "null-ls"
          null_ls.register(null_ls.builtins.formatting.deno_fmt.with {
            condition = function(util) return util.root_has_file "deno.json" or util.root_has_file "deno.jsonc" end,
          })
        end,
        eslint_d = function()
          local null_ls = require "null-ls"
          null_ls.register(null_ls.builtins.diagnostics.eslint_d.with {
            condition = function(util)
              return util.root_has_file ".eslintrc"
                or util.root_has_file ".eslintrc.json"
                or util.root_has_file ".eslintrc.js"
            end,
          })
        end,
      }
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        -- "python",
      })
    end,
  },
}
