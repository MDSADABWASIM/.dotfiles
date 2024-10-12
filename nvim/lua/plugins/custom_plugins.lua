return {
  { "ThePrimeagen/harpoon" },
  {
    "akinsho/flutter-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "stevearc/dressing.nvim" },
    config = function()
      require("flutter-tools").setup({
        --for windowns only
        -- flutter_path = "/Users/sadabwasim/Documents/development/flutter/bin/flutter.bat",
        ui = {
          border = "rounded",
          notification_style = "plugin",
        },
        outline = {
          open_cmd = "30vnew",
          auto_open = false,
        },
        closing_tags = {
          highlight = "Comment",
          prefix = "// ",
          enabled = true,
        },
        debugger = {
          enabled = true,
          run_via_dap = true,
          register_configurations = function(_)
            require("dap").adapters.dart = {
              type = "executable",
              command = vim.fn.stdpath("data") .. "/mason/bin/dart-debug-adapter",
              args = { "flutter" },
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
                cwd = "${workspaceFolder}",
              },
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
          end,
        },
        dev_log = {
          enabled = false,
          open_cmd = "tabedit",
        },
        lsp = {
          on_attach = require("lazyvim.util").lsp.on_attach,
          color = {
            enabled = true,
            background = false,
            background_color = { r = 220, g = 223, b = 228 },
            foreground = false,
            virtual_text = true,
            virtual_text_str = "■",
          },
          settings = {
            showTodos = true,
            completeFunctionCalls = true,
            renameFilesWithClasses = "prompt",
            enableSnippets = true,
            enableSdkFormatter = true,
            analysisExcludedFolders = {
              ".dart_tool",
            },
          },
          capabilities = require("cmp_nvim_lsp").default_capabilities(),
        },
      })
    end,
  },
  { "dart-lang/dart-vim-plugin" },
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup({
        enable = true,
        max_lines = 0,
        multiline_threshold = 20,
        mode = "cursor",
        zindex = 20,
      })
    end,
  },
  { "sainnhe/everforest" },
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
  -- LuaSnip filetype extensions
  {
    "L3MON4D3/LuaSnip",
    config = function()
      local luasnip = require("luasnip")
      luasnip.filetype_extend("dart", { "flutter" })
      luasnip.filetype_extend("javascript", { "javascriptreact" })
      luasnip.filetype_extend("javascript", { "html" })
    end,
  },

  -- DAP exception breakpoints
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      dap.defaults.dart.exception_breakpoints = { "Notice", "Warning", "Raised", "Uncaught", "Error", "Exception" }
    end,
  },
}
