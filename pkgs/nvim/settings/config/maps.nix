let
  utils = import ../utils;
in
with utils;
{
  config = {
    maps = {
      normal."<leader>lq" =
        keymap {
          binding = ":lua vim.lsp.buf.code_binding()";
        };
      normal."<leader>ld" =
        keymap {
          binding = ":lua vim.lsp.buf.definition()";
        };
      normal."<leader>ls" = keymap {
        binding = ":lua vim.lsp.buf.hover()";
      };
      normal."<leader>li" = keymap {
        binding = ":lua vim.lsp.buf.implementation()";
      };
      normal."<leader>lh" = keymap {
        binding = ":lua vim.lsp.buf.signature_help()";
      };
      normal."<leader>lt" = keymap {
        binding = ":lua vim.lsp.buf.type_definition()";
      };
      normal."<leader>lr" = keymap {
        binding = ":lua vim.lsp.buf.references()";
      };
      normal."<leader>lds" = keymap {
        binding = ":lua vim.lsp.buf.document_symbol()";
      };
      normal."<leader>lw" = keymap {
        binding = ":lua vim.lsp.buf.workspace_symbol()";
      };
      normal."<leader>bn" = keymap {
        binding = ":lua vim.lsp.buf.goto_next()";
      };
      normal."<leader>bb" = keymap {
        binding = ":lua vim.lsp.buf.goto_prev()";
      };
      normal."<leader>th" = keymap {
        binding = ":botright new <Bar> :terminal";
      };
      normal."<leader>ts" = keymap {
        binding = ":botright vnew <Bar> :terminal";
      };
      normal."<leader>tg" = keymap {
        binding = ":lua require('telescope.builtin').live_grep()";
      };
    };
  };
}
