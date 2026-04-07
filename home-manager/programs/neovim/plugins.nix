{ pkgs, ... }:

with pkgs.vimPlugins;
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
      vim.lsp.config('nixd');
      vim.lsp.config('docker_language_server');
      vim.lsp.config('pyright');
    '';
  }
  mason-nvim
  {
    plugin = mason-lspconfig-nvim;
    type = "lua";
    config = ''
      ensure_installed = {
        'nixd',
        'docker_language_server',
        'pyright',
      }
    '';
  }
]
