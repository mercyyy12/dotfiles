return {
  "nvim-mini/mini.statusline",
  event = "VeryLazy",
  version = false,
  init = function()
    local statusline = require 'mini.statusline'
    statusline.setup { use_icons = vim.g.have_nerd_font }
    statusline.section_location = function()
      return '%2l:%-2v'
    end
  end
}
