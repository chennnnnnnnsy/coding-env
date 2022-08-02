export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="ys"

plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

export TERM=screen-256color
 
# export JAVA_HOME=$(/usr/libexec/java_home)
# export PATH=`yarn global bin`:/usr/local/opt/llvm/bin:$JAVA_HOME/bin:$PATH
export PATH=`yarn global bin`:/usr/local/opt/llvm/bin:$PATH
# export CLASS_PATH=$JAVA_HOME/lib
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
 
# export https_proxy=http://127.0.0.1:8888
# export http_proxy=http://127.0.0.1:8888
# export all_proxy=socks5://127.0.0.1:8889

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi
