{
  pkgs,
  nixos,
  lib,
  ...
}: {
  home.packages = with pkgs.kdePackages;
    lib.mkIf nixos.config.features.kde.enable
    [
      kleopatra
      plasma-keyboard
      qtvirtualkeyboard
      kde-gtk-config

      kmail
      kmail-account-wizard

      kconfig

      kdeconnect-kde

      pkgs.whitesur-kde
      pkgs.application-title-bar
      pkgs.krita
    ];
}
