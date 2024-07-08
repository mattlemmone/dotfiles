require("mlem.options")
require("mlem.autocmd")

require("mlem.keymaps.default")
require("mlem.package_manager")

if vim.g.neovide then
	require("mlem.neovide")
end
