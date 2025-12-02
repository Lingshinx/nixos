{
  pkgs,
  inputs,
  ...
}: let
  kwin-forceblur = inputs.lingshin.inputs.kwin-effects-forceblur.packages.${pkgs.system}.default;
in {
  home.packages = with pkgs;
  with kdePackages; [
    kwin-forceblur
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
    # karousel
  ];
}
