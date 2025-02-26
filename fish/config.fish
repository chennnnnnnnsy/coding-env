if status is-interactive
    # Commands to run in interactive sessions can go here
    set -U fish_greeting

    # node 的版本管理器
    fnm env --use-on-cd | source

    # 美化 prompt
    starship init fish | source


    # homebrew 代理
    set -Ux HOMEBREW_BREW_GIT_REMOTE "https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
    set -Ux HOMEBREW_CORE_GIT_REMOTE "https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
    set -Ux HOMEBREW_INSTALL_FROM_API 1

    # 终端设置代理
    set -Ux https_proxy "http://127.0.0.1:7890"
    set -Ux http_proxy "http://127.0.0.1:7890"
    set -Ux all_proxy "socks5://127.0.0.1:7890"

    # set -Ux C_INCLUDE_PATH "/usr/local/Cellar/llvm/17.0.6/include"
    # set -Ux CPLUS_INCLUDE_PATH "/usr/local/Cellar/llvm/17.0.6/include/c++/v1"
    # set -gx LDFLAGS "-L/usr/local/opt/llvm/lib"
    # set -gx CPPFLAGS "-I/usr/local/opt/llvm/include"

    # 全局变量
    set -gx PATH (yarn global bin):"/usr/local/opt/llvm/bin":$PATH

    # alias gcpp "g++ -stdlib++-isystem $CPLUS_INCLUDE_PATH"
end
