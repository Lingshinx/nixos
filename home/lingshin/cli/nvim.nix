{pkgs, ...}: {
  home.packages = with pkgs; [
    neovim-unwrapped
    github-cli
    tree-sitter
  ];
}
