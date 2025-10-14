-- TODO lewis6991/gitsigns.nvim : blame key
return {
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
}
