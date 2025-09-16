-- Enhanced Python support for uv, Poetry, and monorepos
return {
	{
		"neovim/nvim-lspconfig",
		opts = function()
			-- Function to find the closest .venv directory walking up the file tree
			local function find_venv_path(start_path)
				local path = start_path or vim.fn.getcwd()
				while path ~= "/" do
					local venv_path = path .. "/.venv"
					if vim.fn.isdirectory(venv_path) == 1 then
						return venv_path
					end
					path = vim.fn.fnamemodify(path, ":h")
				end
				return nil
			end

			-- Function to find pyproject.toml walking up the tree
			local function find_pyproject_root(start_path)
				local path = start_path or vim.fn.expand("%:p:h")
				while path ~= "/" do
					if vim.fn.filereadable(path .. "/pyproject.toml") == 1 then
						return path
					end
					path = vim.fn.fnamemodify(path, ":h")
				end
				return nil
			end

			-- Auto-command to set up Python environment detection
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "python",
				callback = function()
					local buffer_path = vim.fn.expand("%:p:h")
					local pyproject_root = find_pyproject_root(buffer_path)
					local venv_path = find_venv_path(pyproject_root or buffer_path)
					
					if venv_path then
						-- Set environment variables for this buffer
						vim.env.VIRTUAL_ENV = venv_path
						vim.env.PATH = venv_path .. "/bin:" .. vim.env.PATH
						
						-- Update pyright settings dynamically
						local clients = vim.lsp.get_clients({ name = "pyright", bufnr = 0 })
						for _, client in ipairs(clients) do
							if client.config.settings and client.config.settings.python then
								client.config.settings.python.venvPath = vim.fn.fnamemodify(venv_path, ":h")
								client.config.settings.python.pythonPath = venv_path .. "/bin/python"
								-- Notify the LSP server of configuration changes
								client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
							end
						end
					end
				end,
			})

			-- Enhanced Python environment activation (supports uv, Poetry, and .venv)
			vim.api.nvim_create_user_command("PyActivate", function()
				local cwd = vim.fn.getcwd()
				local venv_path = nil
				
				-- Try Poetry first if pyproject.toml exists
				if vim.fn.filereadable(cwd .. "/pyproject.toml") == 1 then
					local handle = io.popen("cd " .. cwd .. " && poetry env info --path 2>/dev/null")
					if handle then
						local poetry_venv = handle:read("*a"):gsub("%s+", "")
						handle:close()
						if poetry_venv ~= "" and vim.fn.isdirectory(poetry_venv) == 1 then
							venv_path = poetry_venv
							print("Found Poetry environment: " .. venv_path)
						end
					end
				end
				
				-- Fallback to local .venv
				if not venv_path then
					venv_path = find_venv_path(cwd)
					if venv_path then
						print("Found local .venv: " .. venv_path)
					end
				end
				
				if venv_path then
					vim.env.VIRTUAL_ENV = venv_path
					vim.env.PATH = venv_path .. "/bin:" .. vim.env.PATH
					print("Activated virtual environment: " .. venv_path)
					
					-- Restart Python LSP to pick up new environment
					vim.cmd("LspRestart pyright")
				else
					print("No virtual environment found")
				end
			end, { desc = "Activate Python virtual environment (Poetry/uv/.venv)" })

			-- Command to show current Python path
			vim.api.nvim_create_user_command("PyWhich", function()
				local handle = io.popen("which python")
				if handle then
					local result = handle:read("*a"):gsub("%s+", "")
					handle:close()
					print("Current Python: " .. result)
				end
			end, { desc = "Show current Python interpreter path" })
		end,
	},
}
