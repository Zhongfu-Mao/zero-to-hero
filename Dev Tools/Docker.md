# 基础知识

## 什么是Docker

Docker 使用 Google 公司推出的**Go语言**进行开发实现，基于 Linux 内核的 **cgroup**，**namespace**，以及 OverlayFS 类的 Union FS 等技术，对进程进行封装隔离，属于 **操作系统层面的虚拟化技术**。

Docker为软件行业所做的尝试正是集装箱化为航运行业所做的：通过标准化减少本地差异的成本。

Docker的用处包括了软件原型、软件打包、减少测试和调试环境成本以及启用DevOps实践，例如持续交付（continuous delivery，CD）。

## Docker VS Virtual Machine

* 传统虚拟机技术是虚拟出一套硬件后，在其上运行一个完整操作系统，在该系统上再运行所需应用进程
* 容器内的应用进程直接运行于宿主的内核，容器内没有自己的内核，而且也没有进行硬件虚拟, 因此容器要比传统虚拟机更为轻便
* Docker容器和虚拟机之间一个关键的区别就是，容器是被设计成运行单个进程的

## Docker的优缺点

### 优点

* 更高效的利用系统资源
* 更快的启动时间
* 一致的运行环境
* 持续交付和部署
* 更轻松的迁移
* 更轻松的维护和拓展

### 缺点



## 镜像

* **Docker 镜像** 是一个特殊的文件系统，除了提供容器运行时所需的程序、库、资源、配置等文件外，还包含了一些为运行时准备的一些配置参数（如匿名卷、环境变量、用户等）。镜像 **不包含** 任何动态数据，其内容在构建之后也不会被改变。
* Docker镜像是运行容器的模板。这与程序可执行文件与运行进程的差异类似。运行中的容器的变更可以作为新的镜像进行提交并打标签。
* 镜像创建自分层文件系统，减少了Docker镜像在宿主机上的空间占用
* 镜像构建时，会一层层构建，前一层是后一层的基础。每一层构建完就不会再发生改变，后一层上的任何改变只发生在自己这一层。
* 镜像的唯一标识是其 ID 和摘要，而一个镜像可以有多个标签

## 容器

* 镜像（Image）和容器（Container）的关系，就像是面向对象程序设计中的 类 和 实例 一样，镜像是静态的定义，容器是镜像运行时的实体。容器可以被创建、启动、停止、删除、暂停等
* 与直接在宿主执行的进程不同，容器进程运行于属于自己的独立的 命名空间。因此容器可以拥有自己的 root 文件系统、自己的网络配置、自己的进程空间，甚至自己的用户 ID 空间
* 每一个容器运行时，是以镜像为基础层，在其上创建一个当前容器的存储层

## 仓库

### Docker Registry

* Docker Registry提供集中的存储, 分发镜像的服务
* 一个 Docker Registry 中可以包含多个仓库（Repository）
* 每个仓库可以包含多个 标签（Tag）
* 每个标签对应一个镜像

### Docker Registry公开服务

> Docker Registry 公开服务是开放给用户使用、允许用户管理镜像的 Registry 服务。一般这类公开服务允许用户免费上传、下载公开的镜像，并可能提供收费服务供用户管理私有镜像。

