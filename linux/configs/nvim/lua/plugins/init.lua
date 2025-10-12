return {
    -- { 'tpope/vim-surround', lazy = false }
    "tpope/vim-speeddating",
    "tpope/vim-eunuch",
    "tpope/vim-unimpaired",
    "tpope/vim-repeat",
    "kshenoy/vim-signature",
    -- Colorschemes
    { "ellisonleao/gruvbox.nvim", priority = 1000, config = true },
    "drewtempelmeyer/palenight.vim",
    {
        "sainnhe/sonokai",
        lazy = false, -- Must load immediately to prevent screen flash
        priority = 1000, -- Highest priority to load before everything else
    },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { "EdenEast/nightfox.nvim" },
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
            -- Set the colorscheme right after it loads
            vim.cmd.colorscheme("tokyonight")
        end,
    },

    { "nvim-mini/mini.surround", version = false },
    {
        "nvim-mini/mini.icons",
        version = false,
        -- Icon style: 'glyph' or 'ascii'
        style = "ascii",
    },
    { "nvim-tree/nvim-web-devicons", opts = {} },
    {
        "numToStr/Comment.nvim",
        lazy = false,
        opts = {},
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
        cmd = "Telescope", -- Lazy load on command
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
            { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
            { "<c-p>", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
            { "<leader>fb", "<cmd>Telescope buffers<cr>" },
            -- <leader>fh <cmd>Telescope help_tags<cr>
        },
        opts = {},
        require("telescope").setup({
            pickers = {
                find_files = {
                    -- This ensures dotfiles are included in the results
                    hidden = true,
                },
                live_grep = {
                    additional_args = function(opts)
                        return { "--hidden" }
                    end,
                },
            },
        }),
    },
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
        "rmagatti/auto-session",
        lazy = false, -- Needs to be active on startup
        opts = {
            log_level = "error",
            auto_restore_enabled = true,
        },
    },
    {
        "tpope/vim-fugitive",
        cmd = "Git", -- Lazy load on command
    },

    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" }, -- Load when a file is opened
    },

    -- {
    --   'ahmedkhalf/project.nvim',
    --   event = 'VimEnter',
    --   opts = {
    --     manual_mode = false,
    --     detection_methods = { 'lsp', 'pattern' }, -- Auto-detect by LSP root or git/svn/etc.
    --     patterns = { '.git', 'lua', 'src', '.hg', '.svn', '.project', 'Makefile', 'package.json' },
    --   },
    -- },

    -- {
    --   'iamcco/markdown-preview.nvim',
    --   ft = 'markdown', -- Only load when editing markdown files
    --   build = 'cd app && npm install',
    -- },
    {
        "akinsho/toggleterm.nvim",
        lazy = true, -- Only load when opening a terminal
        cmd = "ToggleTerm",
        opts = {
            size = 20,
            -- open_mapping = '<leader>tt',
            direction = "tab", -- Can be 'float', 'horizontal', 'vertical' tab
            float_opts = {
                border = "curved",
            },
        },
        config = function(_, opts)
            require("toggleterm").setup(opts)
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        lazy = false,
        build = ":TSUpdate", -- Run this command on installation/update
        event = { "BufReadPre", "BufNewFile" }, -- Load early for all files
        opts = {
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = { "lua", "vimdoc", "vim", "markdown", "typescript", "javascript", "python", "fish" }, -- Add languages you use
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        config = true,
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

    -- { TODO find alternative wihotu set termguicolors in lua
    --   'norcalli/nvim-colorizer.lua',
    --   -- event = 'BufReadPost',
    --   config = function()
    --     require('colorizer').setup()
    --   end,
    -- },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },

    {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {},
        scope = {
            enabled = false, -- Treesitter handles scope better
        },
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter", -- Only load when entering insert mode
        opts = {
            fast_wrap = {},
            disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function()
            require("nvim-autopairs").setup()
        end,
    },
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" }, -- Load just before writing a buffer
        cmd = { "ConformInfo" },
        opts = {
            -- Example formatter setup (install formatters like 'black', 'prettier' via :Mason)
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "black" },
                markdown = { "prettier" },
            },
            format_on_save = { timeout_ms = 500, lsp_fallback = false },
        },
    },

    {
        "nvim-tree/nvim-tree.lua",
        cmd = "NvimTreeToggle", -- Lazy load on command
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" },
            { "<f1>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" },
        },
        opts = {
            git = {
                enable = true, -- Automatically replaces nerdtree-git-plugin
                ignore = false,
            },
            view = {
                side = "right",
                width = 50,
            },
            actions = {
                open_file = {
                    quit_on_open = true, -- Close tree when opening a file
                },
            },
            renderer = {
                -- Set up icons if using a Nerd Font
                icons = {
                    show = {
                        git = true,
                        folder = true,
                        file = true,
                    },
                },
            },
        },
    },
    {
        "wakatime/vim-wakatime",
        lazy = false, -- Must load immediately to begin tracking time upon startup
        -- vim.g.wakatime_cli_path = '/usr/local/bin/wakatime-cli'
    },
}
