local inputUtils = require("utils/input")
local vault_path = vim.fn.expand("~") .. "/Library/Mobile Documents/iCloud~md~obsidian/Documents/iOS Vault/"

-- Create a note file with the given path and template
local function createNote(filepath, template_name)
	vim.cmd("e " .. filepath .. ".md")
	vim.cmd("ObsidianTemplate " .. template_name)
	vim.cmd("w")
end

local createNoteFromTemplate = function(obsidian_vault_sub_folder, template_name, note_name)
	if note_name then
		local filepath = vault_path .. obsidian_vault_sub_folder .. "/" .. note_name
		createNote(filepath, template_name)
	else
		inputUtils.promptUserForInput("Create a File", function(filename)
			if not filename then
				return
			end

			local filepath = vault_path .. obsidian_vault_sub_folder .. "/" .. filename
			createNote(filepath, template_name)
		end)
	end
end

return {
	"epwalsh/obsidian.nvim",
	version = "*", -- latest
	commands = {
		"ObsidianNew",
		"ObsidianTemplate",
		"ObsidianTags",
		"ObsidianBacklinks",
		"ObsidianQuickSwitch",
		"ObsidianSearch",
		"ObsidianRename",
	},
	open_notes_in = "hsplit",
	event = {
		"BufReadPre " .. vault_path .. "**.md",
		"BufNewFile " .. vault_path .. "**.md",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{
			"<Leader>zn",
			mode = { "n" },
			function()
				createNoteFromTemplate("Knowledge Base", "note")
			end,
			desc = "Create a Note",
		},
		{
			"<Leader>zt",
			"<CMD>ObsidianTags<CR>",
			mode = { "n" },
		},
		{
			"<Leader>zl",
			mode = { "n" },
			"<CMD>ObsidianBacklinks<CR>",
			desc = "Obsidian Backlinks",
		},
		{
			"<Leader>zf",
			mode = { "n" },
			"<CMD>ObsidianQuickSwitch<CR>",
			desc = "Obsidian Quick Switch",
		},
		{
			"<Leader>zs",
			mode = { "n" },
			"<CMD>ObsidianSearch<CR>",
			desc = "Search Notes",
		},
		{
			"<Leader>zr",
			mode = { "n" },
			function()
				inputUtils.promptUserForCommandArgs("Rename Note", "ObsidianRename")
			end,
			desc = "Rename Note",
		},
		{
			"<Leader>zw",
			mode = { "n" },
			function()
				createNoteFromTemplate("Weekly Reviews", "weekly review: outcomes", os.date("%Y-%m-%d"))
			end,
			desc = "Create a Weekly Review Note",
		},
		{
			"<Leader>zp",
			mode = { "n" },
			function()
				createNoteFromTemplate("Side Projects", "side projects")
			end,
			desc = "Create Side Project Idea",
		},
	},
	opts = {
		notes_subdir = "Knowledge Base",
		daily_notes = {
			folder = "Daily Notes",
			template = "daily.md",
		},
		templates = {
			subdir = "Note Templates",
			date_format = "%Y-%m-%d",
			time_format = "%H:%M",
		},
		-- This requires you have `conceallevel` set to 1 or 2. See `:help conceallevel` for more details.
		ui = {
			enable = true, -- set to false to disable all additional syntax features
			update_debounce = 200, -- update delay after a text change (in milliseconds)
			-- Define how various check-boxes are displayed
			checkboxes = {
				-- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
				[" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
				["x"] = { char = "", hl_group = "ObsidianDone" },
				[">"] = { char = "", hl_group = "ObsidianRightArrow" },
				["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
				-- Replace the above with this if you don't have a patched font:
				-- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
				-- ["x"] = { char = "✔", hl_group = "ObsidianDone" },

				-- You can also add more custom ones...
			},
			-- Use bullet marks for non-checkbox lists.
			bullets = { char = "•", hl_group = "ObsidianBullet" },
			external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
			-- Replace the above with this if you don't have a patched font:
			-- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
			reference_text = { hl_group = "ObsidianRefText" },
			highlight_text = { hl_group = "ObsidianHighlightText" },
			tags = { hl_group = "ObsidianTag" },
			hl_groups = {
				-- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
				ObsidianTodo = { bold = true, fg = "#f78c6c" },
				ObsidianDone = { bold = true, fg = "#89ddff" },
				ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
				ObsidianTilde = { bold = true, fg = "#ff5370" },
				ObsidianBullet = { bold = true, fg = "#89ddff" },
				ObsidianRefText = { underline = true, fg = "#c792ea" },
				ObsidianExtLinkIcon = { fg = "#c792ea" },
				ObsidianTag = { italic = true, fg = "#89ddff" },
				ObsidianHighlightText = { bg = "#75662e" },
			},
		},
		workspaces = {
			{
				name = "iOS Vault",
				path = vault_path,
			},
		},
		-- Optional, customize how names/IDs for new notes are created.
		note_id_func = function(title)
			local suffix = ""
			if title ~= nil then
				-- If title is given, transform it into valid file name.
				suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", "")
			else
				-- If title is nil, just add 4 random uppercase letters to the suffix.
				for _ = 1, 4 do
					suffix = suffix .. string.char(math.random(65, 90))
				end
			end
			return suffix
		end,
	},
}
