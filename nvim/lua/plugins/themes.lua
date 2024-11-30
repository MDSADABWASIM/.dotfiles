return {
  { "sainnhe/everforest" },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,

    config = function(_, _)
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        transparent_background = true,
      })
    end,
  },
  {
    "tiagovla/tokyodark.nvim",
    opts = {},
    config = function(_, opts)
      require("tokyodark").setup(opts)
      vim.cmd([[colorscheme tokyodark]])
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
