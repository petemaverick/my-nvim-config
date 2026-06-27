# Neovim (NvChad) Configuration System

## Project Overview
This repository manages a custom Neovim configuration built on top of the NvChad starter framework.

## Tech Stack
- Neovim (v0.10+)
- Lua
- NvChad Starter template

## Key Files & Structure
- `init.lua`: Main entry point.
- `lua/plugins/init.lua`: Where custom lazy.nvim plugins are defined.
- `lua/mappings.lua`: Global keymaps.
- `lua/options.lua`: Vim options/settings.

## Core Rules for Claude
- Always structure custom plugins using the `lazy.nvim` syntax expected by NvChad.
- Do not modify core NvChad internal files; only add or modify files in the `lua/` directory.
- To test the configuration without breaking the main editor, use: `nvim --headless +Lazy! sync +qa` to verify plugin installations.
- for any new plugins always add a separate file for the plugin 
