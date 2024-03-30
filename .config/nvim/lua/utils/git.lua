local M = {}

M.is_in_git_repo = function(path)
	vim.fn.system("git -C " .. path .. " rev-parse 2>/dev/null")
	return vim.v.shell_error == 0
end

M.get_git_root = function(path)
	local dot_git_path = vim.fn.finddir(".git", path)
	return vim.fn.fnamemodify(dot_git_path, ":h")
end

M.get_git_project_root = function(path)
	if M.is_in_git_repo(path) then
		return M.get_git_root(path)
	end

	return nil
end

M.get_git_project_root_or_current_dir = function()
	local current_file_dir = vim.fn.expand("%:p:h")

	return M.get_git_project_root(current_file_dir) or current_file_dir
end

return M
