return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        lazy = false, -- Needs to load early to draw the bar
        opts = {
            options = {
                icons_enabled = true,
                -- theme = "gruvbox",
                theme = "iceberg_dark",
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
            },
        },
    },
    {
        "nvim-mini/mini.icons",
        version = false,
        -- Icon style: 'glyph' or 'ascii'
        style = "ascii",
    },
    { "nvim-tree/nvim-web-devicons", opts = {} },
    -- Colorschemes
    { "ellisonleao/gruvbox.nvim", priority = 1000, config = true },
    "drewtempelmeyer/palenight.vim",
    {
        "sainnhe/sonokai",
        lazy = false, -- Must load immediately to prevent screen flash
        priority = 1000, -- Highest priority to load before everything else
    },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000, lazy = false },
    { "EdenEast/nightfox.nvim", lazy = false, priority = 1000 },
    {
        "folke/tokyonight.nvim",
        lazy = false, -- Load immediately
        priority = 1000, -- Load first to prevent screen flash
        opts = {
            style = "moon", -- Choose a style: 'night', 'day', 'moon'
            transparent = false,
            terminal_colors = true,
            styles = {
                comments = { italic = true },
                keywords = { italic = true },
            },
        },
        config = function()
            vim.cmd.colorscheme("tokyonight")
        end,
    },
    {
        -- Tabs line
        "akinsho/bufferline.nvim",
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
