local M = {}

local KEYS = {
	LEADER = "<Leader>",
	CMD = "<CMD>",
	ENTER = "<CR>",
}

local parse_command = function(command)
	return (type(command) == "string") and KEYS.CMD .. command .. KEYS.ENTER
		or (type(command) == "function") and command
		or error("Invalid command type")
end

M.create_lazy_key_map = function(opts)
	local callback = parse_command(opts.command)

	return {
		((opts.useLeader and KEYS.LEADER) or "") .. opts.sequence,
		callback,
		mode = opts.modes or { "n" },
		desc = opts.description,
		silent = true,
		buffer = opts.buffer,
	}
end

M.set_vim_key_map = function(opts)
	local callback = parse_command(opts.command)

	vim.keymap.set(opts.modes or { "n" }, ((opts.useLeader and KEYS.LEADER) or "") .. opts.sequence, callback, {
		desc = opts.description,
		silent = true,
		buffer = opts.buffer,
	})
end

return M
