return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	build = ":TSUpdate",
	config = function()
		-- Chuyển nội dung từ dòng 135 vào đây
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = { "lua", "vim", "vimdoc", "javascript", "html" }, -- thêm các ngôn ngữ bạn cần
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
