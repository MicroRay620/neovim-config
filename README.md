# Neovim Config
This is my, Ruby Rose ([MicroRay620](https://github.com/MicroRay620))'s, Neovim config. Feel free to modify, optimize, and/or use it for what ever you want.

# Plugins
For plugins, I use [Lazy](github.com/folke/lazy.nvim)
My config uses the following Plugins:
- [aerial](https://github.com/stevearc/aerial.nvim)
- [completions](https://github.com/hrsh7th/nvim-cmp)
- [flash](https://github.com/folke/flash.nvim)
- [grapple](https://github.com/cbochs/grapple.nvim)
- [lspconfig](https://github.com/neovim/nvim-lspconfig)
- [markdown](github.com/tadmccorkle/markdown.nvim)
- [mason](https://github.com/mason-org/mason.nvim)
- [nvim-dap-lldb](https://github.com/julianolf/nvim-dap-lldb)
- [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)
- [nvim-lint](https://github.com/mfussenegger/nvim-lint)
- [render-markdown](https://github.com/MeanderingProgrammer/render-markdown.nvim)
- [suave](https://github.com/nyngwang/suave.lua)
- [surround](https://github.com/kylechui/nvim-surround)
- [theme](https://github.com/Mofiqul/dracula.nvim) 
    - To see the theme I use [theme - dracula](https://github.com/MicroRay620/neovim-config/blob/main/lua/plugins/theme.lua)
- [treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [whichkey](https://github.com/folke/which-key.nvim)

# Mason Installs
When you use the config I have these installed via Mason:
- luacheck
- cspell
- htmlhint
- clangd
- clang-format
- cpplint
- cpptools
- csharp-language-server
- css-lsp
- debugpy
- lua-language-server
- php-debug-adapter

To install these run this script
```vim
:MasonInstall luacheck cspell htmlhint clangd cpplint cpptools csharp-language-server css-lsp debugpy lua-language-server php-debug-adapter
```
> The MasonInstalls are optional 

For proper usage, make sure to install luarocker
