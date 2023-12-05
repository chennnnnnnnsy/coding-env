export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="ys"

plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

export TERM=screen-256color

eval "$(starship init zsh)"
 
# export JAVA_HOME=$(/usr/libexec/java_home)
# export CLASS_PATH=$JAVA_HOME/lib
# export PATH=`yarn global bin`:/usr/local/opt/llvm/bin:$JAVA_HOME/bin:$PATH
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
 
export https_proxy=http://127.0.0.1:6152
export http_proxy=http://127.0.0.1:6152
export all_proxy=socks5://127.0.0.1:6153

eval "$(fnm env --use-on-cd)"

export PATH=/Applications/WezTerm.app/Contents/MacOS:`yarn global bin`:/usr/local/opt/llvm/bin:$PATH

# ___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi
