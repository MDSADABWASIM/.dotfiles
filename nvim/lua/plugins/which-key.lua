return {
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>q", desc = "Quit" },
      },
    },
  },

  {
    "folke/persistence.nvim",
    keys = function()
      return {}
    end,
  },
}
