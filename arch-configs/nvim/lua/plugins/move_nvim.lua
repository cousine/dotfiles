return {
  {
    "fedepujol/move.nvim",
    keys = {
      { "<leader>k", ":MoveLine(-1)<cr>", desc = "move line up", mode = { "n" }, silent = true },
      { "<leader>j", ":MoveLine(1)<cr>", desc = "move line down", mode = { "n" }, silent = true },

      { "<C-k>", ":MoveBlock(-1)<cr>", desc = "move block up", mode = { "v" }, silent = true },
      { "<C-j>", ":MoveBlock(1)<cr>", desc = "move block down", mode = { "v" }, silent = true },
    },
  },
}
