{
  enabled = [
    {
      regex = ''
        (ipfs:|ipns:|magnet:|mailto:|gemini:|gopher:|https:|http:|news:|file:|git:|ssh:|ftp:)'';
      hyperlinks = true;
      command = "xdg-open";
      post_processing = true;
      mouse = {
        enabled = true;
        mods = "None";
      };
      binding = {
        key = "U";
        mods = "Control|Shift";
      };
    }
  ];
}
