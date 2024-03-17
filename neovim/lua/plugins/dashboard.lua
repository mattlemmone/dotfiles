return {
	{
		"echasnovski/mini.starter",
		event = "VimEnter",
		branch = "stable",
		opts = function()
			local config = {
				items = {
					{
						action = "Telescope project",
						name = "Projects",
						section = "Files",
					},
					{
						action = "Lazy update",
						name = "Update",
						section = "Plugins",
					},
					{
						action = "Lazy profile",
						name = "Profile",
						section = "Plugins",
					},
				},

				header = [[ ]],
				footer = "",
			}

			return config
		end,
		config = function(_, config)
			-- close Lazy and re-open when starter is ready
			if vim.o.filetype == "lazy" then
				vim.cmd.close()
				vim.api.nvim_create_autocmd("User", {
					pattern = "MiniStarterOpened",
					callback = function()
						require("lazy").show()
					end,
				})
			end

			local starter = require("mini.starter")
			starter.setup(config)

			vim.api.nvim_create_autocmd("User", {
				pattern = "LazyVimStarted",
				callback = function()
					local stats = require("lazy").stats()
					local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
					local pad_footer = string.rep(" ", 0)
					starter.config.footer = pad_footer .. "⚡ Loaded " .. stats.count .. " plugins in " .. ms .. "ms"
					pcall(starter.refresh)
				end,
			})
		end,
	},
}
