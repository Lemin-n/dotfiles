let
  utils = import ../../utils;
in
with utils;
{
  imports = [ ./rust.nix ./null-ls.nix ];
  plugins.lsp = {
    enable = true;
    servers = {
      cssls = lspconfig {
        cmd = [ "vscode-css-language-server" "--stdio" ];
        filetypes = [ "css" "scss" "less" ];
      };
      denols = lspconfig {
        cmd = [ "deno" "lsp" ];
        filetypes = [ "javascript" "javascriptreact" "javascript.jsx" "typescript" "typescriptreact" "typescript.tsx" ];
      };
      #eslint = lspconfig{
      # 	cmd = ["vscode-eslint-language-server" "--stdio" ];
      #	filetypes =[ "javascript"  "javascriptreact"  "javascript.jsx"  "typescript"  "typescriptreact"  "typescript.tsx" "vue" "svelte" "astro"];
      #     };
      html = lspconfig {
        cmd = [ "vscode-html-language-server" "--stdio" ];
        filetypes = [ "html" "css" "javascript" ];
      };
      #intelephense = lspconfig{
      #	cmd = ["intelephense" "--stdio" ];
      #	filetypes = ["php"];
      #     };
      jsonls = lspconfig {
        cmd = [ "vscode-json-language-server" "--stdio" ];
        filetypes = [ "json" "jsonc" ];
      };
      lua-ls = lspconfig {
        cmd = [ "lua-language-server" ];
        filetypes = [ "lua" ];
      };
      #nixd = lspconfig{
      # 	cmd = ["nixd"];
      #	filetypes = ["nix"];
      # };
      pyright = lspconfig {
        cmd = [ "pyright-langserver" "--stdio" ];
        filetypes = [ "python" ];
      };
      rnix-lsp = lspconfig {
        cmd = [ "rnix-lsp" ];
        filetypes = [ "nix" ];
      };
      tailwindcss = lspconfig {
        cmd = [ "tailwindcss-language-server" "--stdio" ];
        filetypes = [ "aspnetcorerazor" "astro" "astro-markdown" "blade" "clojure" "django-html" "htmldjango" "edge" "eelixir" "elixir" "ejs" "erb" "eruby" "gohtml" "haml" "handlebars" "hbs" "html" "html-eex" "heex" "jade" "leaf" "liquid" "markdown" "mdx" "mustache" "njk" "nunjucks" "php" "razor" "slim" "twig" "css" "less" "postcss" "sass" "scss" "stylus" "sugarss" "javascript" "javascriptreact" "reason" "rescript" "typescript" "typescriptreact" "vue" "svelte" ];
      };
      #taplo = lspconfig{
      #cmd = ["taplo" "lsp" "stdio"];
      #	filetypes = ["toml"];
      #     };
      tsserver = lspconfig {
        cmd = [ "typescript-language-server" "--stdio" ];
        filetypes = [ "javascript" "javascriptreact" "javascript.jsx" "typescript" "typescriptreact" "typescript.tsx" ];
      };
      yamlls = lspconfig {
        cmd = [ "yaml-language-server" "--stdio" ];
        filetypes = [ "yaml" "yaml.docker-compose" ];
      };
      zls = lspconfig {
        cmd = [ "zls" ];
        filetypes = [ "zig" "zir" ];
      };
    };
  };
  plugins.lsp-format.enable = true;
  plugins.lspkind.enable = true;
  plugins.lspsaga.enable = true;

  # https://nix-community.github.io/nixvim/plugins/nix.html
  plugins.nix.enable = true;

  # https://github.com/ziglang/zig.vim
  # https://nix-community.github.io/nixvim/plugins/zig.html
  plugins.zig.enable = true;
}

#
#	lsp_zero.ensure_installed = {
#		"tailwindcss",
#		"lua_ls",
#		"rust_analyzer",
#		"cssls",
#		"pyright",
#		"intelephense",
#		"jsonls",
#		"html",
#		"dockerls",
#		"docker_compose_language_service",
#		"bashls",
#		"rnix",
#		"sqlls",
#		"taplo",
#		"lemminx",
#		"yamlls",
#	}
