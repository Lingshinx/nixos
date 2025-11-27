{pkgs, ...}: {
  home.packages = with pkgs;
  with kdePackages; [
    whitesur-kde
    plasma-keyboard
    qtvirtualkeyboard

    application-title-bar
    kconfig
    # karousel
  ];
}
