# dino.nvim

Dino.nvim is my personalized Neovim configuration, tailored to suit my coding preferences and workflow. It provides an optimized and feature-rich development environment for various programming languages, including Python, C++, Lua, and JSON. The configuration is built with simplicity and efficiency in mind, aiming to boost productivity and enhance the overall coding experience.

## Prerequisites

Before setting up Dino.nvim, ensure that the following dependencies are installed on your system:

- [Node Version Manager (nvm)](https://github.com/nvm-sh/nvm): For managing Node.js LTS.
- [Clangd](https://clang.llvm.org/): For C++ language server support.
- [Python](https://www.python.org/): For compilation and language server support.
- [xclip](https://github.com/astrand/xclip): Enables clipboard functionality.
- [xdg-utils](https://www.freedesktop.org/wiki/Software/xdg-utils/): Required for Markdown preview functionality.
- [Unzip](https://linux.die.net/man/1/unzip): Required for installing clangd.

To install nvm and Node.js LTS, follow the instructions in the [nvm repository](https://github.com/nvm-sh/nvm).

```bash
# On Ubuntu/Debian-based systems, you can install xclip, xdg-utils, and unzip using:
sudo apt-get install -y xclip xdg-utils unzip
```

## Installation

1. Clone the repository:

```bash
git clone https://github.com/yourusername/dino.nvim.git ~/.config/nvim
```

2. Install the Packer package manager. It will be used to manage plugins in Dino.nvim:

```bash
# Install Packer by running this command inside Neovim:
:PackerInstall
```

3. Restart Neovim to apply the changes.

## Theme

Dino.nvim uses the [Oxocarbon](https://github.com/nyoom-engineering/oxocarbon.nvim) theme for a clean and modern look. The theme is carefully chosen to provide a pleasant coding experience and reduce eye strain during long coding sessions.

## Language Server Support

Dino.nvim supports the following language servers:

- Python (Using [jedi_language_server](https://github.com/pappasam/jedi-language-server))
- C++ (Using [clangd](https://clang.llvm.org/))
- Lua
- JSON

These language servers provide intelligent code completion, syntax checking, and other code analysis features to improve your coding workflow.

## Key Bindings

*(You can add your custom keybindings here)*

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

Happy coding with Dino.nvim! 🦕

