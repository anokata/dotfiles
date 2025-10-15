--
local term_toggle = require("toggleterm").toggle
vim.keymap.set("n", "<leader>tt", term_toggle, { desc = "Toggle Terminal", noremap = true, silent = true })

local i_map = function(lhs, rhs, desc)
    vim.keymap.set("i", lhs, rhs, { desc = desc, silent = true, noremap = true })
end

vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "Ctrl-S Save", noremap = true })

vim.keymap.set("n", "<C-a>r", ":%s/", { desc = "Global Substitute Start" })
-- TODO: better bind
vim.keymap.set("n", "<C-a>f", "<cmd>Telescope grep_string<CR>", { desc = "Search Word (Telescope)" })
vim.keymap.set("v", "<C-a>f", "y<cmd>Telescope grep_string<CR>", { desc = "Search Selection (Telescope)" })
vim.keymap.set("n", "<Tab><Esc>", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Buffer Symbols/Lines" })
vim.keymap.set("n", "<Tab><Tab>", "<cmd>Telescope buffers<CR>", { desc = "List Buffers" })
vim.keymap.set("n", "<leader>nb", "/{[^}]*$<CR>", { desc = "Next Inner Block", noremap = true })
vim.keymap.set("n", "gF", ":tabnew <C-r><C-f><CR>", { desc = "Open File in New Tab" })
vim.keymap.set("n", "<localleader>hh", ":noh<CR>", { desc = "Clear Search Highlight" })
vim.keymap.set("n", "<localleader>n", "<cmd>cnext<CR>", { desc = "Next Quickfix Item" })
vim.keymap.set("n", "<localleader>l", "<cmd>cclose<CR>", { desc = "Close Quickfix List" })
vim.keymap.set("n", "<leader>q", "<cmd>w<CR>", { desc = "Quick Save" })
vim.keymap.set("n", "<leader>e", "<cmd>q<CR>", { desc = "Quick Quit" })
vim.keymap.set("n", "<leader>X", "<cmd>!chmod +x %<CR>", { desc = "Make Executable" })

vim.keymap.set("n", "<C-a>k", "yykp", { desc = "Duplicate Line Up" })
vim.keymap.set("n", "<C-a>j", "yyp", { desc = "Duplicate Line Down" })
vim.keymap.set("n", "<C-a><Up>", "yykp", { desc = "Duplicate Line Up (Arrow)" })
vim.keymap.set("n", "<C-a><Down>", "yyp", { desc = "Duplicate Line Down (Arrow)" })
vim.keymap.set("n", "<A-S-Up>", "yykp", { desc = "Duplicate Line Up (Alt/Shift)" })
vim.keymap.set("n", "<A-S-Down>", "yyp", { desc = "Duplicate Line Down (Alt/Shift)" })
vim.keymap.set("n", "<A-Down>", "ddp", { desc = "Move Line Down" })
vim.keymap.set("n", "<A-k>", "ddkP", { desc = "Move Line Up (Alt-k)" })
vim.keymap.set("n", "<A-j>", "ddp", { desc = "Move Line Down (Alt-j)" })

vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank to System Clipboard", noremap = true })
vim.keymap.set("n", "<leader>Y", '"+y', { desc = "Yank to System Clipboard (+)" })
vim.keymap.set("n", "<leader>p", '"+p', { desc = "Paste from System Clipboard" })
vim.keymap.set("n", "<leader>P", 'o<ESC>"+P', { desc = "Paste Above from System" })
vim.keymap.set("n", "<leader>s", ':let @*=@"<CR>', { desc = "Copy Last Yank to Selection" })

vim.keymap.set(
    "n",
    "<leader>d",
    '<cmd>execute "normal! a" . expand("%:p:h")<cr>',
    { desc = "Insert Current Directory" }
)

-- 1. Simple Typo Corrections
i_map("adn", "and", "Typo: and")
i_map("waht", "what", "Typo: what")
i_map("tehn", "then", "Typo: then")
i_map("funciotn", "function", "Typo: function")
i_map("funciton", "function", "Typo: function")

-- 2. Email Shortcut
i_map("@@@", "quartenium@gmail.com", "Email Shortcut")

-- 3. Code Boilerplate/Snippets
i_map("ifmain", "if __name__=='__main__':\n", "Snippet: Python main block")
i_map("#i", "#include", "Snippet: C/C++ include")
i_map("#d", "#define", "Snippet: C/C++ define")

local n_map = function(lhs, rhs, desc)
    vim.keymap.set("n", lhs, rhs, { desc = desc, silent = true, noremap = true })
end
local c_map = function(lhs, rhs, desc)
    vim.keymap.set("c", lhs, rhs, { desc = desc, silent = true, noremap = true })
end

-- Normal Mode (nmap) Overrides
n_map("ё", "`", "Cyrillic ё -> Tick/Mark")
n_map("Ж", ":", "Cyrillic Ж -> Command Mode")
n_map("ш", "i", "Cyrillic ш -> Insert Mode")
n_map("о", "j", "Cyrillic о -> Down (j)")
n_map("л", "k", "Cyrillic л -> Up (k)")
n_map("ф", "a", "Cyrillic ф -> Append (a)")
n_map("Ф", "A", "Cyrillic Ф -> Append EOL (A)")
n_map("б", ",", "Cyrillic б -> Leader/Comma")
n_map("ю", ".", "Cyrillic ю -> Repeat (.)")

-- Command Mode (cmap) Overrides
c_map("ц", "w", "Cyrillic ц -> Word (w)")
c_map("й", "q", "Cyrillic й -> Quit (q)")
c_map("ч", "x", "Cyrillic ч -> Delete Char (x)")
c_map("у", "e", "Cyrillic у -> End Word (e)")
c_map("ф", "a", "Cyrillic ф -> Append (a)")

-- Normal Mode (nmap) Overrides for Motion/Commands
n_map("ㄤ", ":", "Bopomofo ㄤ -> Command Mode")
n_map("ㄛ", "i", "Bopomofo ㄛ -> Insert Mode")
n_map("ㄨ", "j", "Bopomofo ㄨ -> Down (j)")
n_map("ㄜ", "k", "Bopomofo ㄜ -> Up (k)")
n_map("ㄇ", "a", "Bopomofo ㄇ -> Append (a)")
n_map("【", "A", "Bopomofo 【 -> Append EOL (A)")
n_map("ㄝ", ",", "Bopomofo ㄝ -> Leader/Comma")
n_map("ㄡ", ".", "Bopomofo ㄡ -> Repeat (.)")

-- Command Mode (cmap) Overrides
c_map("ㄊ", "w", "Bopomofo ㄊ -> Word (w)")
c_map("ㄆ", "q", "Bopomofo ㄆ -> Quit (q)")
c_map("ㄌ", "x", "Bopomofo ㄌ -> Delete Char (x)")
c_map("ㄍ", "e", "Bopomofo ㄍ -> End Word (e)")

-- DEV
--vim.keymap.set('n', '<F5>', ':w<CR>:!make "%:t:r"<CR>', { desc = 'Run Make on File Name', noremap = true })
vim.keymap.set("n", "<F5>", ":w<CR>:!./%<CR>", { desc = "Execute Current Binary", noremap = true })
vim.keymap.set("n", "<F10>", ':w<CR>:!python "%:t"<CR>', { desc = "Execute Python File", noremap = true })
vim.keymap.set("n", "<F12>", ":w<CR>:source %<CR>", { desc = "Save and Source File", noremap = true })

-- =================================================================
-- FM: File & Project Management (Telescope/Nvim-Tree Replacements)

vim.keymap.set("n", "<leader>gs", function()
    require("telescope.builtin").live_grep()
end, { desc = "Telescope: Live Grep (Project Search)", silent = true, noremap = true })

vim.keymap.set(
    "n",
    "<BS>",
    "<cmd>Telescope find_files<CR>",
    { desc = "Fuzzy Find Files (Telescope)", silent = true, noremap = true }
)
vim.keymap.set(
    "n",
    "<leader>f",
    "<cmd>Telescope find_files<CR>",
    { desc = "Fuzzy Find Files (Telescope)", silent = true, noremap = true }
)

-- Nvim-Tree (NERDTree Replacement)
vim.keymap.set(
    "n",
    "<C-b>",
    "<cmd>NvimTreeToggle<CR>",
    { desc = "Toggle File Tree (NvimTree)", silent = true, noremap = true }
)
vim.keymap.set(
    "n",
    "<F1>",
    "<cmd>NvimTreeToggle<CR>",
    { desc = "Find Current File in Tree", silent = true, noremap = true }
)

-- Outline / Symbols (Tlist/Tagbar Replacements)
vim.keymap.set(
    "n",
    "<leader>c",
    "<cmd>Telescope lsp_document_symbols<CR>",
    { desc = "LSP Document Symbols (Outline)", silent = true, noremap = true }
)
vim.keymap.set(
    "n",
    "<leader>x",
    "<cmd>Telescope lsp_document_symbols<CR>",
    { desc = "LSP Document Symbols (Outline)", silent = true, noremap = true }
)
vim.keymap.set(
    "n",
    "<leader>l",
    "<cmd>Telescope lsp_document_symbols<CR>",
    { desc = "LSP Document Symbols (Outline)", silent = true, noremap = true }
)

-- Project/Search (FZF/Rg Replacements)
vim.keymap.set(
    "n",
    "<S-F1>",
    "<cmd>Telescope live_grep<CR>",
    { desc = "Project Search (live_grep)", silent = true, noremap = true }
)
vim.keymap.set(
    "n",
    "tf",
    "<cmd>Telescope live_grep<CR>",
    { desc = "Telescope Live Grep", silent = true, noremap = true }
)
vim.keymap.set(
    "n",
    "<C-f>",
    "<cmd>Telescope find_files<CR>",
    { desc = "Fuzzy Find Files", silent = true, noremap = true }
)
vim.keymap.set(
    "n",
    "<C-p>",
    "<cmd>Telescope find_files<CR>",
    { desc = "Fuzzy Find Files", silent = true, noremap = true }
)
vim.keymap.set(
    "n",
    "<C-a>o",
    "<cmd>Telescope git_files<CR>",
    { desc = "Fuzzy Find Git Files", silent = true, noremap = true }
)
vim.keymap.set(
    "n",
    "<leader>r",
    "<cmd>Telescope find_files<CR>",
    { desc = "Fuzzy Find Files", silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>gB", function()
    require("gitsigns").toggle_current_line_blame()
end, { desc = "Git: Toggle Line Blame", silent = true, noremap = true })
vim.keymap.set(
    "n",
    "<leader>gb",
    "<cmd>Gitsigns blame<CR>",
    { desc = "Git: Toggle Blame", silent = true, noremap = true }
)
-- vim.keymap.set("n", "<leader>gb", function()
--     require("gitsigns").blame_line({ full = true })
-- end, { desc = "Git: Show Full Buffer Blame", silent = true, noremap = true })

-- =================================================================
-- Plug Package Mappings
vim.keymap.set("n", "<localleader>pi", "<cmd>Lazy install<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<localleader>pc", "<cmd>Lazy clean<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>L", "<cmd>Lazy<CR>", { desc = "Lazy", noremap = true })

local config_file = vim.fn.stdpath("config") .. "/init.lua"

-- Open main configuration file (init.lua)
vim.keymap.set(
    "n",
    "<leader>v",
    ":vsp " .. config_file .. "<CR><cmd>setl foldmethod=marker<CR>",
    { desc = "Open Main Config", silent = true, noremap = true }
)
vim.keymap.set(
    "n",
    "<leader>V",
    "<cmd>source " .. config_file .. "<CR>",
    { desc = "Source Main Config", silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>S", "<cmd>source %<CR>", { desc = "Source Current File", silent = true, noremap = true })

-- =================================================================
-- Tabs
vim.keymap.set("n", "<leader>t", "<cmd>tabnew<CR>", { desc = "New Tab", silent = true, noremap = true })
vim.keymap.set("n", "<C-n>", "<cmd>tabnew<CR>", { desc = "New Tab", silent = true, noremap = true })
vim.keymap.set("n", "<leader>w", "<cmd>tabclose<CR>", { desc = "Close Tab", silent = true, noremap = true })
vim.keymap.set("n", "<leader>,", "gt", { desc = "Next Tab", silent = true, noremap = true })
vim.keymap.set("n", "<leader>.", "gT", { desc = "Previous Tab", silent = true, noremap = true })
vim.keymap.set("n", "tn", "<cmd>tabnew<CR>", { desc = "New Tab", silent = true, noremap = true })
vim.keymap.set("n", "tw", "<cmd>tabclose<CR>", { desc = "Close Tab", silent = true, noremap = true })
vim.keymap.set("n", "th", "gt", { desc = "Next Tab", silent = true, noremap = true })
vim.keymap.set("n", "tl", "gT", { desc = "Previous Tab", silent = true, noremap = true })
vim.keymap.set("n", "<C-l>", "gt", { desc = "Next Tab (gt)", silent = true, noremap = true })
vim.keymap.set("n", "<C-h>", "gT", { desc = "Previous Tab (gT)", silent = true, noremap = true })

-- Window Commands
vim.keymap.set("n", "<C-a>w", "ZZ", { desc = "Save and Close", silent = true, noremap = true })
vim.keymap.set("n", "<C-q>", "<cmd>qa<CR>", { desc = "Quit All", silent = true, noremap = true })
vim.keymap.set("n", "<C-a>q", "<cmd>qa!<CR>", { desc = "Quit All (Force)", silent = true, noremap = true })
vim.keymap.set("n", "<leader>bd", ":%bd|e#|bd#<CR>", { desc = "Close All But Current", silent = true, noremap = true })

-- Window Switching (Movement)
vim.keymap.set("n", "<Up>", "<C-w><Up>", { desc = "Window Up", silent = true, noremap = true })
vim.keymap.set("n", "<Down>", "<C-w><Down>", { desc = "Window Down", silent = true, noremap = true })
vim.keymap.set("n", "<Right>", "<C-w><Right>", { desc = "Window Right", silent = true, noremap = true })
vim.keymap.set("n", "<Left>", "<C-w><Left>", { desc = "Window Left", silent = true, noremap = true })

-- Session Management (AutoSession/Telescope)
vim.keymap.set(
    "n",
    "<localleader>pp",
    "<cmd>AutoSession<CR>",
    { desc = "Save/Restore Session (AutoSession)", silent = true, noremap = true }
)
vim.keymap.set(
    "n",
    "-",
    "<cmd>Telescope projects<CR>",
    { desc = "List/Open Sessions (Telescope)", silent = true, noremap = true }
)

-- LSP
vim.keymap.set("n", "<leader>ac", vim.lsp.buf.code_action, { desc = "Code Action", silent = true })
vim.keymap.set("n", "<localleader>qf", vim.lsp.buf.code_action, { desc = "LSP Quick Fix", silent = true })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition", silent = true })
vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, { desc = "Go to Type Definition", silent = true })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implementation", silent = true })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Find References", silent = true })

-- Insert Mode Mappings
-- =================================================================

-- Moving in Insert Mode
vim.keymap.set("i", "<C-e>", "<C-o>$", { desc = "End of Line", silent = true, noremap = true })
vim.keymap.set("i", "<C-a>", "<C-o>0", { desc = "Start of Line", silent = true, noremap = true })
vim.keymap.set("i", "kj", "<Esc>", { desc = "Exit Insert Mode", silent = true, noremap = true })
vim.keymap.set("i", "<C-d>", "<Esc>ddi", { desc = "Delete Line", silent = true, noremap = true })
vim.keymap.set("i", "<C-u>", "<Esc>viwUi", { desc = "Uppercase Word", silent = true, noremap = true })

-- Complete Path with Telescope (FZF Replacement)
local telescope_path_complete = function()
    return vim.fn["fzf#vim#complete#path"]("rg --files") -- Keeping the logic for direct translation
end
vim.keymap.set("i", "<C-x><C-f>", telescope_path_complete, { expr = true, silent = true, noremap = true })

-- =================================================================
-- Operators (Motion and Selection)
-- =================================================================

-- Select function name
vim.keymap.set("o", "F", "0f(hviw", { desc = "Select Function Name", silent = true, noremap = true })

-- Operate on text inside parentheses
vim.keymap.set("o", "p", "i(", { desc = "Operate Inner Parentheses", silent = true, noremap = true })

-- 1. File Management & Fuzzy Finding (Telescope Replacements)
-- =================================================================

-- Replace fzf#run with Telescope calls for directory and config search
vim.keymap.set(
    "n",
    "<localleader><Tab>",
    "<cmd>Telescope projects<CR>",
    { desc = "Telescope: Favorite Dirs/Projects", silent = true, noremap = true }
)

-- Simple directory change
vim.keymap.set("n", "<C-Up>", "<cmd>tcd ..<CR><cmd>pwd<CR>", { desc = "Change Dir Up", silent = true, noremap = true })

-- Replace :Files calls with Telescope
local telescope_dir_files = function(dir_var)
    return function()
        vim.cmd("Telescope find_files cwd=" .. vim.fn.expand(dir_var))
    end
end

vim.keymap.set(
    "n",
    "<localleader>od",
    telescope_dir_files("$DOTFILES"),
    { desc = "Telescope: DOTFILES", silent = true, noremap = true }
)
vim.keymap.set(
    "n",
    "<localleader>oc",
    telescope_dir_files("$DOTFILES"),
    { desc = "Telescope: DOTFILES", silent = true, noremap = true }
)
vim.keymap.set(
    "n",
    "<localleader>cd",
    telescope_dir_files("$DOTFILES"),
    { desc = "Telescope: DOTFILES", silent = true, noremap = true }
)
vim.keymap.set(
    "n",
    "<localleader>ow",
    telescope_dir_files("$WORK_DIR"),
    { desc = "Telescope: WORK_DIR", silent = true, noremap = true }
)
vim.keymap.set(
    "n",
    "<localleader>on",
    telescope_dir_files("$NOTES_DIR"),
    { desc = "Telescope: NOTES_DIR", silent = true, noremap = true }
)
vim.keymap.set(
    "n",
    "<localleader>ov",
    telescope_dir_files("$VIM_DIR_CONFIGS"),
    { desc = "Telescope: VIM_CONFIGS", silent = true, noremap = true }
)
vim.keymap.set(
    "n",
    "<F3>",
    telescope_dir_files("$NOTES_DIR"),
    { desc = "Telescope: NOTES_DIR", silent = true, noremap = true }
)

-- =================================================================
-- 2. Open Config Files (Static Paths)
-- =================================================================

local config_dir = vim.fn.stdpath("config")
local open_tab_config = function(path)
    return function()
        vim.cmd("tabnew " .. config_dir .. path)
        vim.cmd("setl foldmethod=marker")
    end
end
local open_tab_file = function(path)
    return function()
        vim.cmd("tabedit " .. vim.fn.expand(path))
    end
end

-- Open Nvim config files (Obsolete paths replaced with Lua file names)
vim.keymap.set(
    "n",
    "<localleader>cb",
    open_tab_config("/config/keymaps.lua"),
    { desc = "Open: Keymaps Config", silent = true, noremap = true }
)
vim.keymap.set(
    "n",
    "<localleader>cc",
    "<cmd>Telescope find_files cwd=" .. config_dir .. "<CR>",
    { desc = "Telescope: Find Config Files", silent = true, noremap = true }
)
vim.keymap.set(
    "n",
    "<localleader>cp",
    open_tab_config("/plugins/init.lua"),
    { desc = "Open: Plugins Config", silent = true, noremap = true }
)
vim.keymap.set(
    "n",
    "<localleader>cs",
    open_tab_config("/config/options.lua"),
    { desc = "Open: Settings Config", silent = true, noremap = true }
)
-- Removed cf, cl, cu as they pointed to non-standard or obsolete files.

-- Mirroring Configs (Alt/Shift is replaced by 't:e' to open in a new tab)
vim.keymap.set("n", "<localleader>eb", open_tab_file("$DOTFILES/linux/.bashrc"), { desc = "Edit: .bashrc" })
vim.keymap.set("n", "<localleader>xa", open_tab_file("$DOTFILES_BIN/session/alias.sh"), { desc = "Edit: alias.sh" })
vim.keymap.set("n", "<localleader>xt", open_tab_file("$DOTFILES_CONFIGS/.tmux.conf"), { desc = "Edit: .tmux.conf" })
vim.keymap.set("n", "<localleader>xb", open_tab_file("$DOTFILES_CONFIGS/bspwm/bspwmrc"), { desc = "Edit: bspwmrc" })
vim.keymap.set("n", "<localleader>xs", open_tab_file("$DOTFILES_CONFIGS/sxhkd/sxhkdrc"), { desc = "Edit: sxhkdrc" })
vim.keymap.set("n", "<localleader>xx", open_tab_file("$DOTFILES_CONFIGS/.Xresources"), { desc = "Edit: .Xresources" })
vim.keymap.set("n", "<localleader>xi", open_tab_file("$DOTFILES_LINUX/.inputrc"), { desc = "Edit: .inputrc" })
vim.keymap.set("n", "<localleader>xe", open_tab_file("$DOTFILES_LINUX/.env"), { desc = "Edit: .env" })
vim.keymap.set(
    "n",
    "<localleader>xk",
    open_tab_file("$DOTFILES_CONFIGS/kitty/kitty.conf"),
    { desc = "Edit: kitty.conf" }
)

-- 3. Quick Directory Editing
local edit_dir = function(path)
    return function()
        vim.cmd("e " .. vim.fn.expand(path))
    end
end
vim.keymap.set(
    "n",
    "<localleader>zD",
    edit_dir("$DOTFILES"),
    { desc = "Edit: DOTFILES Dir", silent = true, noremap = true }
)
vim.keymap.set(
    "n",
    "<localleader>zl",
    edit_dir("$DOTFILES_LINUX"),
    { desc = "Edit: DOTFILES_LINUX Dir", silent = true, noremap = true }
)
vim.keymap.set(
    "n",
    "<localleader>zb",
    edit_dir("$DOTFILES_BIN"),
    { desc = "Edit: DOTFILES_BIN Dir", silent = true, noremap = true }
)
vim.keymap.set(
    "n",
    "<localleader>zc",
    edit_dir("$DOTFILES_CONFIGS"),
    { desc = "Edit: DOTFILES_CONFIGS Dir", silent = true, noremap = true }
)
vim.keymap.set(
    "n",
    "<localleader>zn",
    edit_dir("$NOTES_DIR"),
    { desc = "Edit: NOTES_DIR Dir", silent = true, noremap = true }
)
vim.keymap.set(
    "n",
    "<localleader>zw",
    edit_dir("$WORK_DIR"),
    { desc = "Edit: WORK_DIR Dir", silent = true, noremap = true }
)

-- 4. Favorite Sessions (AutoSession Replacements)
local restore_session = function(path)
    return function()
        require("auto-session").restore_session({ filename = vim.fn.expand(path) })
    end
end
vim.keymap.set(
    "n",
    "<F25>",
    restore_session("$DOTFILES_CONFIGS"),
    { desc = "Session: DOTFILES_CONFIGS", silent = true, noremap = true }
)
vim.keymap.set(
    "n",
    "<F26>",
    restore_session("$DOTFILES"),
    { desc = "Session: DOTFILES", silent = true, noremap = true }
)
vim.keymap.set(
    "n",
    "<F27>",
    restore_session("$NOTES_DIR"),
    { desc = "Session: NOTES_DIR", silent = true, noremap = true }
)
vim.keymap.set(
    "n",
    "<F28>",
    restore_session("$WORK_DIR_CURRENT"),
    { desc = "Session: WORK_DIR_CURRENT", silent = true, noremap = true }
)
vim.keymap.set(
    "n",
    "<F29>",
    restore_session("$VIM_DIR_CONFIGS"),
    { desc = "Session: VIM_CONFIGS", silent = true, noremap = true }
)

-- load the session for the current directory
vim.keymap.set("n", "<leader>qs", function()
    require("persistence").load()
end)

-- select a session to load
vim.keymap.set("n", "<leader>qS", function()
    require("persistence").select()
end)

-- load the last session
vim.keymap.set("n", "<leader>ql", function()
    require("persistence").load({ last = true })
end)

-- stop Persistence => session won't be saved on exit
vim.keymap.set("n", "<leader>qd", function()
    require("persistence").stop()
end)

-- vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Up"))
