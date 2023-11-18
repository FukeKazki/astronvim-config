return {
  "AstroNvim/astrocommunity",
  -- copilot plugin
  { import = "astrocommunity.completion.copilot-lua-cmp" },
  -- cmp plugin
  { import = "astrocommunity.completion.cmp-cmdline" },
  -- language plugin
  { import = "astrocommunity.pack.typescript-all-in-one" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.angular" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.markdown" },
  -- better comment plugin
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  { import = "astrocommunity.editing-support.comment-box-nvim" },
  -- colorizer plugin
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
  -- zen mode plugin
  { import = "astrocommunity.editing-support.true-zen-nvim" },
  { import = "astrocommunity.motion.nvim-surround" },
  -- color scheme plugin
  -- { import = "astrocommunity.colorscheme.nightfox-nvim" },
  { import = "astrocommunity.colorscheme.nord-nvim" },
  -- utility
  { import = "astrocommunity.utility.telescope-live-grep-args-nvim" },
  -- git
  { import = "astrocommunity.git.octo-nvim" },
}
