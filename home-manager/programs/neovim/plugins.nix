{ pkgs, ... }:
{
  programs.neovim.plugins = with pkgs.vimPlugins;
  [
    neo-tree-nvim
    # belows are dependencies
    nui-nvim
    plenary-nvim
    # belows are optionals
    nvim-web-devicons
    nvim-lsp-file-operations
    snacks-nvim
    image-nvim
    nvim-window-picker

    mini-surround
    {
      plugin = nvim-lspconfig;
      type = "lua";
      config = ''
        vim.lsp.enable('nixd');
        vim.lsp.enable('docker_language_server');
        vim.lsp.enable('pyright');
      '';
    }
  ];

  home.packages = with pkgs; [
    nixd
    docker-language-server
    pyright
  ];
}
