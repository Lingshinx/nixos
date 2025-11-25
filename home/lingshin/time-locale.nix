{pkgs, ...}: {
  home.language.base = "zh_CN.UTF-8";
  i18n.inputMethod = {
    enable = true;
    enabled = "fcitx5";
    fcitx5.addons = [pkgs.kdePackages.fcitx5-chinese-addons];
  };
}
