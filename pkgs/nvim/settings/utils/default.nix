{
  keymap = { binding, mode ? { nowait = true; silent = true; noremap = true; } }: {
    nowait = mode.nowait;
    silent = mode.silent;
    noremap = mode.noremap;
    action = "<cmd>" + binding + "<CR>";
  };
}
