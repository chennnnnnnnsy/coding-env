# coding-env

个人开发环境配置仓库，用于在 macOS 上通过软链接统一管理 Shell、终端提示符、Neovim 以及 VS Code / Cursor 编辑器设置。

## 目录结构

```
coding-env/
├── .zshrc              # Zsh + Oh My Zsh 配置（fnm、starship、代理、Homebrew 镜像等）
├── starship.toml       # Starship 提示符主题
├── nvim/               # Neovim 配置（lazy.nvim + 独立 / VSCode 双模式）
│   ├── init.lua
│   └── lua/
│       ├── config/     # 通用选项、键位、插件加载
│       ├── plugins/    # lazy.nvim 插件定义
│       └── vsc/        # vscode-neovim 专用键位与行为
└── vscode-vim/         # VS Code / Cursor 的 settings 与 keybindings
    ├── settings.json
    └── keybindings.json
```

## 前置依赖

| 工具 | 用途 |
|------|------|
| [Homebrew](https://brew.sh) | 包管理 |
| [Git](https://git-scm.com) | 克隆本仓库 |
| [Oh My Zsh](https://ohmyzsh.sh) | Zsh 框架（`.zshrc` 依赖 `$ZSH`） |
| [fnm](https://github.com/Schniz/fnm) | Node.js 版本管理 |
| [starship](https://starship.rs) | 跨 Shell 提示符 |
| [Neovim](https://neovim.io) ≥ 0.9 | 终端内编辑器 |
| [Nerd Font](https://www.nerdfonts.com) | 终端与编辑器图标字体（如 CodeNewRoman Nerd Font Mono） |

建议通过 Homebrew 安装常用工具：

```bash
brew install git fnm starship neovim
```

Oh My Zsh 及 Zsh 插件需单独安装：

```bash
# Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 插件（与 .zshrc 中 plugins 列表对应）
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

在 VS Code / Cursor 中使用 Neovim 键位时，还需安装扩展：[vscode-neovim](https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim)。

## 快速部署

将仓库克隆到本地后，把下列路径中的 `CODING_ENV` 替换为你的实际目录（例如 `~/codes/coding-env`）：

```bash
export CODING_ENV=~/codes/coding-env

# Shell
ln -sf "$CODING_ENV/.zshrc" ~/.zshrc
ln -sf "$CODING_ENV/starship.toml" ~/.config/starship.toml

# Neovim（XDG 标准路径）
mkdir -p ~/.config
ln -sfn "$CODING_ENV/nvim" ~/.config/nvim

# VS Code / Cursor（按需二选一或都链）
ln -sf "$CODING_ENV/vscode-vim/settings.json" ~/Library/Application\ Support/Code/User/settings.json
ln -sf "$CODING_ENV/vscode-vim/keybindings.json" ~/Library/Application\ Support/Code/User/keybindings.json

# Cursor 示例
ln -sf "$CODING_ENV/vscode-vim/settings.json" ~/Library/Application\ Support/Cursor/User/settings.json
ln -sf "$CODING_ENV/vscode-vim/keybindings.json" ~/Library/Application\ Support/Cursor/User/keybindings.json
```

首次打开 Neovim 时，`lazy.nvim` 会自动克隆并安装插件（当前主题为 [gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim)）。

若默认 Shell 不是 Zsh，可切换：

```bash
command -v zsh | sudo tee -a /etc/shells
chsh -s "$(command -v zsh)"
```

安装 Node.js（由 fnm 管理，`.zshrc` 已配置 `--use-on-cd`）：

```bash
fnm install --lts
fnm default lts-latest
```

## Shell（`.zshrc`）

- **主题**：Oh My Zsh `robbyrussell`，实际提示符由 Starship 接管（`eval "$(starship init zsh)"`）。
- **插件**：`brew`、`git`、`zsh-autosuggestions`、`zsh-syntax-highlighting`。
- **Node**：`fnm env --use-on-cd`，进入含 `.node-version` / `.nvmrc` 的目录时自动切换版本。
- **Homebrew**：已配置中科大（USTC）镜像环境变量，便于国内网络环境。
- **代理**：提供 `proxy_on`、`proxy_off`、`proxy_status` 三个函数（默认本地端口 `6152` / `6153`，可按机器修改）。

## Neovim（`nvim/`）

配置在 **独立 Neovim** 与 **VS Code 内 vscode-neovim** 之间自动分流：

- 检测 `vim.g.vscode == 1` 时加载 `lua/vsc/init.lua`，通过 `require("vscode").action(...)` 将 Vim 键位映射到 VS Code 命令（跳转定义、快速打开、格式化、折叠等）。
- 独立模式下加载 `gruvbox` 配色；VS Code 模式下不加载主题插件，由编辑器主题（如 Dracula）负责外观。

通用编辑习惯（`lua/config/`）：

- Leader：`<Space>`，Local leader：`\`
- 相对行号、2 空格缩进、搜索高亮
- `H` / `L` 行首行尾，`Y` / `P` 与系统剪贴板交互，`Ctrl+hjkl` 窗口导航等

首次启动或更新插件后，可在 Neovim 中执行 `:Lazy sync` 同步插件。

## VS Code / Cursor（`vscode-vim/`）

- **settings.json**：相对行号、2 空格 Tab、Dracula 主题、关闭 minimap / 标签栏等极简界面；为 `vscode-neovim` 设置扩展亲和性。
- **keybindings.json**：补全与 Quick Open 的 `Ctrl+j/k`、多光标 `Ctrl+n`、普通模式下 `Ctrl+s` 保存（避免与 Neovim 默认冲突）等。

编辑器字体在 settings 中指定为 **CodeNewRoman Nerd Font Mono**，需在系统中安装对应 Nerd Font 后才能在终端与编辑器中正常显示图标。

## 终端建议

1. 安装并选用一款 **Nerd Font** 作为终端与 IDE 字体。
2. 终端配色可与编辑器一致（如 **Dracula**），与 `vscode-vim/settings.json` 中的 `workbench.colorTheme` 呼应。

## 维护说明

- 修改 Neovim 插件后，`lazy.nvim` 会在 `nvim/lazy-lock.json` 中记录锁定版本，建议一并提交。
- 本仓库通过软链接使用，请勿在 `~/.zshrc`、`~/.config/nvim` 等目标路径直接编辑（除非有意脱离仓库管理）；应在 `coding-env` 目录内修改后重新加载或重启对应程序。
