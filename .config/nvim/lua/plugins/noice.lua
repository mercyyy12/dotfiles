return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    lsp = {
      signature = { enabled = false }
    }
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
  }
}
