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
    set -Ux HOMEBREW_BOTTLE_DOMAIN "https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"

    # 终端设置代理
    # set -Ux https_proxy "http://0.0.0.1:6152"
    # set -Ux http_proxy "http://0:6152"
    set -Ux all_proxy "socks5://0:6153"

    # 全局变量

end
