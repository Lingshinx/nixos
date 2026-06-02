{pkgs, ...}: {
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-serif-static
    noto-fonts-cjk-sans-static
    noto-fonts-color-emoji
  ];
}
