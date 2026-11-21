{pkgs, ...}: {
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = ["FiraCode Nerd Font Propo"];
      serif = ["Noto Serif CJK SC"];
      sansSerif = ["Noto Sans CJK SC"];
      emoji = ["Noto Color Emoji"];
    };
  };
  home.packages = with pkgs; [
    lxgw-wenkai

    font-awesome
    fira-sans
    nerd-fonts.fira-code
    maple-mono.NF-CN
  ];
}
