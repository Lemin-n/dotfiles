let
  utils = import ../utils;
in
with utils;
{
  config = {
    maps = {
      normal."<leader>q" =
        keymap {
          binding = ":lua vim.lsp.buf.code_binding()";
        };
      normal."<leader>d" =
        keymap {
          binding = ":lua vim.lsp.buf.definition()";
        };
      normal."<leader>s" = keymap {
        binding = ":lua vim.lsp.buf.hover()";
      };
      normal."<leader>i" = keymap {
        binding = ":lua vim.lsp.buf.implementation()";
      };
      normal."<leader>sh" = keymap {
        binding = ":lua vim.lsp.buf.signature_help()";
      };
      normal."<leader>td" = keymap {
        binding = ":lua vim.lsp.buf.type_definition()";
      };
      normal."<leader>r" = keymap {
        binding = ":lua vim.lsp.buf.references()";
      };
      normal."<leader>ds" = keymap {
        binding = ":lua vim.lsp.buf.document_symbol()";
      };
      normal."<leader>ws" = keymap {
        binding = ":lua vim.lsp.buf.workspace_symbol()";
      };
      normal."<leader>dn" = keymap {
        binding = ":lua vim.lsp.buf.goto_next()";
      };
      normal."<leader>dp" = keymap {
        binding = ":lua vim.lsp.buf.goto_prev()";
      };
      normal."<leader>th" = keymap {
        binding = ":botright new <Bar> :terminal";
      };
      normal."<leader>ts" = keymap {
        binding = ":botright vnew <Bar> :terminal";
      };
      normal."<leader>g" = keymap {
        binding = ":lua require('telescope.builtin').live_grep()";
      };
    };
  };
}
