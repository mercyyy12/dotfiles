return {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    build = ":TSUpdate",
    main = "nvim-treesitter.config", -- Sets main module to use for opts
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    opts = {
        ensure_installed = {
            "bash", "c", "diff", "html", "lua", "luadoc", "markdown", "markdown_inline", "query", "vim", "vimdoc", "rust", 'regex', "php", "blade"
        },
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = { "ruby" },
        },
        indent = { enable = true, disable = { "ruby" } },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<M-space>", -- set to `false` to disable one of the mappings
                node_incremental = "<M-space>",
                scope_incremental = false,
                node_decremental = "<Backspace>",
            },
        },
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ["af"] = { query = "@function.outer", desc = "Select outer part of a function region" },
                    ["if"] = { query = "@function.inner", desc = "Select inner part of a function region" },
                    ["ac"] = { query = "@class.outer", desc = "Select outer part of a class region" },
                    ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                    ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
                },
            },
            swap = {
              enable = true,
              swap_next = {
                ["<leader>xs"] = { query = "@parameter.inner", desc = "Swap the node under the cursor with the next" },
              },
              swap_previous = {
                ["<leader>xS"] = { query = "@parameter.inner", desc = "swap the node under the cursor with the previous" },
              },
            },
        },
    },
}
