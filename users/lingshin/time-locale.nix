{pkgs, ...}: {
  home.language.base = "zh_CN.UTF-8";
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs.kdePackages; [
      fcitx5-chinese-addons
      fcitx5-configtool
    ];
  };
}
