{
  description = "Neovim configuration for DevOps";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = { self, nixpkgs, flake-utils, neovim-nightly-overlay, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ neovim-nightly-overlay.overlay ];
        };

        # Custom Neovim package
        customNeovim = pkgs.neovim.override {
          configure = {
            # Instead of inline configuration, we now reference our config directory
            customRC = ''
              lua require('init')
            '';

            packages.myVimPackage = with pkgs.vimPlugins; {
              start = [
                # Tree-sitter
                nvim-treesitter.withAllGrammars

                # Completion
                nvim-cmp
                cmp-nvim-lsp
                cmp-buffer
                cmp-path
                luasnip
                cmp_luasnip

                # ALE
                ale

                # LSP Support
                nvim-lspconfig

                # General utilities
                plenary-nvim
                telescope-nvim
                
                # Git integration
                vim-fugitive
                
                # File explorer
                nvim-tree-lua
                
                # Status line
                lualine-nvim
                
                # Theme
                tokyonight-nvim
              ];
            };
          };
        };

        # Create a derivation for our config files
        neovimConfig = pkgs.stdenv.mkDerivation {
          name = "neovim-config";
          src = ./config;
          installPhase = ''
            mkdir -p $out/config
            cp -r * $out/config/
          '';
        };

        # Wrap neovim to include our config files
        wrappedNeovim = pkgs.symlinkJoin {
          name = "neovim-wrapped";
          paths = [ customNeovim ];
          buildInputs = [ pkgs.makeWrapper ];
          postBuild = ''
            wrapProgram $out/bin/nvim \
              --set NVIM_APPNAME "custom-neovim" \
              --add-flags "-u ${neovimConfig}/config/init.lua"
          '';
        };

      in
      {
        packages.default = wrappedNeovim;
        
        apps.default = flake-utils.lib.mkApp {
          drv = wrappedNeovim;
        };
      }
    );
}
