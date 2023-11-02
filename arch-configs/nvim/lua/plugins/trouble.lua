return {
  -- {
  --   "folke/trouble.nvim",
  --   enabled = false,
  --   opts = {
  --     auto_open = true,
  --     auto_close = true,
  --   },
  -- },
  {
    dir = "~/Projects/neovim/trouble.nvim",
    opts = {
      auto_open = { vim.diagnostic.severity.ERROR },
      auto_close = true,
    },
  },
}
