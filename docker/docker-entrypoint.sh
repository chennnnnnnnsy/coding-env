# 启动 systemctl
/usr/sbin/init

echo "---------- 开始初始化 ----------"
echo -e "\n"

git config --global user.name "chensy"
git config --global user.email "code.chensy.lin@outlook.com"
git config --global core.ignorecase false

# 如果太多文件，这一步会等很久
# sudo chown -R  chensy:lin $HOME/codes

# 不用生成这个，在宿主容器生成就行
# ssh-keygen -C "code.chensy.lin@outlook.com"
# echo "ssh 钥匙生成！"

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

exec "$@"
