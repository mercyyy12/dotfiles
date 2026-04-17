return {
    "yetone/avante.nvim",
    build = vim.fn.has("win32") ~= 0
        and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
        or "make",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    opts = {
        provider = "deepseek",
        providers = {
            claude = {
                endpoint = "https://api.anthropic.com",
                model = "claude-sonnet-4-20250514",
                timeout = 30000, -- Timeout in milliseconds
                extra_request_body = {
                    temperature = 0.75,
                    max_tokens = 20480,
                },
            },
            deepseek = {
                __inherited_from = "openai",
                endpoint = "https://api.deepseek.com",
                model = "deepseek-reasoner",
                api_key_name = "DEEPSEEK_API_KEY",
            },
            moonshot = {
                endpoint = "https://api.moonshot.ai/v1",
                model = "kimi-k2-0711-preview",
                timeout = 30000, -- Timeout in milliseconds
                extra_request_body = {
                    temperature = 0.75,
                    max_tokens = 32768,
                },
            },
            openrouter = {
                __inherited_from = "openai",
                endpoint = "https://openrouter.ai/api/v1",
                model = "qwen/qwen3-coder:free",
                api_key_name = "OPEN_ROUTER_API_KEY",
                timeout = 30000, -- Timeout in milliseconds
                extra_request_body = {
                    temperature = 0.75,
                    max_tokens = 32768,
                },
            },
        },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        {
            "HakonHarnes/img-clip.nvim",
            event = "VeryLazy",
            opts = {
                default = {
                    embed_image_as_base64 = false,
                    prompt_for_file_name = false,
                    drag_and_drop = {
                        insert_mode = true,
                    },
                    use_absolute_path = true,
                },
            },
        },
        {
            'MeanderingProgrammer/render-markdown.nvim',
            opts = {
                file_types = { "markdown", "Avante" },
            },
            ft = { "markdown", "Avante" },
        },
    },
}
