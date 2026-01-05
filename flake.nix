{
  description = "shortener - A minimal URL shortener";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages.default = pkgs.rustPlatform.buildRustPackage {
          pname = "shortener";
          version = "0.1.0";
          src = self;
          cargoLock.lockFile = ./Cargo.lock;
          nativeBuildInputs = with pkgs; [ 
            pkg-config 
          ];
          buildInputs = with pkgs; [ openssl ];
        };

        apps.default = {
          type = "app";
          program = "${self.packages.${system}.default}/bin/shortener";
        };

        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            rustup
            pkg-config
            openssl
          ];
        };
      }
    );
}

