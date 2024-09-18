require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- delve debugging
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add breakpoint at line" })
map("n", "<leader>dus", function()
  local widgets = require "dap.ui.widgets"
  local sidebar = widgets.sidebar(widgets.scopes)
  sidebar.open()
end, { desc = "Open debugging sidebar" })
map("n", "<leader>dgt", function()
  require("dap-go").debug_test()
end, { desc = "Debug go test" })
map("n", "<leader>dgl", function()
  require("dap-go").debug_last()
end, { desc = "Debug last go test" })

-- tmux overrides
map("n", "<C-h>", "<cmd> TmuxNavigateLeft <CR>", { desc = "window left" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight <CR>", { desc = "window right" })
map("n", "<C-j>", "<cmd> TmuxNavigateBottom <CR>", { desc = "window down" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp <CR>", { desc = "window up" })
