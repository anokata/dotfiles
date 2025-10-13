return {
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
