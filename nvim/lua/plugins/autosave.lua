return {
  {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup({
        trigger_events = { "InsertLeave" },
        execution_message = { message = "" },
        debounce_delay = 135,
      })
    end,
  },
}
