# Windows 下的一些配置

命令行用 ***windows terminal***

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

3. 下载 Nerd Font

[字体下载地址](https://www.nerdfonts.com/font-downloads)，这里选择了 *FiraMono Nerd Font*，已经放在该项目的fonts目录下。