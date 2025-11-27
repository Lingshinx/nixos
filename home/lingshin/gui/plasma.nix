{pkgs, ...}: {
  home.packages = with pkgs;
  with kdePackages; [
    kleopatra
    whitesur-kde
    plasma-keyboard
    qtvirtualkeyboard

    application-title-bar
    kconfig
    # karousel
  ];
}
