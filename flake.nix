{
  description = "Nix flake for ajazz-time-correction-tool";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

  outputs =
    {
      nixpkgs,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      cargoToml = builtins.fromTOML (builtins.readFile ./Cargo.toml);
      package = pkgs.rustPlatform.buildRustPackage {
        pname = cargoToml.package.name;
        version = cargoToml.package.version;

        src = ./.;

        cargoLock.lockFile = ./Cargo.lock;

        nativeBuildInputs = [
          pkgs.pkg-config
        ];

        buildInputs = [
          pkgs.udev
        ];

        meta = {
          description = "Synchronize the clock of an Ajazz AK820 keyboard";
          homepage = "https://github.com/kacpersledz/ajazz-time-correction-tool";
          license = pkgs.lib.licenses.mit;
          mainProgram = "ajazz-time-correction-tool";
          platforms = pkgs.lib.platforms.linux;
        };
      };
    in
    {
      packages.${system} = {
        default = package;
        ajazz-time-correction-tool = package;
      };

      checks.${system}.package = package;
    };
}
