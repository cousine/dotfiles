-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Disable arrow keys
vim.keymap.set("n", "<Up>", "<Nop>")
vim.keymap.set("n", "<Down>", "<Nop>")
vim.keymap.set("n", "<Right>", "<Nop>")
vim.keymap.set("n", "<Left>", "<Nop>")

-- Switch 0 & ^
vim.keymap.set("n", "0", "^")
vim.keymap.set("n", "^", "0")

-- Save on double Esc
vim.keymap.set(
  "n",
  "<leader><esc>",
  "<cmd>lua vim.api.nvim_buf_clear_namespace(0, -1, 0, -1)<CR><esc>",
  { desc = "Escape and Clear duplicate Highlights" }
)
vim.keymap.set("", "<Esc><Esc>", ":w<CR>", { desc = "Save file" })

-- Splits
vim.keymap.set("n", "<leader>\\", "<C-w>v<C-w>left", { silent = true, noremap = true, desc = "Split pane vertically" })
vim.keymap.set("n", "<leader><tab>z", ":tab split<CR>", { noremap = true, desc = "Open split in tab" })
vim.keymap.set("n", "<leader><tab>c", ":tab close<CR>", { noremap = true, desc = "Close Tab" })

-- Buffer Nav
vim.keymap.set("n", "<leader>]", ":bn<CR>", { silent = true, noremap = true, desc = "Next buffer" })
vim.keymap.set("n", "<leader>[", ":bp<CR>", { silent = true, noremap = true, desc = "Previous buffer" })
vim.keymap.set("n", "<leader>q", ":bdelete<CR>", { silent = true, noremap = true, desc = "Close buffer" })

-- Escape insert mode on jj
vim.keymap.set("i", "jj", "<Esc>", { desc = "Escape insert mode on jj" })

-- tmux-neovim-navigation
local nvim_tmux_nav = require("nvim-tmux-navigation")
vim.keymap.set("n", "<M-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
vim.keymap.set("n", "<M-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
vim.keymap.set("n", "<M-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
vim.keymap.set("n", "<M-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
vim.keymap.set("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
vim.keymap.set("n", "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)

-- Neotree custom navigation
vim.keymap.set("n", "<leader>.", ":Neotree filesystem reveal<CR>", { silent = true, desc = "Jump to file in Neotree" })

-- InsertCeneterdTitleComment
vim.keymap.set(
  "n",
  "<leader>ct",
  ":lua InsertCenteredTitleComment()<CR>",
  { noremap = true, silent = true, desc = "Insert a horizontal line with a title centered" }
)

-- InsertCeneterdTitleComment
vim.keymap.set(
  "n",
  "<leader>sdd",
  ":lua ToggleHighlightDuplicates()<CR>",
  { noremap = true, silent = true, desc = "Highlights duplicate lines" }
)
