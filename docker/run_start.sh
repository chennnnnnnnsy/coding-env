echo "---------- 开始初始化 ----------"
echo -e "\n"

sudo chown -R  chensy:lin $HOME/codes

ssh-keygen -C "code.chensy.lin@outlook.com"

echo "ssh 钥匙生成！"
echo -e "\n"

# 安装neovim的语言服务器
yarn global add \
        pyright \
        bash-language-server \
        @tailwindcss/language-server \
        svelte-language-server \
        vls \
        typescript \
        typescript-language-server \
        vscode-langservers-extracted \
        prettier

ln -s  $HOME/codes/coding-env/nvim $HOME/.config/nvim

echo -e  "\n"
echo "----------- 初始化完成！------------"

