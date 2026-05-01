return {
  "folke/snacks.nvim",
  event = "VimEnter",
  opts = {
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      preset = { header = [[  Elite Neovim  ]] },
      sections = {
        { section = "header" },
        { section = "keys", indent = 1, gap = 1, padding = 1 },
        { section = "recent_files", icon = " ", title = "Recent Files", cwd = true, indent = 3, padding = 2 },
        { section = "startup" },
      },
    },
    image = { enabled = true },
    indent = { enabled = true },
    lazygit = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scratch = { enabled = true },
    terminal = { enabled = true },
  },
  keys = {
    { "<leader>lg", function() Snacks.lazygit() end, desc = "LazyGit" },
    { "<leader>r", function() vim.cmd("write"); Snacks.terminal("go run " .. vim.fn.expand("%")) end, desc = "Run Go" },
    { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss Notifications" },
    { "<c-/>",      function() Snacks.terminal() end, desc = "Terminal", mode = {"n", "t"} },
    { "\\", function() Snacks.explorer() end, desc = "Explorer" },
    { "<leader>ss", function() Snacks.picker.smart() end, desc = "Smart Pick" },
    { "<leader><space>", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>sf", function() Snacks.picker.files() end, desc = "Files" },
    { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
    { "<leader>sh", function() Snacks.picker.help() end, desc = "Help" },
    { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
  }
}
