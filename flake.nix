{
  description = "FSO part 13";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
  outputs = inputs@{ flake-parts, ... }:
  flake-parts.lib.mkFlake { inherit inputs; } {
    systems = [
      "x86_64-linux" "x86_64-darwin"
      "aarch64-linux" "aarch64-darwin"
    ];
    perSystem = { config, self', inputs', pkgs, system, ... }:
    {
      devShells.default = with pkgs; mkShell {
        buildInputs = ([
            nodejs
            postgresql
        ]) ++ ( with nodePackages; [
            pnpm
        ]);

        shellHook = ''
        export PGHOST=$PWD/.postgres
        export PGDATA=$PGHOST/data
        export PGDATABASE=postgres
        export PGLOG=$PGHOST/postgres.log
        export LANG="en_US.UTF-8"

        mkdir -p $PGHOST

        if [ ! -d $PGDATA ]
        then
        initdb -U $USER -W
        fi

        if ! pg_ctl status
        then
        pg_ctl start -l $PGLOG -o "--unix_socket_directories='$PGHOST'"
        fi

        trap "pg_ctl stop" EXIT
        '';
      }; 
    };
  };
}
