local term_toggle = require("toggleterm").toggle
vim.keymap.set("n", "<leader>tt", term_toggle, { desc = "Toggle Terminal", noremap = true, silent = true })

local i_map = function(lhs, rhs, desc)
    vim.keymap.set("i", lhs, rhs, { desc = desc, silent = true, noremap = true })
end

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
