# 这份旧的**README**！！！

# 初次进入系统的配置

1. 用 _root_ 用户添加 _chensy_ 用户的 _sudo_ 权限，`visudo`。

```shell
# 加上这一句
%lin ALL=(ALL) NOPASSWD: ALL
```

2. root 用户登出。

3. 执行 该项目下的 _docker/run_start.sh_。

# 遇到的问题

1. _Dockerfile_ 生成的镜像运行时在 _Mac_ 上用匿名卷会找不到 _Source Path_ 位置。因为启动时指定卷位置。
