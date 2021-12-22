# 安装 oh-my-zsh 插件 和 移动配置
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
mv /home/chensy/configureFiles/config-zshrc /home/chensy/.zshrc

# 安装 Rust 和 cargo换源
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
mv /home/chensy/configureFiles/config-cargo /home/chensy/.cargo/config

# 切换shell
chsh -s /bin/zsh


