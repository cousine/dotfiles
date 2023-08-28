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
    dir = "~/projects/neovim/trouble.nvim",
    dev = true,
    opts = {
      auto_open = { vim.diagnostic.severity.ERROR },
      auto_close = true,
    },
  },
}
