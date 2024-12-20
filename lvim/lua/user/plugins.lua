lvim.plugins = {
  {
    "supermaven-inc/supermaven-nvim",
    branch = "rust-binary",
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<C-y>",
          clear_suggestion = "<C-]>",
          accept_word = "<C-j>",
        },
        log_level = "info",                -- set to "off" to disable logging completely
        disable_inline_completion = false, -- disables inline completion for use with cmp
        disable_keymaps = false            -- disables built in keymaps for more manual control
      })
    end,
  },
  { "ThePrimeagen/harpoon" },
  { "mfussenegger/nvim-dap" },
  {
    "akinsho/flutter-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "stevearc/dressing.nvim" },
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
              args = { "flutter" }
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
            background_color = { r = 220, g = 223, b = 228 },
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
    "nvim-lua/popup.nvim"
  },
  {
    "dart-lang/dart-vim-plugin"
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
  {
    "folke/noice.nvim",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify"
    },
    config = function()
      require("noice").setup({
        lsp = {
          hover = {
            silent = true, -- set to true to not show a message if hover is not available
          },
        },
        presets = {
          bottom_search = false,        -- use a classic bottom cmdline for search
          command_palette = true,       -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          lsp_doc_border = true,        -- add a border to hover docs and signature help
        },
      })
    end
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
        enable = true,
        max_lines = 0,
        line_numbers = true,
        multiline_threshold = 20,
        trim_scope = "outer",
        mode = "cursor",
        separator = nil,
        zindex = 20,
        on_attach = nil
      }
    end
  },
  { "sainnhe/everforest" },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,

    config = function(_, _)
      require("catppuccin").setup {
        flavour = "frappe", -- latte, frappe, macchiato, mocha
      }
    end,
  },
  {
    "AlexvZyl/nordic.nvim",
    name = "nordic",
    config = function()
      require 'nordic'.setup {
        transparent_bg = true,
        override = {
          -- CursorLine = {
          --   bg = '#cad2c5',
          --   bold = false
          -- },
          Visual = {
            bg = '#a68a64',
            bold = false
          }
        }
      }
    end,
  },
  {
    "tiagovla/tokyodark.nvim",
    opts = {
    },
    config = function(_, opts)
      require("tokyodark").setup(opts)
      vim.cmd [[colorscheme tokyodark]]
    end,
  },
  {
    'windwp/nvim-ts-autotag'
  },
  {
    "vhyrro/luarocks.nvim",
    priority = 1001, -- this plugin needs to run before anything else
    opts = {
      rocks = { "magick" },
    },
  },
  {
    "3rd/image.nvim",
    dependencies = { "luarocks.nvim" },
    config = function()
      require("image").setup({
        backend = "kitty",
        max_height_window_percentage = 50,
        hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.svg" },
      })
    end
  },
  {
    "sotte/presenting.nvim",
    opts = {},
    cmd = { "Presenting" },
  },
}

-- Flutter snippets enable
local luasnip = require("luasnip")
luasnip.filetype_extend("dart", { "flutter" })
luasnip.filetype_extend("javascript", { "javascriptreact" })
luasnip.filetype_extend("javascript", { "html" })


local dap = require("dap")
dap.defaults.dart.exception_breakpoints = { "Notice", "Warning", "Raised", "Uncaught", "Error", "Exception" }
-- for all exceptions
-- dap.defaults.dart.exception_breakpoints = { "Notice", "Warning", "Error", "Exception" }
