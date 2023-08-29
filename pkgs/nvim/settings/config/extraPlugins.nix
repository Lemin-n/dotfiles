{ pkgs, ... }:
{
  extraPlugins = with pkgs.vimPlugins; [
    copilot-lua
    copilot-cmp
    limelight-vim
    goyo-vim
  ];
  extraPackages = with pkgs ;[
    ripgrep
  ];
  path = "/home/nvim";
  extraConfigLuaPre = ''
      require('copilot').setup({
        panel = {enabled = false},
        suggestion = {enabled = false},
        copilot_node_command = 'node',
        server_opts_overrides = {},
        filetypes = {
          ["*"] = true,
    },
      })
        require('copilot_cmp').setup()
  '';
}
