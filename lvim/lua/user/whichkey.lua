local wk = lvim.builtin.which_key

wk.mappings["t"] = {
    name = "Trouble",
    x = {"<cmd>TroubleToggle<cr>", "Toggle"},
    r = {"<cmd>Trouble lsp_references<cr>", "References"},
    f = {"<cmd>Trouble lsp_definitions<cr>", "Definitions"},
    d = {"<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics"},
    q = {"<cmd>Trouble quickfix<cr>", "QuickFix"},
    l = {"<cmd>Trouble loclist<cr>", "LocationList"},
    w = {"<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics"}
}


lvim.builtin.which_key.mappings["dT"] = {
    ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", "Conditional breakpoint"
}

wk.mappings["m"]={
    name='Mobile',
    
    e = {":FlutterEmulators<cr>","Emulators"},
    r = {":FlutterReload<cr>","Reload"},
    d = {":FlutterRun --flavor development --dart-define BACKEND_API_URL=https://app-camio-api-dev.azurewebsites.net/<cr>","Run on dev"},
    s = {":FlutterRun --flavor staging --dart-define BACKEND_API_URL=https://app-camio-api-staging.azurewebsites.net/<cr>","Run on stg"},
    p = {":FlutterRun --flavor production --dart-define BACKEND_API_URL=https://app-camio-api-prd.azurewebsites.net/<cr>","Run on prod"},

    R = {":FlutterRestart<cr>","Restart"},
    q = {":FlutterQuit<cr>","Quit"},
    D = {":FlutterDetach<cr>","Detach"},
    t = {":FlutterOutlineToggle<cr>","Toggle outline"},
    dt = {":FlutterDevTools<cr>","Devtools"},
    c = {":FlutterLogClear<cr>","Clear log"}
}

