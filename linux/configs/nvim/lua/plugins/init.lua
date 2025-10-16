return {
    "tpope/vim-speeddating",
    "tpope/vim-eunuch",
    "tpope/vim-unimpaired",
    "tpope/vim-repeat",
    "kshenoy/vim-signature",
    { "nvim-mini/mini.surround", version = false },
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
            { "<leader>fh", "<cmd>Telescope help_tags<cr>" },
        },
        opts = {},
        require("telescope").setup({
            pickers = {
                find_files = {
                    -- hidden = true,
                    -- This ensures dotfiles are included in the results but not gitfiles
                    find_command = {
                        "rg",
                        "--files", -- Only list files, not content
                        "--hidden", -- Include hidden files (like .dotfiles)
                        -- Use the glob pattern to ignore .git/
                        "-g",
                        "!{.git,node_modules}/*",
                        ".", -- Start the search from the current directory (or project root)
                    },
                },
                defaults = {
                    layout_strategy = "horizontal",
                    layout_config = { width = 0.9 },
                    sorting_strategy = "ascending",
                    winblend = 5,
                },
                pickers = {
                    find_files = { theme = "dropdown" },
                    live_grep = { theme = "dropdown" },
                },
                -- live_grep = {
                --     additional_args = function(opts)
                --         return { "--hidden" }
                --     end,
                -- },
            },
        }),
    },
    {
        "ahmedkhalf/project.nvim",
        event = "VimEnter", -- Load immediately or when open a file
        opts = {
            -- Enable manual mode only if you want to skip automatic root detection
            manual_mode = false,

            -- When a file is opened, it searches upward for these.
            -- detection_methods = { "lsp", "pattern" },
            detection_methods = { "pattern" },
            patterns = {
                ".git",
                "package.json",
                "README.md",
                -- .config'
                -- "Makefile",
            },
        },
        config = function(_, opts)
            require("project_nvim").setup(opts)
        end,
    },
    {
        "folke/persistence.nvim",
        event = "BufReadPre", -- load before reading buffer
        opts = {
            dir = vim.fn.stdpath("state") .. "/sessions/", -- default
            options = { "buffers", "curdir", "tabpages", "winsize" },
        },
        config = function(_, opts)
            require("persistence").setup(opts)

            -- Auto-save when leaving Neovim
            vim.api.nvim_create_autocmd("VimLeavePre", {
                callback = function()
                    require("persistence").save()
                end,
            })
        end,
    },
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
        "williamboman/mason.nvim",
        cmd = "Mason",
        config = true,
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        -- grouping
        opts = {
            preset = "classic",
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
        config = function()
            local function on_attach(bufnr)
                local api = require("nvim-tree.api")

                local function opts(desc)
                    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                end

                api.config.mappings.default_on_attach(bufnr)

                -- set nvim-tree to open in current dir
                vim.keymap.set("n", "C", api.tree.change_root_to_node, opts("CD"))
            end

            require("nvim-tree").setup({
                on_attach = on_attach,
                sync_root_with_cwd = true, -- important to follow current dir
                update_focused_file = {
                    enable = true,
                    update_root = true,
                },
                view = {
                    width = 42,
                    side = "right",
                },
            })
        end,
    },
    {
        "wakatime/vim-wakatime",
        lazy = false, -- Must load immediately to begin tracking time upon startup
    },
    {
        "roodolv/markdown-toggle.nvim",
        config = function(_, opts)
            require("markdown-toggle").setup(opts)
        end,
    },
    {
        "bullets-vim/bullets.vim",
        ft = { "markdown", "text", "typst", "gitcommit" },

        config = function() end,
    },
}
