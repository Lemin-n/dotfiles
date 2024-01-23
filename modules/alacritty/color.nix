let
  base = "#1E1E2E";
  text = "#CDD6F4";
  subtext0 = "#A6ADC8";
  subtext1 = "#BAC2DE";
  surface1 = "#45475A";
  surface2 = "#585B70";
  red = "#F38BA8";
  green = "#A6E3A1";
  yellow = "#F9E2AF";
  blue = "#89B4FA";
  pink = "#F5C2E7";
  teal = "#94E2D5";
  lavender = "#B4BEFE";
  rosewater = "#F5E0DC";
in let
  defaultColorSet = {
    red = red;
    green = green;
    yellow = yellow;
    blue = blue;
    magenta = pink;
    cyan = teal;
  };
in rec
{
  draw_bold_text_with_bright_colors = true;
  primary = {
    background = base;
    foreground = text;
    dim_foreground = text;
    bright_foreground = text;
  };
  cursor = {
    text = base;
    cursor = rosewater;
  };
  vi_mode_cursor = {
    text = base;
    cursor = lavender;
  };
  search = {
    matches = {
      foreground = base;
      background = subtext0;
    };
    focused_match = {
      foreground = base;
      background = green;
    };
  };
  footer_bar = search.matches;
  hints = {
    start = {
      foreground = base;
      background = yellow;
    };
    end = {
      foreground = base;
      background = subtext0;
    };
  };
  selection = {
    text = base;
    background = rosewater;
  };
  normal =
    {
      black = surface1;
      white = subtext1;
    }
    // defaultColorSet;
  bright =
    {
      black = surface2;
      white = subtext0;
    }
    // defaultColorSet;
  dim = normal;
  indexed_colors = [
    {
      index = 16;
      color = "#FAB387";
    }
    {
      index = 17;
      color = "#F5E0DC";
    }
  ];
}
