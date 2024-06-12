return {
  {
    "ray-x/go.nvim",
    config = function()
      require("go").setup({
        diagnostic = false, -- messes up neovim 0.10
      })
    end,
    dependencies = {
      "ray-x/guihua.lua",
    },
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
}
