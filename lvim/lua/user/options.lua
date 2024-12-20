vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
vim.wo.foldtext =
[[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']]

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- general
lvim.log.level = "warn"
lvim.builtin.dap.active = true
lvim.builtin.breadcrumbs.active = false
lvim.builtin.wrap = true
lvim.format_on_save.enabled = false
lvim.builtin.indentlines = {
  active = false
}
lvim.transparent_window = true
lvim.builtin.lualine.options.theme = "auto"
lvim.colorscheme = "catppuccin"
lvim.lsp.automatic_configuration.skipped_servers = { "dartls", "rust_analyzer" }
lvim.builtin.which_key.setup.plugins.presets.z = true
vim.opt_global.relativenumber = true
vim.opt_global.guifont = "FiraCode Nerd Font:h18"
vim.opt.smartindent = true
vim.opt_global.showmode = true
vim.opt_global.wrap = true

if vim.g.neovide then
  vim.g.neovide_cursor_vfx_mode = "railgun"
  vim.g.neovide_transparency = 0.9
  vim.g.neovide_scale_factor = 0.7
  vim.g.neovide_font_hinting = "none"
  vim.g.neovide_font_edging = "subpixelantialias"
end
vim.g.autosave = true
lvim.autosave = true
lvim.autosave_time = 500
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
local gheight = vim.api.nvim_list_uis()[1].height
local gwidth = vim.api.nvim_list_uis()[1].width
local width = 30
local height = 30
lvim.builtin.nvimtree.setup.view.float.open_win_config = {
  relative = "editor",
  width = width,
  height = height,
  row = (gheight - height) * 0.4,
  col = (gwidth - width) * 0.5,
}
lvim.builtin.nvimtree.setup.view.float.open_win_config.border = "rounded"
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.actions.open_file.quit_on_open = true
lvim.builtin.nvimtree.setup.filesystem_watchers.enable = false
lvim.builtin.nvimtree.setup.diagnostics.show_on_dirs = true
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.nvimtree.setup.view.float.enable = true
lvim.builtin.terminal.open_mapping = "<c-t>"
lvim.builtin.terminal.direction = "horizontal"
lvim.builtin.telescope.extensions = {
  extensions = {
    media_files = {
      filetypes = { "png", "webp", "jpg", "jpeg" },
      find_cmd = "rg"
    }
  },
  defaults = {
    layout_config = {
      horizontal = {
        preview_cutoff = 0,
      },
    },
  },
}
-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "c",
  "lua",
  "cmake",
  "cpp",
  "dart",
  "rust",
  "go",
  "typescript",
  "tsx",
}
lvim.builtin.treesitter.ignore_install = { "help" }
lvim.builtin.treesitter.indent = {
  enable = true,
  disable = { "dart" }
}
lvim.lsp.installer.setup.automatic_installation = {
  exclude = { "sourcery", "denols", "angularls", "glint",
    "quick_lint_js", "rome", "ember",
  },
}
lvim.builtin.treesitter.autotag.enable = true

require("catppuccin").setup({
  flavour = "mocha", -- latte, frappe, macchiato, mocha
  background = {
    light = "latte",
    dark = "mocha",
  },
  transparent_background = true, -- disables setting the background color.
  show_end_of_buffer = false,    -- shows the '~' characters after the end of buffers
  term_colors = true,            -- sets terminal colors (e.g. `g:terminal_color_0`)
  dim_inactive = {
    enabled = false,             -- dims the background color of inactive window
    shade = "dark",
    percentage = 0.15,           -- percentage of the shade to apply to the inactive window
  },
  no_italic = false,             -- Force no italic
  no_bold = false,               -- Force no bold
  no_underline = false,          -- Force no underline
  styles = {                     -- Handles the styles of general hi groups (see `:h highlight-args`):
    comments = { "italic" },     -- Change the style of comments
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  color_overrides = {},
  custom_highlights = {},
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    treesitter = true,
    notify = false,
    harpoon = true,
    noice = true,
    mini = {
      enabled = true,
      indentscope_color = "",
    },
  },
})

-- Rust setup
-- local mason_registry = require("mason-registry")

-- local codelldb = mason_registry.get_package("codelldb")
-- local extension_path = codelldb:get_install_path() .. "/extension/"
-- local codelldb_path = extension_path .. "adapter/codelldb"
-- local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"

-- pcall(function()
--   require("rust-tools").setup {
--     tools = {
--       executor = require("rust-tools/executors").termopen,
--       reload_workspace_from_cargo_toml = true,
--       runnables = {
--         use_telescope = true,
--       },
--       inlay_hints = {
--         auto = true,
--         only_current_line = false,
--         show_parameter_hints = false,
--         parameter_hints_prefix = "<-",
--         other_hints_prefix = "=>",
--         max_len_align = false,
--         max_len_align_padding = 1,
--         right_align = false,
--         right_align_padding = 7,
--         highlight = "Comment",
--       },
--       hover_actions = {
--         border = "rounded",
--       },
--       on_initialized = function()
--         vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
--           pattern = { "*.rs" },
--           callback = function()
--             local _, _ = pcall(vim.lsp.codelens.refresh)
--           end,
--         })
--       end,
--     },
--     dap = {
--       -- adapter= codelldb_adapter,
--       adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
--     },
--     server = {
--       on_attach = function(client, bufnr)
--         require("lvim.lsp").common_on_attach(client, bufnr)
--         local rt = require "rust-tools"
--         vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
--       end,

--       capabilities = require("lvim.lsp").common_capabilities(),
--       settings = {
--         ["rust-analyzer"] = {
--           lens = {
--             enable = true,
--           },
--           checkOnSave = {
--             enable = true,
--             command = "clippy",
--           },
--         },
--       },
--     },
--   }
-- end)

-- lvim.builtin.dap.on_config_done = function(dap)
--   dap.adapters.codelldb = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path)
--   dap.configurations.rust = {
--     {
--       name = "Launch file",
--       type = "codelldb",
--       request = "launch",
--       program = function()
--         local prompt = "Path to executable: " .. vim.fn.getcwd() .. "/"
--         return vim.fn.input(prompt)
--       end,
--       cwd = "${workspaceFolder}",
--       stopOnEntry = false,
--     },
--   }
-- end

-- vim.api.nvim_set_keymap("n", "<m-d>", "<cmd>RustOpenExternalDocs<Cr>", { noremap = true, silent = true })
