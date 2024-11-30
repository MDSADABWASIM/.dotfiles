return {
  {
    "L3MON4D3/LuaSnip",
    config = function()
      local luasnip = require("luasnip")
      luasnip.filetype_extend("dart", { "flutter" })
      luasnip.filetype_extend("javascript", { "javascriptreact" })
      luasnip.filetype_extend("javascript", { "html" })
    end,
  },
}
