{pkgs, ...}:
{
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = ["FiraCode Nerd Font Propo"];
      serif = ["Noto Sans CJK SC"];
      sansSerif = ["Noto Serif CJK SC"];
    };
  };
  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-serif
    noto-fonts-cjk-sans
    noto-fonts-color-emoji

    font-awesome
    fira-sans
    nerd-fonts.fira-code
    maple-mono.NF-CN
  ];
}
