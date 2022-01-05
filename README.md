# codingBydocker

自定义的 _docker_ 镜像，基于 _archlinux_ 。安装了常用的工具和包，并且创建了 _chensy_ 用户和 _lin_ 用户组。

# 文件说明

## condig-\*

一些应用的配置文件，从文件名即可看出是哪些应用的配置。

## start.sh

初次进入容器需要执行，是安装平时用到的编程语言和相应的工具。

# 初次进入系统的配置

1. 用 _root_ 用户添加 _chensy_ 用户的 _sudo_ 权限。

```shell
%lin ALL=(ALL) NOPASSWD: ALL
```

2. root 用户登出。

3. 执行 `/home/chensy/start.sh`。

# 遇到的问题

1. 在 _Mac_ 上用匿名卷会找不到 _Source Path_ 位置。因为启动时指定卷位置。
