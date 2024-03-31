require("mlem.options")
require("mlem.autocmd")

require("mlem.mappings").registerDefaultKeymaps()
require("mlem.package_manager").init()

-- Make sure lua can load custom modules under /mlem
local dotfiles = vim.fn.expand("~/dotfiles/neovim/lua/")
package.path = package.path .. ";" .. dotfiles .. "/?.lua;"
