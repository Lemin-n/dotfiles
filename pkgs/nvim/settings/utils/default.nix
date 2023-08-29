{
  keymap = { binding, mode ? { nowait = true; silent = true; noremap = true; } }: {
    action = "<cmd>" + binding + "<CR>";
    nowait = mode.nowait;
    silent = mode.silent;
    noremap = mode.noremap;
  };
  lspconfig = {enable ? true, autostart ? true, filetypes ? [], installLanguageServer ? false, cmd ? null }: {
  	enable = enable;
	autostart = autostart;
	filetypes = filetypes;
	cmd = cmd;
	installLanguageServer = installLanguageServer;
  };
}
