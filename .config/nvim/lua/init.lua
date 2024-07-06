require("mlem.options")
require("mlem.autocmd")

require("mlem.keymaps.default")
require("mlem.package_manager")


-- Make sure lua can load custom modules under /mlem
local dotfiles = vim.fn.expand("~/dotfiles/neovim/lua/")
package.path = package.path .. ";" .. dotfiles .. "/?.lua;"

if vim.g.neovide then
	require("mlem.neovide")
end
