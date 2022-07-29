# Windows 下的一些配置

命令行用 ***windows terminal***

## 包管理工具

**[scoop](https://scoop.sh/)**

然后利用 *scoop* 安装一些工具，如 *git*，*mingw*，*clangd*，*ripgrep*， *fzf*， *make*等等。

## 美化命令行

1. 需要安装 **oh-my-posh**

```cmd
scoop install https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/oh-my-posh.json
```

2. 安装完成之后，需要打开 *powershell* 自动启动这个 *oh-my-posh*

- 先检查有没 *powershell* 的启动配置文件 ```Test-Path $Profile```
- 如果返回 *False*，创建该文件```New-Item –Path $Profile –Type File –Force```
- 打开并修改配置文件```notepad $Profile```
- 加入一行```oh-my-posh init pwsh | Invoke-Expression```
- 保存后，重载一下 ```. $Profile```

3. 下载和配置 Nerd Font

[字体下载地址](https://www.nerdfonts.com/font-downloads)，这里选择了 *RobotoMono Nerd Font*，已经放在该项目的fonts目录下。

然后在 *Windows Terminal* 设置字体。

## Neovim 的使用

可以用 **nvim-qt** 或者在 **Windows Terminal** 输入 ```nvim```。