-- TODO lewis6991/gitsigns.nvim : blame key
return {
    {
        "numToStr/Comment.nvim",
        lazy = false,
        opts = {},
    },
    {
        "tpope/vim-fugitive",
        cmd = "Git", -- Lazy load on command
    },
    {
        "lewis6991/gitsigns.nvim",
        lazy = false,
        event = "BufRead", -- Load when a file is opened
    },
    {
        "nvim-treesitter/nvim-treesitter", -- parser
        branch = "master",
        lazy = false,
        build = ":TSUpdate", -- Run this command on installation/update
        event = { "BufReadPre", "BufNewFile" }, -- Load early for all files
        opts = {
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = {
                "lua",
                "vimdoc",
                "vim",
                "markdown",
                "typescript",
                "javascript",
                "python",
                "fish",
                "scss",
                "css",
            }, -- Add languages you use
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    {
        -- Completion
        "hrsh7th/nvim-cmp",
        event = "InsertEnter", -- Only load when entering insert mode
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
        },
        config = function()
            local cmp = require("cmp")
            local mapping = cmp.mapping

            cmp.setup({
                -- Setup keybindings for navigation and selection
                mapping = mapping.preset.insert({
                    ["<C-b>"] = mapping.scroll_docs(-4),
                    ["<C-f>"] = mapping.scroll_docs(4),
                    ["<C-Space>"] = mapping.complete(),
                    ["<CR>"] = mapping.confirm({ select = true }),
                }),
                -- Setup completion sources
                sources = cmp.config.sources({
                    { name = "nvim_lsp" }, -- From the LSP server
                    { name = "buffer" }, -- From open buffers
                    { name = "path" }, -- From file paths
                }),
            })
        end,
    },
    {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
            -- {
            --     "<leader>xx",
            --     "<cmd>Trouble diagnostics toggle<cr>",
            --     desc = "Diagnostics (Trouble)",
            -- },
            -- {
            --     "<leader>xX",
            --     "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
            --     desc = "Buffer Diagnostics (Trouble)",
            -- },
            -- {
            --     "<leader>S",
            --     "<cmd>Trouble symbols toggle focus=false<cr>",
            --     desc = "Symbols (Trouble)",
            -- },
            -- {
            --     "<leader>cl",
            --     "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
            --     desc = "LSP Definitions / references / ... (Trouble)",
            -- },
            -- {
            --     "<leader>xL",
            --     "<cmd>Trouble loclist toggle<cr>",
            --     desc = "Location List (Trouble)",
            -- },
            -- {
            --     "<leader>xQ",
            --     "<cmd>Trouble qflist toggle<cr>",
            --     desc = "Quickfix List (Trouble)",
            -- },
            -- {
            --     "<leader>Q",
            --     "<cmd>Trouble qflist toggle<cr>",
            --     desc = "Quickfix List (Trouble)",
            -- },
        },
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason-lspconfig.nvim", -- Bridges Mason and LSPConfig
            "hrsh7th/cmp-nvim-lsp", -- Completion source for LSP
        },
        config = function()
            require("mason-lspconfig").setup()
            vim.lsp.config.tsserver = {}
            vim.lsp.enable({ "tsserver" })
            -- Example: Setup default keymaps for LSP functions
            local lsp_keys = vim.keymap.set
            lsp_keys("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
            lsp_keys("n", "K", vim.lsp.buf.hover, { desc = "Hover information" })
            vim.lsp.enable({ "lua_ls" })
        end,
    },
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    {
        -- A  annotation generator
        "danymat/neogen",
        -- Lazy load on command
        cmd = "Neogen",
        opts = {
            -- Optional: Configure default template styles for various filetypes
            snippet_engine = "luasnip", -- Recommended if you use LuaSnip
            -- Configuration examples:
            -- python = {
            --     enabled = true,
            --     keymap = {
            --         override_default_keymap = true,
            --         callback = 'gs' -- You can define a custom keymap here
            --     }
            -- }
        },
        -- Set a keymap to trigger documentation generation
        keys = {
            -- Map <leader>ng (Neogen Generate) to run the command
            {
                "<leader>ng",
                function()
                    require("neogen").generate()
                end,
                desc = "Generate Docstring (Neogen)",
            },
        },
    },
    {
        "hedyhli/outline.nvim",
        config = function()
            -- Example mapping to toggle outline
            vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

            require("outline").setup({
                -- Your setup opts here (leave empty to use defaults)
            })
        end,
    },
    {
        --  Indentation guides
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
        scope = {
            enabled = false, -- Treesitter handles scope better
        },
    },
    {
        "stevearc/conform.nvim", -- Formatter
        event = { "BufWritePre" }, -- Load just before writing a buffer
        cmd = { "ConformInfo" },
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "black" },
                markdown = { "prettier" },
            },
            format_on_save = { timeout_ms = 500, lsp_fallback = false },
        },
    },
}
