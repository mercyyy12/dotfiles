return { -- Autocompletion
    'saghen/blink.cmp',
    event = 'InsertEnter',
    version = '1.*',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        version = '2.*',
        build = (function()
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
        },
        opts = {},
      },
      'folke/lazydev.nvim',
      'Exafunction/codeium.nvim',
    },
    opts = {
      keymap = {
        preset = 'default',
        ["<Enter>"] = { "accept", "fallback" },
      },
      appearance = {
        nerd_font_variant = 'mono',
      },
      completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 500 },
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'lazydev' },
        providers = {
          lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
        },
      },
      snippets = { preset = 'luasnip' },
      fuzzy = { implementation = 'prefer_rust_with_warning' },
      signature = { enabled = true },
    },
  }