* [Docker Hub](https://hub.docker.com/)
* [Repositories · Quay](https://quay.io/repository/)
* [Google Container Registry  | Google Cloud](https://cloud.google.com/container-registry/)

### Repository

* 通常，一个仓库会包含同一个软件不同版本的镜像，而标签就常用于对应该软件的各个版本
* 通过 `<仓库名>:<标签>` 的格式来指定具体是这个软件哪个版本的镜像, 如果不给出标签，将以 `latest` 作为默认标签
* 仓库名经常是两段式名称，即 <用户名>/<软件名>。对于 Docker Hub，如果不给出用户名，则默认为 library，也就是官方镜像

## 最佳实现

* 在Docker的世界里，公认的最佳实践是尽可能多地把系统拆分开，直到在每个容器上都只运行一个“服务”，并且所有容器都通过网络互相连通
* 容器不应该向其存储层内写入任何数据，容器存储层要保持无状态化。所有的文件写入操作，都应该使用 数据卷（Volume）、或者 绑定宿主目录，在这些位置的读写会跳过容器存储层，直接对宿主（或网络存储）发生读写，其性能和稳定性更高。
* 尽可能使用`COPY`而不是`ADD`,因为语义明确

## 原理

* 安装Docker后获得两大组件:客户端(client)和守护进程(deamon, 有时也叫引擎)
* 通过`docker version`可以确定两者的版本
* Docker守护进程是用户与Docker交互的枢纽,其使用HTTP协议接收来自Docker客户端的请求并返回响应

# 使用镜像

## 查找

```bash
docker search <镜像名>
# 选项:
# -f/--filter<过滤条件 key=value的形式> -> 例: stars=100(stars100以上)
# --limit <输出结果的最大个数(int)>
# --help -> 获取帮助
```

## 获取

```bash
docker pull [选项] 仓库名[:标签] # 基本使用这个格式
# 省略标签的话默认使用`latest`标签

docker pull [选项] [<Docker Registry 地址 | IP>[:端口号]/]仓库名[:标签] # Docker Hub以外的Registry
```

## 列出

```shell
docker images
docker image list
docker image ls

docker system df # 查看镜像,容器,数据卷所占空间

# 虚悬镜像是那些标签为`<none>`的镜像, 一般由生成新镜像而没有指定名称导致旧镜像变为虚悬
docker image ls -f dangling=true # 列出虚悬镜像
docker image prune # 删除虚悬镜像

docker image ls -a # 列出中间层镜像

docker image ls [仓库名] | [仓库名:标签] # 列出部分镜像

docker image ls --filter [ since= | before= | label= ]

# 格式化使用的是Go的模板语法
docker image ls --format "{{.ID}}: {{.Repository}}"
docker image ls --format "table {{.ID}}\t{{.Repository}}\t{{.Tag}}"
```

[Introduction to Hugo Templating | Hugo (gohugo.io)](https://gohugo.io/templates/introduction/)

## 检视

```bash
docker [image] inspect <IMAGE ID | REPOSITORY>

docker history <IMAGE ID | REPOSITORY> # 查看构建层的详细
```

## 删除

```shell
docker image rm [选项] <镜像1> [<镜像2> ...]
docker rmi [选项] <镜像1> [<镜像2> ...]
```

<镜像> 可以是

* 镜像短ID

* 镜像长ID

* 镜像名(`<REPOSITORY>:<TAG>`)

* 镜像摘要(`<REPOSITOY>@<DIGEST>`)

```bash
docker image rm $(docker image ls -q -f before=mongo:3.2) # 配合ls
```

## 保存容器为镜像(慎用)

```shell
docker commit [选项] <容器ID或容器名> [<仓库名>[:<标签>]]
```

## 利用DockerFile定制

* [Dockerfile reference | Docker Documentation](https://docs.docker.com/engine/reference/builder/)
* [Best practices for writing Dockerfiles | Docker Documentation](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
* [ Documentation for Docker Official Images in docker-library (github.com)](https://github.com/docker-library/docs)

### 注释

> Dockerfile只支持行首注释, 行中任何其他位置的`#`标记都被视为参数, 注释中不允许行继续符

```dockerfile
# 在长 docker RUN 命令中添加注释

# comment 1
RUN apt-get update \
    # comment 2
    && apt-get install blabla blabla blabla \
    # comment 3
    && echo this is not a drill
```

### FROM

> 除了`ARG`可以出现在`FROM`之前外, Dockerfile必须以`FROM`开头

```dockerfile
FROM <image>[:<tag> | @<digest>] [AS <name>]
```

* `FROM scratch`表示不以任何镜像为基础
* 通过将`AS name`添加到`FROM`指令，可以将可选的名称赋予新的构建阶段。该名称可以在后续的`FROM`和`COPY --from=<name|index>`指令中使用，以引用此阶段构建的镜像

```dockerfile
ARG  CODE_VERSION=latest
FROM base:${CODE_VERSION}
```

### RUN

```dockerfile
# shell格式
RUN <command>
# exec格式
RUN ["executable", "param1", "param2"...]
```

#### shell格式

`shell`格式下, Linux下默认以`/bin/sh -c`执行, Windows下默认以`cmd /S /C`执行(所以可以使用环境变量)

默认shell可以用`SHELL`命令改变

可以使用`\`来续行

#### exec格式

```dockerfile
RUN ["/bin/bash", "-c", "echo hello"]
```

`exec`格式会被解析为JSON数组,所以必须用双引号括住

不会产生字符串拓展

Windows环境下必须特别注意反斜杠`\`

```dockerfile
RUN ["c:\\windows\\system32\\tasklist.exe"]
```

### COPY

```dockerfile
# 命令行格式
COPY [--chown=<user>:<group>] <源路径>... <目标路径>
# 函数调用格式,如果包含空格必须使用此格式
COPY [--chown=<user>:<group>] ["<源路径1>",... "<目标路径>"]
```

`<源路径>` 可以是多个，甚至可以是通配符，其通配符规则要满足 Go 的 [`filepath.Match`](https://golang.org/pkg/path/filepath/#Match) 规则

```dockerfile
COPY hom* /mydir/
COPY hom?.txt /mydir/
```

`<目标路径>` 可以是容器内的绝对路径，也可以是相对于工作目录的相对路径（工作目录可以用 `WORKDIR` 指令来指定）。目标路径不需要事先创建，如果目录不存在会在复制文件前先行创建缺失目录。

注意: 使用 `COPY` 指令，源文件的各种**元数据**都会保留。比如读、写、执行权限、文件变更时间等。

### ADD

```dockerfile
# 命令行格式
ADD [--chown=<user>:<group>] <源路径>... <目标路径>
# 函数调用格式,如果包含空格必须使用此格式
ADD [--chown=<user>:<group>] ["<源路径1>",... "<目标路径>"]
```

`ADD`比`COPY`增加的功能:

* `<源路径>` 可以是一个 `URL`,Docker 引擎会试图去下载这个链接的文件放到 `<目标路径>` 去
  * 下载后的文件权限自动设置为 `600`，如果这并不是想要的权限，那么还需要增加额外的一层 `RUN` 进行权限调整
  * 如果下载的是个压缩包，需要解压缩，也一样还需要额外的一层 `RUN` 指令进行解压缩
  * 所以不如直接使用 `RUN` 指令，然后使用 `wget` 或者 `curl` 工具下载，处理权限、解压缩、然后清理无用文件更合理
* 如果 `<源路径>` 为一个 `tar` 压缩文件的话，压缩格式为 `gzip`, `bzip2` 以及 `xz` 的情况下，`ADD` 指令将会自动解压缩这个压缩文件到 `<目标路径>` 去

> 在 `COPY` 和 `ADD` 指令中选择的时候，可以遵循这样的原则: 所有的文件复制均使用 `COPY` 指令，仅在需要自动解压缩的场合使用 `ADD`

### CMD

> `CMD` 指令就是用于指定默认的容器主进程的启动命令的

```dockerfile
# shell格式
CMD <command>
# exec格式,推荐格式
CMD ["executable", "param1", "param2"...]
# 作为ENTRYPOINT的默认参数
CMD ["param1", "param2"]
```

>  一个Dockerfile中只能有一条CMD，如果有多条只有最后一条起效果

```dockerfile
# 如果使用 `shell` 格式的话，实际的命令会被包装为 `sh -c` 的参数的形式进行执行
CMD echo $HOME
# 实际执行的是:
CMD [ "sh", "-c", "echo $HOME" ]
# 如果不希望命令被在shell中执行,必须使用exec格式
```

### ENTRYPOINT

```dockerfile
# shell格式
ENTRYPOINT command param1 param2
# exec格式
ENTRYPOINT ["executable", "param1", "param2"]
```

`ENTRYPOINT` 的目的和 `CMD` 一样，都是在指定容器启动程序及参数。`ENTRYPOINT` 在运行时也可以替代，不过比 `CMD` 要略显繁琐，需要通过 `docker run` 的参数 `--entrypoint` 来覆盖

> 一个Dockerfile中只能有一条ENTRYPOINT，如果有多条只有最后一条起效果

当指定了 `ENTRYPOINT` 后，`CMD` 的含义就发生了改变，不再是直接的运行其命令，而是将 `CMD` 的内容作为参数传给 `ENTRYPOINT` 指令

如果用户尝试传入一条命令，它将会作为参数被传给 `ENTRYPOINT` ，然后取代在CMD指令部分定义的默认值

### ENV

> 设置环境变量，在Dockerfile的后续代码或者容器运行时使用

```dockerfile
ENV <key> <value>
# 或者 
ENV <key1>=<value1> <key2>=<value2>...
```

下列指令可以支持环境变量展开： `ADD`、`COPY`、`ENV`、`EXPOSE`、`FROM`、`LABEL`、`USER`、`WORKDIR`、`VOLUME`、`STOPSIGNAL`、`ONBUILD`、`RUN`

### ARG

```dockerfile
ARG <name>[=<default value>]
```

> 定义参数名称，以及定义其默认值。
>
> 该默认值可以在构建命令 `docker build` 中用 `--build-arg <参数名>=<值>` 来覆盖

与`ENV`的不同:`ARG` 所设置的构建环境的环境变量，在将来容器运行时是不会存在的。

但是不要因此就使用 `ARG` 保存密码之类的信息，因为 `docker history` 还是可以看到所有值的。

### VOLUME

```dockerfile
VOLUME ["<路径1>", "<路径2>"...]
VOLUME <路径1> <路径2>...
```

通过VOLUME挂载的卷可以供其他容器使用

### EXPOSE

> 声明容器运行时提供服务的端口，这只是一个声明，在容器运行时并不会因为这个声明应用就会开启这个端口的服务

```dockerfile
EXPOSE <port> [<port>/<protocol>...]
```

 `EXPOSE` 和在运行时使用 `-p <宿主端口>:<容器端口>`的 区分:

* `-p`是映射宿主端口和容器端口，换句话说，就是将容器的对应端口服务公开给外界访问
*  `EXPOSE` 仅仅是声明容器打算使用什么端口而已，并不会自动在宿主进行端口映射(`docker run -P` 时，会自动随机映射 `EXPOSE` 的端口)

可以指定是监听端口是TCP还是UDP, 默认是TCP

```dockerfile
EXPOSE 80/udp

# 同时暴露TCP和UDP
EXPOSE 80/tcp
EXPOSE 80/udp
```

### WORKDIR

> 指定工作目录（或者称为当前目录），以后各层的当前目录就被改为指定的目录，如该目录不存在，`WORKDIR` 会创建目录

```dockerfile
WORKDIR /path/to/workdir
```

可以使用绝对路径或者相对路径

如果使用相对路径,那么切换的路径基于之前的WORKDIR, 设置之后的所有操作都将在这个目录下完成

```dockerfile
WORKDIR /a
WORKDIR b
WORKDIR c

# 工作目录为/a/b/c
RUN pwd
```

### USER

```dockerfile
USER <用户名>[:<用户组>]
USER <UID>[:<GID>]
```

`USER` 指令和 `WORKDIR` 相似，都是改变环境状态并影响以后的层。

`WORKDIR` 是改变工作目录，`USER` 则是改变之后层的执行 `RUN`, `CMD` 以及 `ENTRYPOINT` 这类命令的身份。

注意，`USER` 只是切换到指定用户而已，这个用户必须是事先建立好的，否则无法切换。

### HEALTHCHECK

> 告诉 Docker 应该如何进行判断容器的状态是否正常

```dockerfile
# 设置检查容器健康状况的命令
HEALTHCHECK [选项] CMD <命令>
# 如果基础镜像有健康检查指令，使用这行可以屏蔽掉其健康检查指令
HEALTHCHECK NONE

# 选项:
# --interval=<间隔>：两次健康检查的间隔，默认为 30 秒
# --timeout=<时长>：健康检查命令运行超时时间，如果超过这个时间，本次健康检查就被视为失败，默认 30 秒
# --retries=<次数>：当连续失败指定次数后，则将容器状态视为 unhealthy，默认 3 次
```

> 和 `CMD`, `ENTRYPOINT` 一样，`HEALTHCHECK` 只可以出现一次，如果写了多个，只有最后一个生效

### ONBUILD

```dockerfile
ONBUILD <其它指令>
```

`ONBUILD` 是一个特殊的指令，它后面跟的是其它指令，比如 `RUN`, `COPY` 等，而这些指令，在当前镜像构建时并不会被执行。只有当以当前镜像为基础镜像，去构建下一级镜像的时候才会被执行。

### LABEL

> 给镜像以键值对的形式添加一些元数据（metadata）

```dockerfile
LABEL <key>=<value> <key>=<value> ...

# 如果有空格,用引号括住
LABEL com.example.label-with-value="foo bar"
# 跨行
LABEL description="This text illustrates \
that label-values can span multiple lines."

# 多个LABEL的两种格式
LABEL multi.label1="value1" multi.label2="value2" other="value3"
LABEL multi.label1="value1" \
      multi.label2="value2" \
      other="value3"
```

查看容器的元数据:

```bash
docker image inspect --format='' myimage
```

### SHELL

> 指定 `RUN` `ENTRYPOINT` `CMD` 指令的 shell

```dockerfile
SHELL ["executable", "parameters"]
```

## 构建

```bash
docker build [选项] <上下文路径 | URL>

# 常见选项:
#    --build-arg: 设置构建时的变量
#    --no-cache: 默认false, 设置该选项则不使用Build Cache构建镜像
#    --pull: 默认false, 设置该选项则总是尝试pull镜像的最新版本
#    --compress: 默认false, 设置该选项则使用gzip压缩构建的上下文
#    --disable-content-trust: 默认true, 设置该选项则使用gzip压缩构建的上下文
#    --file, -f: Dockerfile的完整路径,默认值为"PATH/Dockerfile"
#    --isolation: 默认`--isolation="default"`,即Linux命名空间; 别的选项还有`process`和`hyperv`
#    --label: 为生成的镜像设置metadata
#    --squash: 默认false,设置该选项则将构建出的多个层压缩为一个新层,但是将无法在多个镜像之间共享新层(实质上是创建了新的image同时保留原有的image)
#    --tag, -t: 镜像的名字及tag,通常为`name:tag`或者`name`格式;可以在一次构建中使用多个`-t`设置多个tag
#    --network: 在构建过程中为RUN指令设置网络模式
#    --quiet, -q: 默认false, 设置该选项则不输出编译过程,构建成功时输出镜像ID
#    --force-rm: 默认false, 设置该选项则总是删除中间环节的容器
#    --rm: 默认true, 即构建成功后删除中间环节的容器

docker build http://server/context.tar.gz # 用给定的tar压缩包构建
docker build - < Dockerfile # 从标准输入中读取Dockerfile
cat Dockerfile | docker build -
```

## 导入导出

```shell
docker save [选项] 镜像 [镜像..]
# -o, --output="" 导出到文件
docker save python > python.tar
docker save -o python.tar python

docker load [选项]
# -i, --input="" -> 从文件导入
# -q, --quiet -> 不显示导入进度,导入成功后输出信息
docker load < python.tar
docker load -i python.tar
```

# 操作容器

## 启动与终止

```bash
docker run ubuntu:18.04 /bin/echo 'Hello world'

docker run -t -i ubuntu:18.04 /bin/bash
# -t, --tty -> Docker分配一个伪终端（pseudo-tty）并绑定到容器的标准输入上
# -i, --interactive -> 让容器的标准输入保持打开

docker run -d ubuntu:18.04 /bin/sh -c "while true; do echo hello world; sleep 1; done"
# -d, --detach -> 以detach模式运行
# 用`docker [container] logs [container ID | NAMES]`查看输出

docker [container] start [container ID | NAMES] # 启动已终止的容器
docker [container] stop [container ID | NAMES] # 中止运行中的容器
docker [container] restart [container ID | NAMES] # 重启运行中的容器
docker [container] pause [container ID | NAMES] # 挂起运行中的容器
docker [container] unpause [container ID | NAMES] # 恢复挂起的容器
# 只启动一个终端的容器可以用`exit`或者`Ctrl+d`来退出
```

> `docker run`和`docker container run`等价

| 命令        | 默认信号 | 默认信号值 |
| ----------- | -------- | ---------- |
| kill        | TERM     | 15         |
| docker kill | KILL     | 9          |
| docker stop | TERM     | 15         |

## 列出

```bash
docker container ls [选项]
# 常用选项
# -a, --all -> 全部容器(默认只列出运行状态的)
# -f, --filter -> 过滤
# -q, --quiet -> 只显示容器ID
# -n, --last -> 最近生成的N个
```

## 进入容器

```bash
docker exec -it <container ID | NAMES>
# 只用 -i 参数时，由于没有分配伪终端，界面没有我们熟悉的 Linux 命令提示符，但命令执行结果仍然可以返回
# 当 -i -t 参数一起使用时，则可以看到我们熟悉的 Linux 命令提示符

docker container attach <container ID | NAMES>
# exec与attach的区别:
# 	`Ctrl+C`后exec退出后不会导致容器的停止而attach会
# 	如果在attach的情况下不停止容器的运行需要 `Ctrl+P`+`Ctrl+Q`
```

## 文件复制

```bash
docker cp <container ID:path | NAMES:path> <localPath>
docker cp <localPath> <container ID:path | NAMES:path>
```

## 导出和导入

```bash
docker export [container ID | NAMES] -o <tarFileName>
docker export [container ID | NAMES] > [tarFileName] # 重定向

docker import < tarFileName | URL | - > [REPOSITORY[:TAG]]
```

用户既可以使用*`docker load`* 来导入镜像存储文件到本地镜像库，也可以使用 *`docker import`* 来导入一个容器快照到本地镜像库。这两者的区别在于容器快照文件将丢弃所有的历史记录和元数据信息（即仅保存容器当时的快照状态），而镜像存储文件将保存完整记录，体积也要大。此外，从容器快照文件导入时可以重新指定标签等元数据信息

## 检视与查看

```bash
docker inspect <container ID | NAMES> # 以JSON格式访问Docker的内部元数据,包括容器的IP地址
docker inspect <container ID | NAMES> | head # 使用管道过滤
# 镜像和容器的元数据有所不同,例如:容器将具有镜像缺乏（一个镜像是无状态的）的运行时字段，如“State”

docker diff <container ID | NAMES> # 查看容器内的文件变化(容器和镜像的文件系统)
docker logs <container ID | NAMES>
docker stats <container ID | NAMES> # 动态显示容器资源消耗
docker port <container ID | NAMES> # 列出容器的端口和宿主机的映射
docker top <container ID | NAMES>

docker events # 输出docker服务的事件(容器的启动/停止/关闭)

docker container ls [-a]

docker container logs <container ID | NAMES> [-t | --tail <line number>] [-f | --follow]
```

## 删除

```bash
docker [container] rm [-f] <container ID | NAMES> # 容器处于运行状态时需要force

docker container prune # 清理所有终止的容器
```

# Docker Machine

使用Docker Machine是管理远程机器上Docker安装的官方解决方案

> Docker Machine主要是一个便利程序。它将大量配置外部宿主机的指令包装起来，然后将它们转换为一些易于上手使用的命令

```bash
docker-machine create --driver virtualbox host1
# 使用docker-machine的`create`子命令来创建新的宿主机,并通过`--driver`标志来指定它的类型,宿主机被命名为`host1`

$(docker-machine env host1) # 设置`DOCKER_HOST`环境变量,这会设置Docker命令运行时默认的宿主机
```

## 子命令

| 子命令  | 行为                              |
| ------- | --------------------------------- |
| create  | 创建一台新的机器                  |
| ls      | 列出Docker宿主机                  |
| stop    | 停止机器                          |
| start   | 启动机器                          |
| restart | 重启机器                          |
| rm      | 销毁一台机器                      |
| kill    | "杀死"一台机器                    |
| inspect | 以JSON格式返回机器的元数据        |
| config  | 返回连接机器所需的配置信息        |
| ip      | 返回一台机器的IP地址              |
| url     | 返回一台机器上Docker守护进程的URL |
| upgrade | 将宿主机上的Docker升级到最新版本  |

# 数据管理

## 数据卷

* 数据卷 可以在容器之间共享和重用

* 对 数据卷 的修改会立马生效

* 对 数据卷 的更新，不会影响镜像

* 数据卷 默认会一直存在，即使容器被删除

  ```bash
  docker volume create my-vol #创建
  docker volume ls # 列举
  docker volume inspect my-vol # 查看
  docker volume rm my-vol # 删除
  docker volume prune # 清理
  ```

## 挂载主机目录

> 使用 `--mount` 标记可以指定挂载一个本地主机的目录或者文件到容器中去

```bash
docker run -d -P \
    --name web \
    # -v /src/webapp:/usr/share/nginx/html:ro \
    --mount type=bind,source=/src/webapp,target=/usr/share/nginx/html,readonly \
    nginx:alpine
```

# 使用网络

## 外部访问容器

* `-P`:随机映射一个端口到内部容器开放的网络端口
* `-p`
  * 指定要映射的端口,一个指定端口只能绑定一个容器
  * `hostPort:containerPort` -> `docker run -d -p 80:80 nginx:alpine`
  * `ip:hostPort:containerPort` -> `docker run -d -p 127.0.0.1:80:80 nginx:alpine`
  * `ip::containerPort` -> `docker run -d -p 127.0.0.1::80 nginx:alpine`(本地主机自动分配一个端口)
  * 可以多次使用来绑定多个端口
* 使用`docker port`或者`docker inspect`查看端口配置
* 容器有自己的内部网络和IP地址

## 容器访问外部

容器要想访问外部网络，需要本地系统的转发支持

```bash
sysctl net.ipv4.ip_forward # 在Linux 系统中，检查转发是否打开
# net.ipv4.ip_forward = 1
```

如果为 0，说明没有开启转发，则需要手动打开

```bash
sysctl -w net.ipv4.ip_forward=1
```

## 网络互联

```bash
docker network create -d bridge my-net
# 创建
# -d 指定网络类型, 有bridge, overlay(用于Swarm模式)

docker run -it --rm --name busybox1 --network my-net busybox sh
docker run -it --rm --name busybox2 --network my-net busybox sh
# 加入


docker network connect
docker network disconnect
docker network inspect
docker network ls
docker network rm
docker network prune
```

# Docker Compose

> `Compose` 定位是 「定义和运行多个 Docker 容器的应用（Defining and running multi-container Docker applications）」

`Compose` 中有两个重要的概念：

- 服务 (`service`)：一个应用的容器，实际上可以包括若干运行相同镜像的容器实例。
- 项目 (`project`)：由一组关联的应用容器组成的一个完整业务单元

> `docker-compose`命令使用Python编写
>
> `docker compose`命令使用Go重写,作为docker cli的子命令,成为`Compose V2`
>
> [Compose V2 beta | Docker Documentation](https://docs.docker.com/compose/cli-command/)

## 命令

```bash
docker-compose [-f=<arg>...] [options] [COMMAND] [ARGS...]
```



## Compose模板文件

```yaml
version: '3'
services:

  webapp:
    build:
      context: ./dir
      cache_from:
      	- alpine:latest
      	- corp/web_app:3.14
      dockerfile: Dockerfile-alternate
      args:
        buildno: 1
    depends_on:
    	- db
       
  db:
  	image: "mongo:${MONGO_VERSION}" # 支持读取变量
  	
dns: 8.8.8.8

dns:
  - 8.8.8.8
  - 114.114.114.114
  
env_file: .env

env_file:
  - ./common.env
  - ./apps/web.env
  - /opt/secrets.env 
  
environment:
  RACK_ENV: development
  SESSION_SECRET:

environment:
  - RACK_ENV=development
  - SESSION_SECRET
  
expose:
 - "3000"
 - "8000"
 
mysql:
  image: mysql
  environment:
    MYSQL_ROOT_PASSWORD_FILE: /run/secrets/db_root_password
  secrets:
    - db_root_password
    - my_other_secret

secrets:
  my_secret:
    file: ./my_secret.txt
  my_other_secret:
    external: true
    
volumes:
 - /var/lib/mysql
 - cache/:/tmp/cache
 - ~/configs:/etc/configs/:ro
 
entrypoint: /code/entrypoint.sh
user:ngix
working_dir: /code
domainname: my_website.com
hostname: test
mac_address: 08-00-27-00-0C-0A
privileged: true
restart: always
read_only: true
stdin_open: true
tty: true # TeleTYpewriter
```

# 技巧

## 向世界开放Docker守护进程

> 默认的Docker配置,限制只能通过`/var/run/docker.sock`域套接字访问,宿主机外的进程无法获取Docker的访问权限

```bash
systemctl stop docker 
sudo docker daemon -H tcp://0.0.0.0:2375
docker -H tcp://<宿主机IP>:2375 <subcommand>
```

