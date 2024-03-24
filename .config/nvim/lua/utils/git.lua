local M = {}

M.isInGitRepo = function(path)
	vim.fn.system("git -C " .. path .. " rev-parse 2>/dev/null")
	return vim.v.shell_error == 0
end

M.get_git_root = function(path)
	local dot_git_path = vim.fn.finddir(".git", path)
	return vim.fn.fnamemodify(dot_git_path, ":h")
end

return M
