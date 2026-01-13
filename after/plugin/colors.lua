require('catppuccin').setup()
local keymap = require("nl.keymap")

local themeDark = "catppuccin"
local themeLight = "catppuccin"
local isDark = true


function ColorMyPencils(color)
	color = color or themeDark
	vim.cmd.colorscheme(color)

	--vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

function Dark()
	vim.g.catppuccin_flavour = "frappe" -- latte, frappe, macchiato, mocha
	vim.o.background = "dark"
	ColorMyPencils(themeDark)
end

function Light()
	vim.g.catppuccin_flavour = "latte" -- latte, frappe, macchiato, mocha
	vim.o.background = "light"
	ColorMyPencils(themeLight)
end

function ThemeToggle()
	if (isDark)
		then
		Light()
		isDark = false
	else
		Dark()
		isDark = true
	end
end

vim.keymap.set("n", keymap.toggle_darkmode, function() ThemeToggle() end, { noremap = true, silent = true })

if (isDark) then
    Dark()
else
    Light()
end
