local state = {
	floating = {
		buf = -1,
		win = -1,
	},
}

local function toggle_floating_terminal()
	-- Check if window exists and is valid
	if vim.api.nvim_win_is_valid(state.floating.win) then
		-- If it's open, close it
		vim.api.nvim_win_close(state.floating.win, true)
	else
		-- Determine dimensions (80%)
		local width = math.ceil(vim.o.columns * 0.8)
		local height = math.ceil(vim.o.lines * 0.8)
		local col = math.ceil((vim.o.columns - width) / 2)
		local row = math.ceil((vim.o.lines - height) / 2)

		-- Create or reuse buffer
		if not vim.api.nvim_buf_is_valid(state.floating.buf) then
			state.floating.buf = vim.api.nvim_create_buf(false, true)
		end

		-- Open the window
		state.floating.win = vim.api.nvim_open_win(state.floating.buf, true, {
			relative = "editor",
			width = width,
			height = height,
			row = row,
			col = col,
			style = "minimal",
			border = "rounded",
		})

		-- If the buffer is new/empty, start the terminal
		if vim.bo[state.floating.buf].buftype ~= "terminal" then
			vim.fn.termopen(vim.o.shell)
		end

		vim.cmd("startinsert")
	end
end

-- Use the same keymap for Normal and Terminal mode
vim.keymap.set({ "n", "t" }, "<leader>ft", toggle_floating_terminal, { desc = "Toggle Floating Terminal" })
