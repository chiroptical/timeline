{pkgs, ...}:
pkgs.mkShell {
  inputsFrom = [
    (import ./timeline.nix pkgs).env
  ];
  buildInputs = with pkgs; [
    haskellPackages.cabal-install
    haskellPackages.ghcid
    haskellPackages.hpack
    haskellPackages.hlint
    haskellPackages.retrie
    haskellPackages.fourmolu
    haskellPackages.haskell-language-server
    alejandra
  ];
  withHoogle = true;
  LANG = "en_US.utf8";
}
