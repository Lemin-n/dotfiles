{...}: {
  programs.wofi = {
    enable = true;
    settings = {
      allow_images = true;
      show = "run";
      prompt = "(๑꒪▿꒪)*";
      always_parse_args = true;
      show_all = true;
      width = 1200;
      hide_scroll = true;
      insensitive = true;
      columns = 3;
    };
    style = ''
      @define-color	color-one  #506B8A;
      @define-color	color-one-rgb rgb(80, 107, 138);
      @define-color	color-two  #5B7A9D;
      @define-color	color-two-rgb  rgb(91, 122, 157);
      @define-color	color-three  #3B5170;
      @define-color	color-three-rgb  rgb(59, 81, 112);
      @define-color	color-four  #232E49;
      @define-color	color-four-rgb  rbg(35, 46, 73);
      @define-color	text  #0B75BA;
      @define-color	text-rgb  rgb(0, 139, 246);
      @define-color   background-color rgba(35, 46, 73, 0.6);
      @define-color   background-color-alt rgba(59, 81, 112, 0.6);

      * {
        font-family: 'Inconsolata Nerd Font', monospace;
        font-size: 14px;
      }

      /* Window */
      window {
        margin: 0px;
        padding: 0px;
        border: 0.1em solid;
        border-radius: 1em;
        background-color: @background-color;
        animation: slideIn 0.5s ease-in-out both;
      }

      /* Slide In */
      @keyframes slideIn {
        0% {
           opacity: 0;
        }

        100% {
           opacity: 1;
        }
      }

      /* Inner Box */
      #inner-box {
        margin: 5px;
        padding: 10px;
        border: none;
        background-color: @background-color;
        animation: fadeIn 0.5s ease-in-out both;
      }

      /* Fade In */
      @keyframes fadeIn {
        0% {
           opacity: 0;
        }

        100% {
           opacity: 1;
        }
      }

      /* Outer Box */
      #outer-box {
        margin: 5px;
        padding: 10px;
        background-color: @background-color;
        border: none;
      }

      /* Scroll */
      #scroll {
        margin: 0px;
        padding: 10px;
        border: none;
      }

      /* Input */
      #input {
        margin: 10px 20px;
        padding: 10px;
        border: none;
        border-radius: 1em;
        /*border-radius: 0.1em;*/
        background-color: @background-color-alt;
        animation: fadeIn 0.5s ease-in-out both;
      }

      #input image {
          border: none;
          color: @color-two;
      }

      #input * {
        outline: 4px solid @color-one!important;
      }

      /* Text */
      #text {
        padding: 0.2em;
        border: none;
        color: @text;
        animation: fadeIn 0.5s ease-in-out both;
      }

      #entry {
        margin: 0.2em;
        background-color: @background-color;
      }

      #entry arrow {
        border: none;
        color: @color-three;
      }

      /* Selected Entry */
      #entry:selected {
        border: 0.2em solid @color-three;
      }

      #entry:selected #text {
        color: @text;
      }

      #entry:drop(active) {
        background-color: @color-one!important;
      }

      #entry > * {
        background-color: @color-one!important;
      }
    '';
  };
}
