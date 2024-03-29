lvim.plugins = {
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
    "dart-lang/dart-vim-plugin"
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
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
  { "lunarvim/horizon.nvim" },
  { "catppuccin/nvim",      name = "catppuccin", priority = 1000 },
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
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "o", "x" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  },
  --Rust
  {
    "simrat39/rust-tools.nvim",
    {
      "saecki/crates.nvim",
      version = "v0.3.0",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function()
        require("crates").setup {
          null_ls = {
            enabled = true,
            name = "crates.nvim",
          },
          popup = {
            border = "rounded",
          },
        }
      end,
    },
    {
      "j-hui/fidget.nvim",
      config = function()
        require("fidget").setup()
      end,
    },
  },
  -- Go
  -- {
  --   "ray-x/go.nvim",
  --   dependencies = {
  --     "ray-x/guihua.lua",
  --     "neovim/nvim-lspconfig",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --   config = function()
  --     require("go").setup()
  --   end,
  --   event = { "CmdlineEnter" },
  --   ft = { "go", 'gomod' },
  --   build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  -- },
}

-- Flutter snippets enable
local luasnip = require("luasnip")
luasnip.filetype_extend("dart", { "flutter" })


local dap = require("dap")
dap.defaults.dart.exception_breakpoints = { "Notice", "Warning", "Raised", "Uncaught", "Error", "Exception" }
-- for all exceptions
-- dap.defaults.dart.exception_breakpoints = { "Notice", "Warning", "Error", "Exception" }
