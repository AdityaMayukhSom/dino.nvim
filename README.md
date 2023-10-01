# dino.nvim

![License](https://img.shields.io/badge/License-GPL%203.0-blue.svg)

dino.nvim is my personalized Neovim configuration, tailored to suit my coding preferences and workflow. It provides an optimized and feature-rich development environment for various programming languages, including Python, C++, Lua, and JSON. The configuration is built with simplicity and efficiency in mind, aiming to boost productivity and enhance the overall coding experience.

## Prerequisites

Before setting up dino.nvim, ensure that the following dependencies are installed on your system:

- [Node Version Manager (nvm)](https://github.com/nvm-sh/nvm): For managing Node.js versions.
- [NodeJS](https://nodejs.org/en): Required to compile many plugins.
- [Clangd](https://clang.llvm.org/): For C++ language server support.
- [Python](https://www.python.org/): For compilation and language server support.
- [xclip](https://github.com/astrand/xclip): Enables clipboard functionality.
- [xdg-utils](https://www.freedesktop.org/wiki/Software/xdg-utils/): Required for Markdown preview functionality specifically for WSL.
- [Unzip](https://linux.die.net/man/1/unzip): Required for installing clangd and in general many other packages which requires unzipping.

To install nvm and Node.js LTS, follow the instructions in the [nvm repository](https://github.com/nvm-sh/nvm).

```bash
# On Ubuntu/Debian-based systems, you can install xclip, xdg-utils, and unzip using:
sudo apt-get install -y xclip xdg-utils unzip
```

## Installation

1. Install [Neovim](https://neovim.io/) if you haven't already.
2. Install [Packer](https://github.com/wbthomason/packer.nvim) using the installation guide here.

  `(Installing Packer can be as simple as cloning the repository inside ~/.local directory as mentioned in Packer repository)`

3. Clone the repository:

```bash
git clone https://github.com/yourusername/dino.nvim.git ~/.config/nvim
```

3. Install the Packer package manager. It will be used to manage plugins in dino.nvim:

```bash
# Install Packer by running this command inside Neovim:
:PackerInstall
```

4. Restart Neovim to apply the changes.

## Usage

The configuration is mainly optimized for Python, C++ and Lua language servers. You can use it as is or add support for other languages according to your needs by modifying files under `lua/user/lsp` directory.

## Theme

dino.nvim uses the [Oxocarbon](https://github.com/nyoom-engineering/oxocarbon.nvim) theme for a clean and modern look.

## Language Server Support

dino.nvim supports the following language servers:

- Python (Using [jedi_language_server](https://github.com/pappasam/jedi-language-server))
- C++ (Using [clangd](https://clang.llvm.org/))
- Lua (Using [lua_ls](https://github.com/LuaLS/lua-language-server))
- JSON

These language servers provide intelligent code completion, syntax checking, and other code analysis features to improve your coding workflow.

## Formatting

dino.nvim supports formatting using Mason formatters:

- For Python formatting, install `black` formatter using `:MasonInstall black`.
- For Markdown, JavaScript, HTML, CSS etc files, install `prettier` using `MasonInstall prettier`.

## Key Bindings

*(Keymaps section is coming soon!)*

## License

dino.nvim is licensed under the GNU General Public License Version 3.0 (GPL-3.0). For details, please see the [LICENSE](./LICENSE) file.
