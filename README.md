
# Docker

## 生成 Images 命令

注意：版本号需要自行设置

```bash
docker build -f ./docker/coding_dockerfile -t coding:x.x.x .
```

## 启动容器命令

volumes 可以设置多个。

注意：版本号需要写对

```bash
docker run -itd --privileged -P --name coding \
      -v 宿主机的绝对路径:容器的绝对路径 \
      coding:x.x.x
```

## 进去容器

注意：进入容器不能使用```attach```

```bash
docker exec -it coding:x.x.x
```

## 进入容器后

1. 用 _root_ 用户添加 _chensy_ 用户的 _sudo_ 权限，`visudo`。

```shell
# 加上这一句
%lin ALL=(ALL) NOPASSWD: ALL
```

2. root 用户登出。

3. 更新资源、工具。```sudo pacman -Syyu --noconfirm```

## 遇到的问题

1. _Dockerfile_ 生成的镜像运行时在 _Mac_ 上用匿名卷会找不到 _Source Path_ 位置。因为启动时指定卷位置。
2. Docker 遇到一个 systemctl 用不了的问题，解决办法docker创建容器时开启特权模式。[解决方法](https://blog.csdn.net/zhangyuhaifa/article/details/119756642).

# Neovim

lua + packer + nvim-lsp-config + nvim-treesisster

这个一套配置都是用 _lua_ 语言写的。

用到了 **Neovim** 内置的 **LSP**，因此需要手动安装语言服务。

~~ - _pyright_ ~~
- _bash-language-server_
- _@tailwindcss/language-server_
- _svelte-language-server_
- _vls_
- _typescript && typescript-language-server_
- _clang_
- _lua-language-server_
~~ - _rust-analyzer_ ~~
