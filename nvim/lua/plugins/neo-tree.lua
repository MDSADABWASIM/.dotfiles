return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = { position = "float", width = 30 },
    filesystem = {
      bind_to_cwd = false,
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
    },
  },
}

