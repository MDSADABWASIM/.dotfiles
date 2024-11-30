return {
  "nvim-telescope/telescope.nvim",
  config = function()
    require("telescope").extensions.flutter.commands()
  end,
}
