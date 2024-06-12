-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.mapleader = ","
-- vim.opt.winbar = "%=%m %f"
vim.o.exrc = true

vim.g.show_coverage = false

-- vim.diagnostic.config({
--   virtual_text = true,
--   signs = {
--     text = {
--       [vim.diagnostic.severity.ERROR] = "",
--       [vim.diagnostic.severity.WARN] = "",
--       [vim.diagnostic.severity.HINT] = "",
--       [vim.diagnostic.severity.INFO] = "",
--     },
--     linehl = {
--       [vim.diagnostic.severity.ERROR] = "ErrorMsg",
--     },
--     numhl = {
--       [vim.diagnostic.severity.WARN] = "WarningMsg",
--     },
--   },
--
--   underline = true,
--   update_in_insert = false,
--   severity_sort = true,
-- })
