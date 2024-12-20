# Nix Flake Neovim Configuration

A comprehensive Neovim configuration managed through Nix flakes, designed for DevOps engineers. This configuration works across NixOS and MacOS (via nix-darwin).

The configuration was an experiment using GitHub Copilot to generate a Nix Flake. The pronpt used was as follows:

```
Create a nix flake that configures neovim for use by a DevOps Engineer. The flake should set up neovim to use plugins, and have the following installed by default:
- ALE
- cmp
- treesitter
Additionally, neovim should be configured to support the following Languages by default:
- Python
- NodeJS
- Terraform
- Lua
The intended usage of the flake is to maintain the same neovim setup across a number of different computers, including NixOS and MacOS (using nix-darwin).
```

## Features

- Cross-platform compatibility (NixOS and MacOS)
- Modern plugin setup with:
  - ALE for linting and fixing
  - nvim-cmp for completion
  - Treesitter for syntax highlighting
- Language support for:
  - Python
  - NodeJS (JavaScript/TypeScript)
  - Terraform
  - Lua
- Additional features:
  - Git integration (vim-fugitive)
  - File exploration (nvim-tree)
  - Fuzzy finding (telescope)
  - Status line (lualine)
  - Modern theme (tokyonight)

## Usage

### Direct Usage

```bash
# Clone the repository
git clone https://github.com/cjrowe/nix-flake-neovim.git
cd nix-flake-neovim

# Run Neovim with this configuration
nix run .
```
