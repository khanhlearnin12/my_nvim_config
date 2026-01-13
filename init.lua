-- mistake can be making is dont forget the "," of each function
-- all the config of plugin is blow down mess up
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

--system configuration
vim.wo.number = true
vim.wo.relativenumber = true

--keymap here
vim.keymap.set("n", "<leader>pv", ":Ex<CR>", { desc = "this to see the content view" })
vim.keymap.set("n", "<leader>vt", ":vert terminal<CR>", { desc = "this to open the vertical terminal" })
vim.keymap.set("n", "<leader>ht", ":horizontal terminal<CR>", { desc = "this to open the horizontal terminal" })
vim.keymap.set("n", "<leader>yy", '"+yy', { desc = "yank to the clipboard" })
vim.keymap.set("t", "<C-e>", "<C-\\><C-n>", { desc = "Exit terminal (Terminal Mode)" })
vim.keymap.set("n", "<leader>rn", ":IncRename ")
vim.keymap.set("n", "<leader>cf", function()
	require("conform").format()
end, { desc = "format the current file" }) --format the code

-- name keymap
vim.keymap.set("n", "<leader>rn", function()
	return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })

-- Shorter keymaps for resizing windows
vim.keymap.set("n", "<C-w><Up>", "<C-w>+", { desc = "Increase Window Height" })
vim.keymap.set("n", "<C-w><Down>", "<C-w>-", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<C-w><Left>", "<C-w><", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<C-w><Right>", "<C-w>>", { desc = "Increase Window Width" })

-- Optional: Quick commands to maximize/equalize
vim.keymap.set("n", "<leader>=", "<C-w>=", { desc = "Equalize Windows" })

--Local systemconfig
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local opts = {}
-- this is the plugin place put those fucking plugin here
local plugins = {
	-- this catppuccin
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	-- this treesitter
	{ "nvim-treesitter/nvim-treesitter", branch = "master", lazy = false, build = ":TSUpdate" },
	--this telescope pack
	{ "nvim-telescope/telescope.nvim", tag = "v0.2.0", dependencies = { "nvim-lua/plenary.nvim" } },
	--this is the nvim surronding
	--site: https://github.com/kylechui/nvim-surround
	{
		"kylechui/nvim-surround",
		version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	--completion
	{
		"neovim/nvim-lspconfig", -- REQUIRED: for native Neovim LSP integration
		lazy = false, -- REQUIRED: tell lazy.nvim to start this plugin at startup
		dependencies = {
			-- main one
			{ "ms-jpq/coq_nvim", branch = "coq" },

			-- 9000+ Snippets
			{ "ms-jpq/coq.artifacts", branch = "artifacts" },

			-- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
			-- Need to **configure separately**
			{ "ms-jpq/coq.thirdparty", branch = "3p" },
			-- - shell repl
			-- - nvim lua api
			-- - scientific calculator
			-- - comment banner
			-- - etc
		},
		init = function()
			vim.g.coq_settings = {
				auto_start = true, -- if you want to start COQ at startup
				-- Your COQ settings here
			}
		end,
		config = function()
			-- Your LSP settings here
		end,
	},
	--new dashboard
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-mini/mini.icons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	},
	--vimsniped
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
	},
	--this tmx navigate plugins
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
			"TmuxNavigatorProcessList",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},
	require("plugins"),
}

require("lazy").setup(plugins, opts)

--require cappuccin
-- this is the themes part
require("catppuccin").setup()
-- require catppuccin
vim.cmd.colorscheme("catppuccin")

-- require for treesister
require("nvim-treesitter.configs").setup({
	-- language ensure install
	ensure_installed = { "lua", "vim", "vimdoc", "c", "python", "rust" },
	-- highlight enable
	highlight = {
		enable = true,
	},
	-- tính năng bật lề tự động
	indent = { enable = true },
})

-- telescope configuration
local builtin = require("telescope.builtin")
local home = os.getenv("HOME")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
-- Use this command to search all files including hidden ones
vim.keymap.set("n", "<leader>ch", function()
	require("telescope.builtin").find_files({ hidden = true, prompt_title = "NEOVIM DOTFILE" })
end, { desc = "Find hidden files" })

-- obsidian keymaps
vim.keymap.set("n", "<leader>go", ":ObsidianFollowLink<CR>", { desc = "Telescope find files" })
