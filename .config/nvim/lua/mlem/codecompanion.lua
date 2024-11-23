local M = {}

local fmt = string.format

local constants = {
	LLM_ROLE = "llm",
	USER_ROLE = "user",
	SYSTEM_ROLE = "system",
}

M.get_prompt_library = function()
	return {
		["Refactor to React Hook"] = {
			strategy = "inline",
			description = "Generates a React hook",
			opts = {
				modes = { "v" },
				is_slash_cmd = false,
				pre_hook = function()
					local bufnr = vim.api.nvim_create_buf(true, false)
					vim.api.nvim_set_option_value("filetype", "typescriptreact", { buf = bufnr })
					vim.api.nvim_set_current_buf(bufnr)
					return bufnr
				end,
			},
			prompts = {
				{
					role = "system",
					content = "You are a ReactJS legend.",
				},
				{
					role = "user",
					content = "Convert this into a reusable React hook. Return the code only and no markdown codeblocks",
				},
			},
		},
		["Fix code inline"] = {
			strategy = "inline",
			description = "Fix the selected code",
			opts = {
				index = 7,
				is_default = true,
				is_slash_cmd = true,
				modes = { "v" },
				short_name = "fastfix",
				auto_submit = true,
				user_prompt = false,
				stop_context_insertion = true,
			},
			prompts = {
				{
					role = constants.SYSTEM_ROLE,
					content = [[When asked to fix code, follow these steps:

1. **Identify the Issues**: Carefully read the provided code and identify any potential issues or improvements.
2. **Explain the Fix**: Briefly explain what changes were made and why, as comments.

Ensure the fixed code:

- Includes necessary imports.
- Handles potential errors.
- Follows best practices for readability and maintainability.
- Is formatted correctly.

]],
					opts = {
						visible = true,
					},
				},
				{
					role = constants.USER_ROLE,
					content = function(context)
						local code =
							require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)

						return fmt(
							[[Please fix this code from buffer %d:

```%s
%s
```
]],
							context.bufnr,
							context.filetype,
							code
						)
					end,
					opts = {
						contains_code = true,
					},
				},
			},
		},
	}
end

return M
