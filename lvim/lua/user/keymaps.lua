local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

--keymaps
lvim.leader = "space"
lvim.keys.visual_mode["p"] = [["_dP]] -- paste and keep
lvim.keys.normal_mode["y"] = [["+y]]
lvim.keys.visual_mode["y"] = [["+y]]
lvim.keys.normal_mode["Y"] = [["+Y]]
lvim.keys.normal_mode["d"] = [["_d]] -- delete but don't yank
lvim.keys.normal_mode["c"] = [["_c]] -- change but don't yank
lvim.keys.normal_mode["<C-a>"] = "gg<S-v>G"
lvim.keys.insert_mode["jj"] = "<ESC>"
lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"
lvim.keys.term_mode["<C-\\>"] = "<C-\\><C-n>"

--Telescope
lvim.keys.normal_mode["<leader>Td"] = ":TodoTelescope<cr>"
lvim.keys.normal_mode["<C:Telescope colorscheme-s>"] = ":w<cr>"

--harpoon
lvim.builtin.which_key.mappings["a"] = {
  mark.add_file, "Mark file"
}
lvim.keys.normal_mode["<C-e>"] = ui.toggle_quick_menu
lvim.keys.normal_mode["<C-h>"] = function() ui.nav_file(1) end
lvim.keys.normal_mode["<C-j>"] = function() ui.nav_file(2) end
lvim.keys.normal_mode["<C-k>"] = function() ui.nav_file(3) end
lvim.keys.normal_mode["<C-l>"] = function() ui.nav_file(4) end
