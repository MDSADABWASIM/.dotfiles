return {
  {
    "AlexvZyl/nordic.nvim",
    config = function()
      require("nordic").setup({
        transparent = true,
        on_highlight = {
          Visual = {
            bg = "#a68a64",
            bold = false,
          },
        },
      })
    end,
  },
  {
    "vhyrro/luarocks.nvim",
    opts = {
      rocks = { "magick" },
    },
  },
  {
    "3rd/image.nvim",
    dependencies = { "vhyrro/luarocks.nvim" },
    config = function()
      require("image").setup({
        integrations = {},
        backend = "kitty",
        max_height_window_percentage = 50,
        hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.svg" },
        kitty_method = "normal",
      })
    end,
  },
}
