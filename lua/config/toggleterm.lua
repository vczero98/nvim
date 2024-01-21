require("toggleterm").setup({
	open_mapping = [[<C-\>]],
	direction = "float",
	float_opts = {
		border = "curved",
		winblend = 10,
	},
})

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
local python = Terminal:new({ cmd = "python", hidden = true })
local ipython = Terminal:new({ cmd = "ipython", hidden = true })
local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })

function _LAZYGIT_TOGGLE()
	lazygit:toggle()
end

function _PYTHON_TOGGLE()
	python:toggle()
end

function _IPYTHON_TOGGLE()
	ipython:toggle()
end

function _NCDU_TOGGLE()
	ncdu:toggle()
end

local wk = require("which-key")
wk.register({
	t = {
		name = "Toggleterm",
		l = { "<cmd> lua _LAZYGIT_TOGGLE()<CR>", "Open lazygit Terminal" },
		p = { "<cmd> lua _PYTHON_TOGGLE()<CR>", "Open Python Terminal" },
		i = { "<cmd> lua _IPYTHON_TOGGLE()<CR>", "Open iPython Terminal" },
		n = { "<cmd> lua _NCDU_TOGGLE()<CR>", "Open ncdu Terminal" },
		t = { "<cmd> ToggleTerm<CR>", "Open Terminal" },
	},
}, { prefix = "<Leader>" })
