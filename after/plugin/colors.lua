local keymap = require("nl.keymap")

local themeDark = "rose-pine"
local themeLight = "gruvbox"
local isDark = true

function ColorMyPencils(color)
	color = color or themeDark
	vim.cmd.colorscheme(color)

	--vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

function Dark()
	vim.o.background = "dark"
	ColorMyPencils(themeDark)
end

function Light()
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

Dark()
