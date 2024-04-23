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
        "graphql",
      })
      opts.eslint = {
        condition = function(util)
          return util.root_has_file ".eslintrc"
            or util.root_has_file ".eslintrc.json"
            or util.root_has_file ".eslintrc.cjs"
            or util.root_has_file ".eslintrc.js"
        end,
      }
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
        -- eslint_d = function()
        --   local null_ls = require "null-ls"
        --   null_ls.register(null_ls.builtins.diagnostics.eslint_d.with {
        --     condition = function(util)
        --       return util.root_has_file ".eslintrc"
        --         or util.root_has_file ".eslintrc.json"
        --         or util.root_has_file ".eslintrc.cjs"
        --         or util.root_has_file ".eslintrc.js"
        --     end,
        --   })
        -- end,
        prettierd = function()
          local null_ls = require "null-ls"
          null_ls.register(null_ls.builtins.formatting.prettierd.with {
            condition = function(util)
              return util.root_has_file ".prettierrc"
                or util.root_has_file ".prettierrc.json"
                or util.root_has_file ".prettierrc.cjs"
                or util.root_has_file ".prettierrc.js"
                or util.root_has_file "prettier.config.cjs"
                or util.root_has_file "prettier.config.mjs"
            end,
            -- condition = function(util)
            --   -- 現在のディレクトリから最上位まで設定ファイルを探す
            --   local function find_prettier_config(path)
            --     if path == nil or path == "/" then return false end
            --     if
            --       util.root_has_file(".prettierrc", path)
            --       or util.root_has_file(".prettierrc.json", path)
            --       or util.root_has_file(".prettierrc.cjs", path)
            --       or util.root_has_file(".prettierrc.js", path)
            --       or util.root_has_file("prettier.config.cjs", path)
            --       or util.root_has_file("prettier.config.mjs", path)
            --     then
            --       return true
            --     end
            --     -- 親ディレクトリに移動して再検索
            --     return find_prettier_config(vim.fn.fnamemodify(path, ":h"))
            --   end
            --
            --   return find_prettier_config(vim.fn.getcwd())
            -- end,
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
