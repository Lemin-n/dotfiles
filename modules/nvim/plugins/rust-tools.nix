{vimPlugins, ...}:
with vimPlugins; {
  plugin = rust-tools-nvim;
  type = "lua";
  config = ''
       local opts = {
       	tools = {
       		autoSetHints = true,
       		runnables = {
       			use_telescope = true,
       		},
       		inlay_hints = {
       			parameter_hints_prefix = "",
       			other_hints_prefix = "",
       		},
       	},
       	server = Rust_lsp,
       }
       require('rust-tools').setup(opts)
       require('crates').setup({
           popup = {
           	border = "rounded",
           	show_version_date = true,
           },
           null_ls = {
           	enabled = true,
           	name = "crates.nvim",
           },
    src ={
    	cmp ={
    		enabled = true,
    	},
    },
       })
  '';
}
