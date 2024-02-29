return {
  {
    "m00qek/baleia.nvim",
    config = function()
      vim.api.nvim_create_user_command("BaleiaColorize", function()
        local baleia = require("baleia")
        baleia.setup({}).once(vim.api.nvim_get_current_buf())
      end, {})
    end,
  },
}
