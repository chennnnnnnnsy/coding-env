echo "---------- 开始初始化 ----------"
echo -e "\n"

git config --global user.name "chensy"
git config --global user.email "code.chensy.lin@outlook.com"
git config --global core.ignorecase false

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

ln -s $HOME/codes/coding-env/nvim $HOME/.config/nvim
ln -s $HOME/codes/coding-env/.zshrc $HOME/.zshrc
ln -s $HOME/codes/coding-env/.cargo $HOME/.cargo

echo -e  "\n"
echo "----------- 初始化完成！------------"

