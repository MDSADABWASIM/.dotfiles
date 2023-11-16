
lvim.plugins = {
    {"ThePrimeagen/harpoon" },
    {"mfussenegger/nvim-dap"},
    {
        "akinsho/flutter-tools.nvim",
        dependencies = {"nvim-lua/plenary.nvim", "stevearc/dressing.nvim"},
        config = function()
            require("flutter-tools").setup {
                --for windowns only
                -- flutter_path = "/Users/sadabwasim/Documents/development/flutter/bin/flutter.bat",

                ui = {
                    border = "rounded",
                    notification_style = "plugin"
                },
                outline = {
                    open_cmd = "30vnew",
                    auto_open = false
                },
                closing_tags = {
                    highlight = "Comment",
                    prefix = "// ",
                    enabled = true
                },
                debugger = {
                    enabled = true,
                    run_via_dap = true,
                    register_configurations = function(_)
                        require("dap").adapters.dart = {
                            type = "executable",
                            command = vim.fn.stdpath("data") .. "/mason/bin/dart-debug-adapter",
                            args = {"flutter"}
                        }

                        -- require("dap").adapters.flutter = {
                        --   type = "executable",
                        --     command = vim.fn.stdpath('data')..'/mason/bin/dart-debug-adapter',
                        --   args = {"flutter"}
                        -- }

                        require("dap").configurations.dart = {
                            {
                                type = "dart",
                                request = "launch",
                                name = "Launch flutter",
                                dartSdkPath = "/Users/sadabwasim/Documents/development/flutter/bin/cache/dart-sdk/",
                                flutterSdkPath = "/Users/sadabwasim/Documents/development/flutter",
                                program = "${workspaceFolder}/lib/main.dart",
                                cwd = "${workspaceFolder}"
                            }
                        }

                        -- require("dap").configurations.flutter = {
                        --   {
                        --     type = "flutter",
                        --     request = "launch",
                        --     name = "Launch flutter",
                        --     dartSdkPath = '/Users/sadabwasim/Documents/development/flutter/bin/cache/dart-sdk/',
                        --     flutterSdkPath='/Users/sadabwasim/Documents/development/flutter',
                        --     program = "${workspaceFolder}/lib/main.dart",
                        --     cwd = "${workspaceFolder}",
                        --   }
                        -- }

                        -- require("dap.ext.vscode").load_launchjs()
                    end
                },
                dev_log = {
                    enabled = false,
                    open_cmd = "tabedit"
                },
                lsp = {
                    on_attach = require("lvim.lsp").common_on_attach,
                    color = {
                        enabled = true,
                        background = false,
                        background_color = {r = 220, g = 223, b = 228},
                        foreground = false,
                        virtual_text = true,
                        virtual_text_str = "■"
                    },
                    settings = {
                        showTodos = true,
                        completeFunctionCalls = true,
                        renameFilesWithClasses = "prompt",
                        enableSnippets = true,
                        enableSdkFormatter = true,
                        analysisExcludedFolders = {
                            ".dart_tool"
                        }
                    },
                    capabilities = require("lvim.lsp").default_capabilities
                }
            }
        end
    },
    {
        "nvim-lua/plenary.nvim"
    },
    {
        "dart-lang/dart-vim-plugin"
    },
    {
        "folke/trouble.nvim",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        opts = {}
    },
    {
        "folke/noice.nvim",
        opts = {},
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify"
        }
    },
    {
        "rcarriga/nvim-notify",
        opts = {
            background_colour = "#00000"
        }
    },
    {
        "abecodes/tabout.nvim",
        opts = {},
        dependencies = {
            "nvim-treesitter",
            "nvim-cmp"
        }
    },
    {
        "Pocco81/auto-save.nvim",
        config = function()
            require("auto-save").setup {
                trigger_events = {
                    "InsertLeave"
                    -- "TextChanged"
                },
                execution_message = {
                    message = function()
                        return ("")
                    end
                },
                write_all_buffers = false,
                on_off_commands = true,
                clean_command_line_interval = 0,
                debounce_delay = 135
            }
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
            require "treesitter-context".setup {
                enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
                max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
                min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
                line_numbers = true,
                multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
                trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
                mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
                -- Separator between context and content. Should be a single character string, like '-'.
                -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
                separator = nil,
                zindex = 20, -- The Z-index of the context window
                on_attach = nil -- (fun(buf: integer): boolean) return false to disable attaching
            }
        end
    },
    {"sainnhe/everforest"},
    {"lunarvim/horizon.nvim"},
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 }
}

-- Flutter snippets enable
local luasnip = require("luasnip")
luasnip.filetype_extend("dart", {"flutter"})


local dap = require("dap")
dap.defaults.dart.exception_breakpoints = {"Error", "Exception"}
-- for all exceptions
-- dap.defaults.dart.exception_breakpoints = { "Notice", "Warning", "Error", "Exception" }

