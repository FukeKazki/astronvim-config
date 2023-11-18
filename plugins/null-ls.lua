return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    --  ╭──────────────────────────────────────────────────────────╮
    --  │                     texltlintの設定                      │
    --  │        rootに.textlintrcがある場合のみ有効にする         │
    --  ╰──────────────────────────────────────────────────────────╯
    local textlint = null_ls.builtins.diagnostics.textlint.with {
      condition = function(utils) return utils.root_has_file { ".textlintrc", ".textlintrc.json" } end,
      filetypes = { "markdown", "mdx" },
    }

    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      textlint,
      -- Set a formatter
      -- null_ls.builtins.formatting.stylua,
      -- null_ls.builtins.formatting.prettierd,
    }
    return config -- return final config table
  end,
}
