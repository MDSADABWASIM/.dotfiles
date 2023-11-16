
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
vim.wo.foldtext =
    [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']]

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
lvim.builtin.nvimtree.setup.actions.open_file.quit_on_open = true
lvim.builtin.lualine.options.theme = "auto"
lvim.colorscheme = "catppuccin"
lvim.lsp.automatic_configuration.skipped_servers = {"dartls"}
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
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.diagnostics.show_on_dirs = true
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.terminal.open_mapping = "<c-t>"
lvim.builtin.terminal.direction = "horizontal"

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
    "c",
    "lua",
    "cmake",
    "cpp",
    "dart"
}
lvim.builtin.treesitter.ignore_install = {"help"}
lvim.builtin.treesitter.indent = {
    enable = true,
    disable = {"dart"}
}
require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = {
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true, -- disables setting the background color.
    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
    term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
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

