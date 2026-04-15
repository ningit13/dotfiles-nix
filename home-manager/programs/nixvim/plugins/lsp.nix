{
  plugins = {
    lsp = {
      enable = true;
      inlayHints = true;

      servers = {
        # c/c++, cmake
        clangd = {
          enable = true;
          package = null;
        };
        cmake = {
          enable = true;
          package = null;
        };
        # docker
        dockerls = {
          enable = true;
        };
        # json
        jsonls = {
          enable = true;
        };
        # lua
        lua_ls = {
          enable = true;
          package = null;
        };
        # markdown
        marksman = {
          enable = true;
        };
        # nix
        nil_ls = {
          enable = true;
          package = null;
        };
        # python
        pyright = {
          enable = true;
          package = null;
        };
        # rust
        # rust_analyzer = {
        #   enable = true;
        #   package = null;
        # };
        # toml
        tombi = {
          enable = true;
        };
        # yaml
        yamlls = {
          enable = true;
        };
      };
    };
  };
}
