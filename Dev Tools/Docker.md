## 基础

### 用途

* Docker为软件行业所做的尝试正是集装箱化为航运行业所做的：通过标准化减少本地差异的成本。
* Docker的用处包括了软件原型、软件打包、减少测试和调试环境成本以及启用DevOps实践，例如持续交付（continuous delivery，CD）。

### 镜像

* **Docker 镜像** 是一个特殊的文件系统，除了提供容器运行时所需的程序、库、资源、配置等文件外，还包含了一些为运行时准备的一些配置参数（如匿名卷、环境变量、用户等）。镜像 **不包含** 任何动态数据，其内容在构建之后也不会被改变。
* Docker镜像是运行容器的模板。这与程序可执行文件与运行进程的差异类似。运行中的容器的变更可以作为新的镜像进行提交并打标签。
* 镜像创建自分层文件系统，减少了Docker镜像在宿主机上的空间占用
* 镜像构建时，会一层层构建，前一层是后一层的基础。每一层构建完就不会再发生改变，后一层上的任何改变只发生在自己这一层。

### 容器

* Docker容器和虚拟机之间一个关键的区别就是，容器是被设计成运行单个进程的
* 容器的实质是被namespace和Cgroup限制的**进程**
* 与直接在宿主执行的进程不同，容器进程运行于属于自己的独立的 命名空间。因此容器可以拥有自己的 root 文件系统、自己的网络配置、自己的进程空间，甚至自己的用户 ID 空间
* 每一个容器运行时，是以镜像为基础层，在其上创建一个当前容器的存储层

### 仓库

