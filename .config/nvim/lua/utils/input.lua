local M = {}

M.promptUserForCommandArgs = function(prompt, command)
	vim.ui.input({ prompt = prompt }, function(input)
		if not input then
			return
		end
		vim.cmd(command .. " " .. input)
	end)
end

return M
