local wk = lvim.builtin.which_key

lvim.keys.normal_mode["<C-m>"] = ":m .+1<CR>=="

wk.mappings["t"] = {
  name = "Trouble",
  x = { "<cmd>Trouble diagnostics toggle<cr>", "Toggle" },
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix toggle<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist toggle<cr>", "LocationList" },
}


lvim.builtin.which_key.mappings["dT"] = {
  ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", "Conditional breakpoint"
}

lvim.builtin.which_key.mappings["ss"] = { ":Telescope grep_string<cr>",
  "Find String",
}

wk.mappings["n"] = {
  name = 'Noice',
  d = { ":Noice dismiss<cr>", "Dismiss" },
  h = { ":Noice history<cr>", "History" },
  l = { ":Noice last<cr>", "Last" },
  e = { ":Noice error<cr>", "Errors" },
}

wk.mappings["m"] = {
  name = 'Mobile',
  e = { ":FlutterEmulators<cr>", "Emulators" },
  r = { ":FlutterReload<cr>", "Reload" },
  d = { ":FlutterRun <cr>", "Run on dev" },
  s = { ":FlutterRun <cr>", "Run on stg" },
  p = { ":FlutterRun <cr>", "Run on prod" },

  R = { ":FlutterRestart<cr>", "Restart" },
  q = { ":FlutterQuit<cr>", "Quit" },
  D = { ":FlutterDetach<cr>", "Detach" },
  t = { ":FlutterOutlineToggle<cr>", "Toggle outline" },
  dt = { ":FlutterDevTools<cr>", "Devtools" },
  c = { ":FlutterLogClear<cr>", "Clear log" }
}

-- lvim.builtin.which_key.mappings["C"] = {
--   name = "Rust",
--   r = { ":RustRunnables<cr>", "Runnables" },
--   t = { ":lua _CARGO_TEST()<cr>", "Cargo Test" },
--   m = { ":RustExpandMacro<cr>", "Expand Macro" },
--   c = { ":RustOpenCargo<cr>", "Open Cargo" },
--   p = { ":RustParentModule<cr>", "Parent Module" },
--   d = { ":RustDebuggables<cr>", "Debuggables" },
--   v = { ":RustViewCrateGraph<cr>", "View Crate Graph" },
--   R = {
--     ":lua require('rust-tools/workspace_refresh')._reload_workspace_from_cargo_toml()<cr>",
--     "Reload Workspace",
--   },
--   o = { ":RustOpenExternalDocs<cr>", "Open External Docs" },
--   y = { ":lua require'crates'.open_repository()<cr>", "[crates] open repository" },
--   P = { ":lua require'crates'.show_popup()<cr>", "[crates] show popup" },
--   i = { ":lua require'crates'.show_crate_popup()<cr>", "[crates] show info" },
--   f = { ":lua require'crates'.show_features_popup()<cr>", "[crates] show features" },
--   D = { ":lua require'crates'.show_dependencies_popup()<cr>", "[crates] show dependencies" },
-- }
