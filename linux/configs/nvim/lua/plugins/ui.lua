return {
    {
        "akinsho/bufferline.nvim",
        -- Load bufferline when Neovim starts
        lazy = false,
        -- Requires nvim-web-devicons for icons
        dependencies = { "nvim-tree/nvim-web-devicons" },
        version = "*", -- Use the latest version
        opts = {
            options = {
                mode = "tabs",
                tab_size = 13,
                -- CRITICAL: Use the same font/theme settings as your main colorscheme
                diagnostics = "nvim_lsp", -- Show LSP diagnostics (errors/warnings)
                -- indicator = { style = 'icon' }, -- Use an icon for the active buffer
                separator_style = "slant", -- Use a slant separator style

                -- General Behavior
                offsets = {
                    {
                        filetype = "NvimTree", -- Ensure file tree window doesn't affect the bufferline
                        text = "File Explorer",
                        separator = true,
                        padding = 1,
                    },
                },

                -- Appearance
                always_show_bufferline = false,
                show_buffer_close_icons = false,
                show_close_icon = false,
                color_icons = true, -- Requires nvim-web-devicons

                -- Keymap suggestions (using Control-movement is common)
                -- We'll handle keymaps separately
            },
        },
        config = function(_, opts)
            require("bufferline").setup(opts)
        end,
    },
}
