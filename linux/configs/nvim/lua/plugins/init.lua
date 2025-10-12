return {
    -- { 'tpope/vim-surround', lazy = false }
    { 'nvim-mini/mini.surround', version = false },
    {
        'numToStr/Comment.nvim',
        lazy = false,
        opts = {},
    },
    'tpope/vim-repeat',
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = 'Telescope', -- Lazy load on command
    keys = {
      { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find Files' },
      { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Live Grep' },
      { '<c-p>', '<cmd>Telescope find_files<cr>', desc = 'Find Files' },
      { '<leader>fb', '<cmd>Telescope buffers<cr>'},
-- <leader>fh <cmd>Telescope help_tags<cr>
    },
    opts = {},
  },
    {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false, -- Needs to load early to draw the bar
    opts = {
      options = {
        icons_enabled = true,
        theme = 'gruvbox',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
      },
    },
  },

    {
        'rmagatti/auto-session',
        lazy = false, -- Needs to be active on startup
        opts = {
          log_level = 'error',
          auto_restore_enabled = true,
        },
    },
    {
        'tpope/vim-fugitive',
        cmd = 'Git', -- Lazy load on command
    },

  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' }, -- Load when a file is opened
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
      {'akinsho/toggleterm.nvim', version = "*", config = true},

  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'master',
    lazy = false,
    build = ':TSUpdate', -- Run this command on installation/update
    event = { 'BufReadPre', 'BufNewFile' }, -- Load early for all files
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = { 'lua', 'vimdoc', 'vim', 'markdown', 'typescript', 'javascript', 'python', 'fish' }, -- Add languages you use
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
  {
    'williamboman/mason.nvim',
    cmd = 'Mason',
    config = true,
  },
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'williamboman/mason-lspconfig.nvim', -- Bridges Mason and LSPConfig
      'hrsh7th/cmp-nvim-lsp', -- Completion source for LSP
    },
    config = function()
        require('mason-lspconfig').setup()
      -- Example: Setup default keymaps for LSP functions
      local lsp_keys = vim.keymap.set
      lsp_keys('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
      lsp_keys('n', 'K', vim.lsp.buf.hover, { desc = 'Hover information' })
      vim.lsp.enable({ 'lua_ls' })
    end,
  },
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter', -- Only load when entering insert mode
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
    },
    config = function()
      local cmp = require('cmp')
      local mapping = cmp.mapping

      cmp.setup({
        -- Setup keybindings for navigation and selection
        mapping = mapping.preset.insert({
          ['<C-b>'] = mapping.scroll_docs(-4),
          ['<C-f>'] = mapping.scroll_docs(4),
          ['<C-Space>'] = mapping.complete(),
          ['<CR>'] = mapping.confirm({ select = true }),
        }),
        -- Setup completion sources
        sources = cmp.config.sources({
          { name = 'nvim_lsp' }, -- From the LSP server
          { name = 'buffer' },  -- From open buffers
          { name = 'path' },    -- From file paths
        })
      })
    end
  },
}
