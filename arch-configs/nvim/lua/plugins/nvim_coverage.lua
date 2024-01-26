return {
  {
    "andythigpen/nvim-coverage",
    keys = {
      {
        "<leader>dv",
        function()
          local cov = require("coverage")
          vim.g.show_coverage = not vim.g.show_coverage
          cov.load(vim.g.show_coverage)
        end,
        desc = "Coverage Toggle",
      },
    },
    config = function()
      local coverage = require("coverage")

      local load_cb = function()
        if vim.g.show_coverage then
          coverage.show()
        else
          coverage.hide()
        end
      end

      coverage.setup({
        auto_reload = true,
        load_coverage_cb = load_cb,
        signs = {
          -- use your own highlight groups or text markers
          covered = { hl = "CoverageCovered", text = "┃" },
          uncovered = { hl = "CoverageUncovered", text = "┃" },
        },
      })
    end,
  },
}
