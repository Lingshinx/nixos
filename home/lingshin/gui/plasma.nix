{pkgs, ...}: {
  home.packages = with pkgs;
  with kdePackages; [
    kleopatra
    whitesur-kde
    plasma-keyboard
    qtvirtualkeyboard
    kde-gtk-config

    kmail
    kmail-account-wizard

    application-title-bar
    kconfig

    krita
    kdeconnect-kde
  ];
}
