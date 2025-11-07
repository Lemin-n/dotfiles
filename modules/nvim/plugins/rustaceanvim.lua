--@diagnostic disable: undefined-globals
--vim.lsp.enable("rust_analyzer")
local path = os.getenv("PWD")
local content = ""
-- Use dotfile instead env vars because nix insolated environment ignore current user env vars
local feature_file = io.open(path .. "/" .. ".editor-nvim", "r")
if feature_file ~= nil then
	content = feature_file:read("*all")
end
local project_features_env = content

local project_features = {}

local function split(str, sep)
	local result = {}
	local regex = ("([^%s]+)"):format(sep)
	for each in str:gmatch(regex) do
		if each == nil then
			goto continue
		end
		table.insert(result, each)
		::continue::
	end
	if result[0] == nil then
		table.insert(result, str)
	end
	return result
end

local config = {
	cargo = {
		loadOutDirsFromCheck = true,
		runBuildScripts = true,
	},
	diagnostics = {
		enable = true,
		["inactive-code"] = false,
	},
	checkOnSave = true,
	check = {
		command = "clippy",
		--extraArgs = { "--no-deps" },
	},
}
if project_features_env == nil or project_features_env == "" then
	config.cargo.all_features = true
	config.check.all_features = true
else
	project_features = split(project_features_env, ",")
	config.cargo.features = project_features
	config.check.features = project_features
end

require("crates").setup({
	popup = {
		border = "rounded",
		show_version_date = true,
	},
	completion = {
		--[[cmp = {
			enabled = true,
		},--]]
		crates = {
			enabled = true,
		},
	},
	--[[null_ls = {
		enabled = true,
	},--]]
})
vim.g.rustaceanvim = {
	tools = {
		hover_actions = {
			auto_focus = true,
		},
		enable_clippy = true,
	},
	server = {
		on_attach = function()
			vim.lsp.inlay_hint.enable()
		end,
		default_settings = {
			["rust-analyzer"] = config,
		},
	},
}
