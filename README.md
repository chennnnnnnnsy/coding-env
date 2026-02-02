# 开发环境配置

1. 安装 git
2. 把这个项目拉下来
3. 安装 homebrew
4. 用 brew 来安装 fnm、fish、starship、pnpm
5. shell 默认使用 fish
```bash
# 先执行这个加入shell配置表里
command -v fish | sudo tee -a /etc/shells

# 然后执行这个
chsh -s "$(command -v fish)"
```
5. 用 fnm 来安装 nodejs
6. 用软链接把 fish 和 starship 的配置文件链接到 .config 文件夹下
```bash
ln -s /Users/chensy/Codes/coding-env/fish ~/.config/fish
ln -s /Users/chensy/Codes/coding-env/starship.toml ~/.config/starship.toml
```
7. 选一款自己喜欢的 Nerd Font 字体，然后配置到 Terminal
8. 用 Dracula Theme 配置 Terminal

以上完成了开发环境的配置
