# 安装neovim的语言服务器
yarn global add \
        bash-language-server \
        @tailwindcss/language-server \
        svelte-language-server \
        vls \
        typescript \
        typescript-language-server \
        vscode-langservers-extracted \
        prettier
        pyright \

brew update && brew install llvm  lua-language-server luarocks cmake autopep8

# 主要用在nvim的项目中全局搜索
brew install ripgrep

luarocks install --server=https://luarocks.org/dev luaformatter
