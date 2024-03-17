local M = {}

local KEYS = {
	LEADER = "<Leader>",
	CMD = "<CMD>",
	ENTER = "<CR>",
}

M.createKeyMap = function(opts)
	return {
		((opts.useLeader and KEYS.LEADER) or "") .. opts.sequence,
		KEYS.CMD .. opts.command .. KEYS.ENTER,
		mode = opts.modes or { "n" },
		desc = opts.description,
		silent = true,
	}
end

return M
