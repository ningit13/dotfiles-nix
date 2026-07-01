{
  opts = {
    number = true;
    # Enable cursor line highlight
    cursorline = true;

    # Disable swap files and enable undo files for persistent undo history
    swapfile = false;
    undofile = true;
    undolevels = 10000;

    # Use system clipboard for all yank/paste operations
    clipboard = "unnamedplus";

    # Allow l to move to the next line at end of line
    whichwrap = "b,s,l,h,<,>,[,]";

    # list = true;
    # listchars = "space:·";
  };
}
