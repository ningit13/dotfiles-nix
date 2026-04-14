{
  plugins = {
    lsp = {
      enable = true;
      inlayHints = true;

      servers = {
        clangd = {
          enable = true;
        };
        cmake = {
          enable = true;
        };
        dockerls = {
          enable = true;
        };
        jsonls = {
          enable = true;
        };
        lua_ls = {
          enable = true;
        };
        marksman = {
          enable = true;
        };
        nil_ls = {
          enable = true;
        };
        pyright = {
          enable = true;
        };
        # rust_analyzer = {
        #   enable = true;
        # };
        tombi = {
          enable = true;
        };
        yamlls = {
          enable = true;
        };
      };
    };
  };
}
