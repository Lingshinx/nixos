{pkgs, ...}: {
  home.packages = with pkgs;
  with kdePackages; [
    whitesur-kde
    plasma-keyboard
    karousel
  ];
}
