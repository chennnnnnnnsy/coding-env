# codingBydocker

自定义的 *docker* 镜像，基于 *archlinux* 。安装了常用的工具和包，并且创建了 *chensy* 用户和 *lin* 用户组。


# 文件说明

## condig-*

一些应用的配置文件，从文件名即可看出是哪些应用的配置。

## start.sh

初次进入容器需要执行，是安装平时用到的编程语言和相应的工具。

# 初次进入系统的配置

1. 用 *root* 用户添加 *chensy* 用户的 *sudo* 权限。

```shell
%lin ALL=(ALL) NOPASSWD: ALL
```

2. root用户登出。

3. 执行 `/home/chensy/start.sh`。

# 遇到的问题

1. 在 *Mac* 上用匿名卷会找不到 *Source Path* 位置。因为启动时指定卷位置。
