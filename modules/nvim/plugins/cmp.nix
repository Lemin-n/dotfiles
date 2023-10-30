{vimPlugins, ...}:
with vimPlugins; {
  plugin = lsp-zero-nvim;
  type = "lua";

  config = ''
                                       local lsp_zero = require("lsp-zero")
                                       local cmp = require("cmp")
                                       local lspkind = require('lspkind')
                                       require("copilot_cmp").setup({
             			fix_pairs = false,
             	      })
                                       lsp_zero.preset("recommended")
                                       local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
                                       capabilities.textDocument.completion.completionItem.snippetSupport = true
                                       capabilities.textDocument.colorProvider = {
                                       	dynamicRegistration = true,
                                       }
                                       keymap("n", "<leader>q", "lua vim.lsp.buf.code_action()")
                                       keymap("n", "<leader>d", "lua vim.lsp.buf.definition()")
                                       keymap("n", "<leader>s", "lua vim.lsp.buf.hover()")
                                       keymap("n", "<leader>i", "lua vim.lsp.buf.implementation()")
                                       keymap("n", "<leader>sh", "lua vim.lsp.buf.signature_help()")
                                       keymap("n", "<leader>td", "lua vim.lsp.buf.type_definition()")
                                       keymap("n", "<leader>r", "lua vim.lsp.buf.references()")
                                       keymap("n", "<leader>ds", "lua vim.lsp.buf.document_symbol()")
                                       keymap("n", "<leader>ws", "lua vim.lsp.buf.workspace_symbol()")
                                       keymap("n", "<leader>dn", "lua vim.diagnostic.goto_next()")
                                       keymap("n", "<leader>dp", "lua vim.diagnostic.goto_prev()")
           		 		require("rest-nvim").setup({})
                                       lsp_zero.set_preferences({ set_lsp_keymaps = false, cmp_capabilities = capabilities })
                                       lsp_zero.setup_nvim_cmp({
                                       	mapping = {
                                       		["<C-up>"] = cmp.mapping.select_prev_item(),
                                       		["<C-down>"] = cmp.mapping.select_next_item(),
                                       		-- Add tab support
                                       		["<S-Tab>"] = cmp.mapping.select_prev_item(),
                                       		["<Tab>"] = cmp.mapping.select_next_item(),
                                       		["<S-up>"] = cmp.mapping.scroll_docs(-4),
                                       		["<S-down>"] = cmp.mapping.scroll_docs(4),
                                       		["<C-Space>"] = cmp.mapping.complete(),
                                       		["<C-e>"] = cmp.mapping.close(),
                                       		["<CR>"] = cmp.mapping.confirm({
                                       			behavior = cmp.ConfirmBehavior.Insert,
                                       			select = true,
                                       		}),
                                       	},
                                       	sorting = {
                                       		priority_weight = 2,
                                       		comparators = {
                                       			cmp.config.compare.exact,
                                       			cmp.config.compare.kind,
                                       			cmp.config.compare.recently_used,
             		require("copilot_cmp.comparators").prioritize,
                                       		},
                                       	},
                                       	snippet = {
                                       		expand = function(args)
                                       			--vim.fn["vsnip#anonymous"](args.body)
             						require('luasnip').lsp_expand(args.body)
                                       		end,
                                       	},
                                       	sources = {
                                       		{ name = "path", priority = 5, },
                                       		{ name = "luasnip", priority = 5, },
                                       		{ name = "emoji", priority = 5, },
                                       		{ name = "npm", priority = 5, },
                                       		{ name = "nvim_lua", priority = 5, },
                                       		{ name = "buffer", keyword_length = 2, priority = 5 },
                                       		{ name = "nvim_lsp", priority = 1, },
                                       	    	{ name = 'conventionalcommits', priority = 1, },
                                       		{ name = "copilot", priority = -100, },
                                       		{ name = "crates", priority = 4, },
                                       	},
                                       	formatting = {
                                       	format = lspkind.cmp_format({
                                       	mode = 'symbol',
                                       	maxwidth = 50,
                                       	ellipsis_char = '...',
               				    symbol_map = {
                   Text = "発 ",
                   Method = " ",
                   Function = "󰊕 ",
                   Constructor = " ",
                   Field = "󰜢 ",
                   Variable = "󰀫 ",
                   Class = "󰠱 ",
                   Interface = " ",
                   Module = " ",
                   Property = "󰜢 ",
                   Unit = "󰑭 ",
                   Value = "󰎠 ",
                   Enum = " ",
                   Keyword = "󰌋 ",
                   Snippet = " ",
                   Color = "󰏘 ",
                   File = "󰈙 ",
                   Reference = "󰈇 ",
                   Folder = "󰉋 ",
                   EnumMember = " ",
                   Constant = "󰏿 ",
                   Struct = "󰙅 ",
                   Event = "",
                   Operator = "󰆕 ",
                   TypeParameter = "",
                   Copilot = " "
             },
                                       	before = function (entry, vim_item)
                                       		return vim_item
                                       	end
                                       	})
                                       	},
                                       	--configure completion window with transparent selector and border without scroplbar
                                       	window = {
                                       		completion = {
                                       			border = "rounded",
                                       			winhighlight = "Normal:CmpNormal",
                                       		},
                                       	},
                                       })
                                       lsp_zero.setup_servers = {
                                       	"tailwindcss",
                                       	"lua_ls",
                                       	"rust_analyzer",
                                       	"cssls",
                                       	"nil_ls",
                                       	"pyright",
                                       	"intelephense",
                                       	"jsonls",
                                       	"html",
                                       	"taplo",
                                       	"yamlls",
                                       	--"lemminx",
                                       	--"dockerls",
                                       	--"docker_compose_language_service",
                                       	--"bashls",
                                       }
                                       lsp_zero.format_on_save({
                                       	servers = {
                                       	["lua_ls"] = { "lua" },
                                       	["rust_analyzer"] = { "rust" },
                                       	["tailwindcss"] = { "css", "scss" },
                                   	["intelephense"] = { "php" },
                           		["pyright"] = { "python" },
                       			["taplo"] = { "toml" },
                                       	},
                                       })
                                       Rust_lsp = lsp_zero.build_options("rust_analyzer", {
       settings = {
         ["rust-analyzer"] = {
           -- Other Settings ...
           procMacro = {
             ignored = {
                 leptos_macro = {
                     "component",
                     "server",
                 },
             },
           },
         },
       }

       				  })
                                       local lsp = require('lspconfig')
                                       lsp.lua_ls.setup({})
                                       lsp.tailwindcss.setup({
         		  filetypes = {
           "css",
           "scss",
           "sass",
           "postcss",
           "html",
           "javascript",
           "javascriptreact",
           "typescript",
           "typescriptreact",
           "svelte",
           "vue",
           "rust",
         },
         init_options = {
           -- There you can set languages to be considered as different ones by tailwind lsp I guess same as includeLanguages in VSCod
           userLanguages = {
             rust = "html",
           },
           },
           		})
                                       lsp.cssls.setup({
                   				    cmd = {"css-languageserver" , "--stdio"},
             	      			})
                                       lsp.nil_ls.setup({
    ["nil"]= {
       formatting= {
         command= "nixpkgs-fmt",
       },
       nix ={
         binary ="nix",
         maxMemoryMB = null,
         flake = {
           autoArchive= true,
           autoEvalInputs= true,
           nixpkgsInputName= "nixpkgs",
         },
       },
     },

    					    })
                                       lsp.pyright.setup({})
                                       lsp.intelephense.setup({})
                                       lsp.jsonls.setup({
                   				cmd = {"vscode-json-languageserver" , "--stdio"},
                   				    })
                                       lsp.html.setup({})
                                       lsp.taplo.setup({})
                                       lsp.yamlls.setup({})
                                       lsp_zero.setup()
             		local lspsaga = require('lspsaga').setup({})
             require("colorizer").setup {
               filetypes = { "*" },
               user_default_options = {
                 RGB = true, -- #RGB hex codes
                 RRGGBB = true, -- #RRGGBB hex codes
                 names = true, -- "Name" codes like Blue or blue
                 RRGGBBAA = true, -- #RRGGBBAA hex codes
                 AARRGGBB = true, -- 0xAARRGGBB hex codes
                 css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                 mode = "background", -- Set the display mode.
                 -- Available methods are false / true / "normal" / "lsp" / "both"
                 -- True is same as normal
                 tailwind = true, -- Enable tailwind colors
                 sass = { enable = false, parsers = { "css" }, }, -- Enable sass colors
                 virtualtext = "■",
                 always_update = true
               },
               -- all the sub-options of filetypes apply to buftypes
               buftypes = {},
           }
  '';
}
