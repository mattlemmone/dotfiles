local M = {}

M.is_in_git_repo = function(path)
	vim.fn.system("git -C " .. path .. " rev-parse 2>/dev/null")
	return vim.v.shell_error == 0
end

M.get_git_root = function(path)
	local dot_git_path = vim.fn.finddir(".git", path)
	local repo_root = vim.fn.fnamemodify(dot_git_path, ":h")
	return repo_root
end

M.get_git_project_root = function(path)
	if M.is_in_git_repo(path) then
		return M.get_git_root(path)
	end

	return nil
end

return M
