-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local map = vim.keymap.set
local del = vim.keymap.del

map("n", "<leader>cj", "<cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "Next Diagnostic" })
map("n", "<leader>ck", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { desc = "Prev Diagnostic" })
map(
  "n",
  "<leader>ce",
  "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>",
  { desc = "Error" }
)

-- Mobile group
map("n", "<leader>m", "", { desc = "Mobile" }) -- Group header, no mapping

map("n", "<leader>me", "<cmd>FlutterEmulators<cr>", { desc = "Emulators" })
map("n", "<leader>mr", "<cmd>FlutterReload<cr>", { desc = "Reload" })
map("n", "<leader>md", "<cmd>FlutterRun<cr>", { desc = "Run on dev" })
map(
  "n",
  "<leader>ms",
  "<cmd>FlutterRun --flavor staging --dart-define BACKEND_API_URL=https://app-camio-api-staging.azurewebsites.net/<cr>",
  { desc = "Run on stg" }
)
map(
  "n",
  "<leader>mp",
  "<cmd>FlutterRun --flavor production --dart-define BACKEND_API_URL=https://app-camio-api-prd.azurewebsites.net/<cr>",
  { desc = "Run on prod" }
)
map("n", "<leader>mR", "<cmd>FlutterRestart<cr>", { desc = "Restart" })
map("n", "<leader>mq", "<cmd>FlutterQuit<cr>", { desc = "Quit" })
map("n", "<leader>mD", "<cmd>FlutterDetach<cr>", { desc = "Detach" })
map("n", "<leader>mt", "<cmd>FlutterOutlineToggle<cr>", { desc = "Toggle outline" })
map("n", "<leader>ms", "<cmd>FlutterDevTools<cr>", { desc = "Devtools" })
map("n", "<leader>mc", "<cmd>FlutterLogClear<cr>", { desc = "Clear log" })

-- Quit
del("n", "<leader>qq")
map("n", "<leader>q", "<cmd>qa<cr>", { desc = "Quit" })

map("n", "<C-m>", "<cmd>m .+1<CR>==", { desc = "Move line down" })
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
-- Paste and keep in visual mode
map("v", "p", [["_dP]])

-- Yank to system clipboard
map("n", "y", [["+y]])
map("v", "y", [["+y]])
map("n", "Y", [["+Y]])

-- Delete/change without yanking
map("n", "d", [["_d]])
map("n", "c", [["_c]])

-- Select all text
map("n", "<C-a>", "gg<S-v>G")

-- toggle terminal
map("n", "<C-t>", function()
  Snacks.terminal()
end, { desc = "Terminal (cwd)" })
map("t", "<C-t>", "<cmd>close<cr>", { desc = "Hide Terminal" })

-- Exit insert mode with 'jj'
map("i", "jj", "<ESC>")

-- Scroll and center
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Exit terminal mode
map("t", "<C-\\>", "<C-\\><C-n>")

-- Harpoon keymaps
map("n", "<leader>a", mark.add_file, { desc = "Mark file" })
map("n", "<C-e>", ui.toggle_quick_menu)
map("n", "<C-h>", function()
  ui.nav_file(1)
end)
map("n", "<C-j>", function()
  ui.nav_file(2)
end)
map("n", "<C-k>", function()
  ui.nav_file(3)
end)
map("n", "<C-l>", function()
  ui.nav_file(4)
end)
