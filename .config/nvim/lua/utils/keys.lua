local M = {}

local KEYS = {
	LEADER = "<Leader>",
	CMD = "<CMD>",
	ENTER = "<CR>",
}

M.create_key_map = function(opts)
	local callback = (type(opts.command) == "string") and KEYS.CMD .. opts.command .. KEYS.ENTER
		or (type(opts.command) == "function") and opts.command
		or error("Invalid command type")

	return {
		((opts.useLeader and KEYS.LEADER) or "") .. opts.sequence,
		callback,
		mode = opts.modes or { "n" },
		desc = opts.description,
		silent = true,
	}
end

return M
