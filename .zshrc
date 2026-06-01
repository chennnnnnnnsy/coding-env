export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
  brew
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-vi-mode
)

source $ZSH/oh-my-zsh.sh

# Homebrew 中科大镜像（USTC）
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.ustc.edu.cn/homebrew-core.git"
export HOMEBREW_CASK_GIT_REMOTE="https://mirrors.ustc.edu.cn/homebrew-cask.git"
export HOMEBREW_API_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles/api"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"

proxy_on() {
  export http_proxy="http://127.0.0.1:6152"
  export https_proxy="http://127.0.0.1:6152"
  export all_proxy="socks5://127.0.0.1:6153"
  echo "✅ 代理已开启"
}

proxy_off() {
  unset http_proxy https_proxy all_proxy
  echo "❌ 代理已关闭"
}

# 查看当前代理状态
proxy_status() {
  echo "http_proxy: $http_proxy"
  echo "https_proxy: $https_proxy"
}

# ----- fnm node版本管理
eval "$(fnm env --use-on-cd --shell zsh)"

# ----- java 版本
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-1.8.jdk/Contents/Home
# export JAVA_HOME=/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home

# ----- android sdk
export ANDROID_SDK_ROOT=/opt/homebrew/share/android-commandlinetools

# ----- Hbuilderx
export HBUILDER_X_PATH=/Applications/HBuilderX.app/Contents/MacOS

# ----- DevEco Studio
export DEVECO_STUDIO_PATH=/Applications/DevEco-Studio.app/Contents/sdk/default/openharmony/toolchains

# ----- 全局变量
export PATH=$PATH:$HBUILDER_X_PATH:$DEVECO_STUDIO_PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$JAVA_HOME/bin:/Users/ex_lincx4/.local/bin

eval "$(starship init zsh)"

ZVM_SYSTEM_CLIPBOARD_ENABLED=true

