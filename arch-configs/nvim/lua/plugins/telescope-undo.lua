return {
  "debugloop/telescope-undo.nvim",

  dependencies = {
    "nvim-telescope/telescope.nvim",
  },

  keys = {
    {
      "<leader>uu",
      "<cmd>Telescope undo<cr>",
      desc = "Telescope undo history",
    },
  },
  config = function()
    LazyVim.on_load("telescope.nvim", function()
      local ok, err = pcall(require("telescope").load_extension, "undo")
      if not ok then
        LazyVim.error("Failed to load `telescope-undo.nvim`:\n" .. err)
      end
    end)
  end,
}
