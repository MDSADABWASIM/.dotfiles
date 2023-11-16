local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

--keymaps
lvim.leader = "space"
lvim.keys.visual_mode["p"] = [["_dP]] -- paste and keep
lvim.keys.normal_mode["y"] = [["+y]]
lvim.keys.visual_mode["y"] = [["+y]]
lvim.keys.normal_mode["Y"] = [["+Y]]
lvim.keys.normal_mode["d"] = [["_d]]
lvim.keys.normal_mode["<C:Telescope colorscheme-s>"] = ":w<cr>"
lvim.keys.insert_mode["jj"] = "<ESC>"
lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"
lvim.keys.normal_mode["<leader>Td"] = ":TodoTelescope<cr>"

lvim.keys.normal_mode["<leader>a"] = mark.add_file
lvim.keys.normal_mode["<C-e>"] = ui.toggle_quick_menu
lvim.keys.normal_mode["<C-h>"] = function()
	ui.nav_file(1)
end
lvim.keys.normal_mode["<C-t"] = function()
	ui.nav_file(2)
end
lvim.keys.normal_mode["<C-n"] = function()
	ui.nav_file(2)
end
lvim.keys.normal_mode["<C-s"] = function()
	ui.nav_file(2)
end