* 通过 `<仓库名>:<标签>` 的格式来指定具体是这个软件哪个版本的镜像, 如果不给出标签，将以 `latest` 作为默认标签
* [Docker Hub](https://hub.docker.com/)
* [Repositories · Quay](https://quay.io/repository/)
* [Google Container Registry  | Google Cloud](https://cloud.google.com/container-registry/)

### 最佳实现

* 在Docker的世界里，公认的最佳实践是尽可能多地把系统拆分开，直到在每个容器上都只运行一个“服务”，并且所有容器都通过网络互相连通
* 容器不应该向其存储层内写入任何数据，容器存储层要保持无状态化。所有的文件写入操作，都应该使用 数据卷（Volume）、或者 绑定宿主目录，在这些位置的读写会跳过容器存储层，直接对宿主（或网络存储）发生读写，其性能和稳定性更高。
* 尽可能使用`COPY`而不是`ADD`,因为语义明确

### 原理

* 安装Docker后获得两大组件:客户端(client)和守护进程(deamon, 有时也叫引擎)
* 通过`docker version`可以确定两者的版本
* Docker守护进程是用户与Docker交互的枢纽,其使用HTTP协议接收来自Docker客户端的请求并返回响应

## 使用镜像

### 查找

```bash
docker search <镜像名> [-f starts=100]
```

### 获取

```bash
docker pull [选项] [<域名/IP>[:端口号]/]仓库名[:标签]
```

### 列出

```shell
docker images
docker image list
docker image ls

docker system df # 查看镜像,容器,数据卷所占空间

docker image ls -f dangling=true # 列出虚悬镜像
docker image prune # 删除虚悬镜像

docker image ls -a # 列出中间层镜像

docker image ls [仓库名] | [仓库名:标签]
# --filter 缩写为 -f
docker image ls --filter [since | before | label=]

docker image ls --format "{{.ID}}: {{.Repository}}"
```

### 检视

```bash
docker image inspect <镜像ID或镜像名>

docker history <镜像ID或镜像名> # 查看构建层的详细
```

### 删除

```shell
docker image rm [选项] <镜像1> [<镜像2> ...]
docker rmi [选项] <镜像1> [<镜像2> ...]
# <镜像> 可以是 镜像短 ID、镜像长 ID、镜像名 或者 镜像摘要

docker image rm $(docker image ls -q -f before=mongo:3.2) # 配合ls
```

### 保存容器为镜像

```shell
docker commit [选项] <容器ID或容器名> [<仓库名>[:<标签>]]
```

### 利用DockerFile定制

```dockerfile
FROM <image>[:<tag>]

RUN <command>
# 或者 RUN ["exec", "par1", "par2"]

CMD <command> <par1> <par2> ...
# 或者 CMD ["exec", "par1", "par2"]

ENTRYPOINT command par1 par2
# 或者 ENTRYPOINT ["exec", "par1", "par2"]
# ENTRYPOINT 的目的和 CMD 一样，都是在指定容器启动程序及参数。
# 一个Dockerfile中只有一条CMD和ENTRYPOINT，如果有多条只执行最后一条

COPY [--chown=<user>:<group>] ["<src1>",... "<dst>"]
ADD [--chown=<user>:<group>] <src> <dest> # src可以是URL或者tar文件(tar文件会自动解压为文件目录)

ENV <key> <value>
# 或者 ENV <key1>=<value1> <key2>=<value2>...
# 在Dockerfile的后续代码或者容器运行时使用

ARG <参数名>[=<默认值>]
# 与ENV不同,ARG所设置的构建环境的环境变量，在将来容器运行时是不存在的

VOLUME [path]
# 通过VOLUME挂载的卷可以供其他容器使用

EXPOSE <port>
# 声明容器运行时提供服务的端口
# 这只是一个声明，在容器运行时并不会因为这个声明应用就会开启这个端口的服务

WORKDIR [path]
# 可以使用绝对路径或者相对路径
# 如果使用相对路径,那么切换的路径基于之前的WORKDIR
# 设置之后的所有操作都将在这个目录下完成

USER <用户名>[:<用户组>]
# 和 WORKDIR 相似，都是改变环境状态并影响以后的层
# WORKDIR 是改变工作目录
# USER 则是改变之后层的执行 RUN, CMD 以及 ENTRYPOINT 这类命令的身份

HEALTHCHECK [选项] <命令>
# --interval=<间隔>：两次健康检查的间隔，默认为 30 秒
# --timeout=<时长>：健康检查命令运行超时时间，如果超过这个时间，本次健康检查就被视为失败，默认 30 秒
# --retries=<次数>：当连续失败指定次数后，则将容器状态视为 unhealthy，默认 3 次

ONBUILD <其它指令>
# ONBUILD 是一个特殊的指令，它后面跟的是其它指令
# 而这些指令，在当前镜像构建时并不会被执行
# 只有当以当前镜像为基础镜像，去构建下一级镜像的时候才会被执行

LABEL <key>=<value> <key>=<value> ...
# 给镜像以键值对的形式添加一些元数据（metadata）
```

* [Dockerfile reference | Docker Documentation](https://docs.docker.com/engine/reference/builder/)
* [Best practices for writing Dockerfiles | Docker Documentation](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
* [ Documentation for Docker Official Images in docker-library (github.com)](https://github.com/docker-library/docs)

### 构建

```shell
docker build [选项] <上下文路径/URL>

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
#    --tag, -t: 镜像的名字及tag,通常为`name:tag`或者`name`格式;可以在一次构建中为一个镜像设置多个tag
#    --network: 在构建过程中为RUN指令设置网络模式
#    --quiet, -q: 默认false, 设置该选项则不输出编译过程,构建成功时输出镜像ID
#    --force-rm: 默认false, 设置该选项则总是删除中间环节的容器
#    --rm: 默认true, 即构建成功后删除中间环节的容器
```

### 导入导出

```shell
docker save
docker load
```

## 操作容器

### 启动与终止

```bash
docker run ubuntu:18.04 /bin/echo 'Hello world'

docker run -t -i ubuntu:18.04 /bin/bash
# -t 选项让Docker分配一个伪终端（pseudo-tty）并绑定到容器的标准输入上
# -i 让容器的标准输入保持打开

docker run -d ubuntu:18.04 /bin/sh -c "while true; do echo hello world; sleep 1; done"
# -d 以deamon状态运行
# 用`docker container logs [container ID/nameS]`查看输出

docker [container] start [container ID/nameS] # 启动已终止的容器
docker [container] stop [container ID/nameS] # 中止运行中的容器
docker [container] restart [container ID/nameS] # 重启运行中的容器
docker [container] pause [container ID/nameS] # 挂起运行中的容器
docker [container] unpause [container ID/nameS] # 恢复挂起的容器
# 只启动一个终端的容器可以用`exit`或者`Ctrl+d`来退出
```

> `docker run`和`docker container run`等价

| 命令        | 默认信号 | 默认信号值 |
| ----------- | -------- | ---------- |
| kill        | TERM     | 15         |
| docker kill | KILL     | 9          |
| docker stop | TERM     | 15         |

### 进入容器

```bash
docker exec -it <container ID/name>
# 只用 -i 参数时，由于没有分配伪终端，界面没有我们熟悉的 Linux 命令提示符，但命令执行结果仍然可以返回
# 当 -i -t 参数一起使用时，则可以看到我们熟悉的 Linux 命令提示符

docker container attach <container ID/name>
# exec与attach的区别:
# 	`Ctrl+C`后exec退出后不会导致容器的停止而attach会
# 	如果在attach的情况下不停止容器的运行需要`Ctrl+P+Ctrl+Q`
```

### 文件复制

```bash
docker cp <container ID/name:path> <localPath>
docker cp <localPath> <container ID/name:path>
```

### 导出和导入

```bash
docker export [container ID/name] -o <tarFileName>
docker export [container ID/name] > [tarFileName] # 重定向

docker import [tarFileName] [container ID/name]
```

### 检视与查看

```bash
docker inspect <container ID/name> # 以JSON格式访问Docker的内部元数据,包括容器的IP地址
docker inspect <container ID/name> | head # 使用管道过滤
# 镜像和容器的元数据有所不同,例如:容器将具有镜像缺乏（一个镜像是无状态的）的运行时字段，如“State”

docker diff <container ID/name> # 查看容器内的文件变化(容器和镜像的文件系统)
docker logs <container ID/name>
docker stats <container ID/name> # 动态显示容器资源消耗
docker port <container ID/name> # 列出容器的端口和宿主机的映射
docker top <container ID/name>

docker events # 输出docker服务的事件(容器的启动/停止/关闭)

docker container ls [-a]

docker container logs <container ID/name> [-t | --tail <line number>] [-f | --follow]
```

### 删除

```bash
docker [container] rm [-f] <container ID/nameS> # 容器处于运行状态时需要force

docker container prune # 清理所有终止的容器
```

## Docker Machine

使用Docker Machine是管理远程机器上Docker安装的官方解决方案

> Docker Machine主要是一个便利程序。它将大量配置外部宿主机的指令包装起来，然后将它们转换为一些易于上手使用的命令

```bash
docker-machine create --driver virtualbox host1
# 使用docker-machine的`create`子命令来创建新的宿主机,并通过`--driver`标志来指定它的类型,宿主机被命名为`host1`

$(docker-machine env host1) # 设置`DOCKER_HOST`环境变量,这会设置Docker命令运行时默认的宿主机
```

### 子命令

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

## 数据管理

### 数据卷

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

### 挂载主机目录

```bash
docker run -d -P \
    --name web \
    # -v /src/webapp:/usr/share/nginx/html:ro \
    --mount type=bind,source=/src/webapp,target=/usr/share/nginx/html,readonly \
    nginx:alpine
```

## 使用网络

### 外部访问容器

* `-P`:随机映射一个端口到内部容器开放的网络端口
* `-p`
  * 指定要映射的端口,一个指定端口只能绑定一个容器
  * `hostPort:containerPort`:`docker run -d -p 80:80 nginx:alpine`
  * `ip:hostPort:containerPort`:`docker run -d -p 127.0.0.1:80:80 nginx:alpine`
  * `ip::containerPort`:`docker run -d -p 127.0.0.1::80 nginx:alpine`(本地主机自动分配一个端口)
* 使用`docker port`或者`docker inspect`查看端口配置

### 网络互联

```bash
docker network create -d bridge my-net
# 创建
# -d 指定网络类型

docker run -it --rm --name busybox1 --network my-net busybox sh
# 加入
```

## Docker Compose

> `Compose` 定位是 「定义和运行多个 Docker 容器的应用（Defining and running multi-container Docker applications）」

`Compose` 中有两个重要的概念：

- 服务 (`service`)：一个应用的容器，实际上可以包括若干运行相同镜像的容器实例。
- 项目 (`project`)：由一组关联的应用容器组成的一个完整业务单元

> `docker-compose`命令使用Python编写
>
> `docker compose`命令使用Go重写,作为docker cli的子命令,成为`Compose V2`
>
> [Compose V2 beta | Docker Documentation](https://docs.docker.com/compose/cli-command/)

### 命令

```bash
docker-compose [-f=<arg>...] [options] [COMMAND] [ARGS...]
```

### Compose模板文件

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

## 技巧

### 向世界开放Docker守护进程

> 默认的Docker配置,限制只能通过`/var/run/docker.sock`域套接字访问,宿主机外的进程无法获取Docker的访问权限

```bash
systemctl stop docker 
sudo docker daemon -H tcp://0.0.0.0:2375
docker -H tcp://<宿主机IP>:2375 <subcommand>
```

