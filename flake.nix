{
  description = "Rust dev flake";
  inputs = {
    naersk.url = "github:nix-community/naersk/master";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    utils.url = "github:numtide/flake-utils";
    git-hooks.url = "github:cachix/git-hooks.nix";
  };
  outputs = {
    self,
    nixpkgs,
    utils,
    naersk,
    git-hooks,
  }:
    utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {inherit system;};
        naersk-lib = pkgs.callPackage naersk {};
        git-hooks-check = git-hooks.lib.${system}.run {
          src = ./.;
          hooks = {
            rustfmt.enable = true;
            clippy.enable = true;
            convco.enable = true;
          };
        };
      in {
        defaultPackage = naersk-lib.buildPackage ./.;
        devShell = with pkgs;
          mkShell {
            buildInputs = [cargo rustc rustfmt rust-analyzer rustPackages.clippy convco];
            RUST_SRC_PATH = rustPlatform.rustLibSrc;
            shellHook = ''
              ${git-hooks-check.shellHook}
            '';
          };
        checks = {
          pre-commit-check = git-hooks-check;
        };
      }
    );
}
