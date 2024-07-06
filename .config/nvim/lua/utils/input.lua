local M = {}

M.promptUserForCommandArgs = function(prompt, command)
	M.promptUserForInput(prompt, function(input)
		if not input then
			return
		end
		vim.cmd(command .. " " .. input)
	end)
end

M.promptUserForInput = function(prompt, onConfirm)
	vim.ui.input({ prompt = prompt }, function(input)
		onConfirm(input)
	end)
end

return M
