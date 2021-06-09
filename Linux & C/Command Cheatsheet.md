# Linux速查备忘

## 关机/重启/注销

| 常用命令            | 作用                     |
| :------------------ | :----------------------- |
| `shutdown -h now`   | 立刻关机                 |
| `shutdown -h 10`    | 10分钟后关机             |
| `shutdown -h 11:00` | 11:00关机                |
| `shutdown -h +10`   | 预定时间关机（10分钟后） |
| `shutdown -c`       | 取消指定时间关机         |
| `shutdown -r now`   | 重启                     |
| `shutdown -r 10`    | 10分钟后重启             |
| `shutdown -r 11:00` | 定时重启                 |
| `reboot`            | 重启                     |
| `init 6`            | 重启                     |
| `init 0`            | 立刻关机                 |
| `telinit 0`         | 关机                     |
| `poweroff`          | 立刻关机                 |
| `halt`              | 关机                     |
| `sync`              | buff数据同步到磁盘       |
| `logout`            | 退出登录Shell            |

## 系统信息和性能查看

| 常用命令                     | 作用                              |
| :--------------------------- | :-------------------------------- |
| `uname -a`                   | 查看内核/OS/CPU信息               |
| `uname -r`                   | 查看内核版本                      |
| `uname -m`                   | 查看处理器架构                    |
| `arch`                       | 查看处理器架构                    |
| `hostname`                   | 查看计算机名                      |
| `who`                        | 显示当前登录系统的用户            |
| `who am i`                   | 显示登录时的用户名                |
| `whoami`                     | 显示当前用户名                    |
| `cat/proc/version`           | 查看linux版本信息                 |
| `cat/proc/cpuinfo`           | 查看CPU信息                       |
| `cat/proc/interrupts`        | 查看中断                          |
| `cat/proc/loadavg`           | 查看系统负载                      |
| `uptime`                     | 查看系统运行时间、用户数、负载    |
| `env`                        | 查看系统的环境变量                |
| `lsusb -tv`                  | 查看系统USB设备信息               |
| `lspci -tv`                  | 查看系统PCI设备信息               |
| `lsmod`                      | 查看已加载的系统模块              |
| `uptime`                     | 查看系统运行时间、用户数、负载    |
| `grep MemTotal/proc/meminfo` | 查看内存总量                      |
| `grep MemFree/proc/meminfo`  | 查看空闲内存量                    |
| `free -m`                    | 查看内存总量和交换区用量          |
| `date`                       | 显示系统日期时间                  |
| `cal 2021`                   | 显示2021日历                      |
| `top`                        | 动态显示cpu/内存/进程等情况       |
| `vmstat 1 20`                | 每1秒采集一次系统状态，采20次     |
| `iostat`                     | 查看io读写/cpu使用情况            |
| `sar -u 1 10`                | 查询cpu使用情况（1秒1次，共10次） |
| `sar -d 1 10`                | 查询磁盘性能（1秒1次，共10次）    |

## 磁盘和分区

| 常用命令                              | 作用                           |
| :------------------------------------ | :----------------------------- |
| `fdisk -l`                            | 查看所有磁盘分区               |
| `swapon -s`                           | 查看所有交换分区               |
| `df -h`                               | 查看磁盘使用情况及挂载点       |
| `du -sh /dir`                         | 查看指定目录大小               |
| `du -sk * ｜ sort -rn`                | 从高到低显示文件和目录大小     |
| `mount /dev/hda2 /mnt/had2`           | 挂载hda2盘                     |
| `mount -t ntfs /dev/sdc1 /mnt/usbhd1` | 指定文件系统类型挂载（如ntfs） |
| `mount -o loop xxx.iso /mnt/cdrom`    | 挂载ISO文件                    |
| `mount /dev/sda1 /mnt/usbdisk`        | 挂载usb盘/闪存设备             |
| `umount -v /dev/sda1`                 | 通过设备名卸载                 |
| `umount -v /mnt/mymnt`                | 通过挂载点卸载                 |
| `fuser -km /mnt/hda1`                 | 强制卸载（慎用）               |

## 用户和用户组

| 常用命令                                            | 作用                                  |
| :-------------------------------------------------- | :------------------------------------ |
| `useradd xxx`                                       | 创建用户                              |
| `userdel -r xxx`                                    | 删除用户                              |
| `usermod -g group_name user_name`                   | 修改用户所在组                        |
| `usermod -aG group_name user_name`                  | 将用户添加到组                        |
| `usermod -s /bin/zsh -d /home/xxx -g dev user_name` | 修改用户的登录shell、主目录以及用户组 |
| `groups test`                                       | 查看test用户所在组                    |
| `groupadd group_name`                               | 创建用户组                            |
| `groupdel group_name`                               | 删除用户组                            |
| `groupmod -n new_name old_name`                     | 重命名用户组                          |
| `su - user_name`                                    | 完整切换到一个用户环境                |
| `passwd`                                            | 修改口令                              |
| `passwd user_name`                                  | 查看指定用户的口令                    |
| `w`                                                 | 查看活动用户                          |
| `id user_name`                                      | 查看指定用户信息                      |
| `last`                                              | 查看用户登录日志                      |
| `crontab -l`                                        | 查看当前用户的计划任务                |
| `cut -d: -f1 /etc/passwd`                           | 查看系统所有用户                      |
| `cut -d: -f1 /ect/gropu`                            | 查看系统所有组                        |

## 网络与进程管理

| 常用命令                                                       | 作用                                |
| :------------------------------------------------------------- | :---------------------------------- |
| `ifconfig`                                                     | 查看网络接口属性                    |
| `ifconfig eth0`                                                | 查看某网卡的配置                    |
| `ifconfig eth0 ip_address netmask mask_address`                | 配置IP地址                          |
| `route -n`                                                     | 查看路由表                          |
| `netstat -lntp`                                                | 查看所有监听端口                    |
| `netstat -antp`                                                | 查看已经建立的TCP连接               |
| `netstat -lutp`                                                | 查看TCP/UDP的状态信息               |
| `ifup eth0`                                                    | 启用eth0网络设备                    |
| `ifdown eth0`                                                  | 禁用eth0网络设备                    |
| `iptables -L`                                                  | 查看iptables规则                    |
| `dhclient eth0`                                                | 以dhcp模式启用eth0                  |
| `route add -net 0/0 gw Gateway_IP`                             | 配置默认网关                        |
| `route add -net ip_address netmask mask_address gw Gateway_IP` | 配置静态路由                        |
| `route del 0/0 gw Gateway_IP`                                  | 删除静态路由                        |
| `hostname`                                                     | 查看主机名                          |
| `host URL`                                                     | 解析主机名                          |
| `nslookup URL`                                                 | 查询DNS记录，查看域名解析是否正常   |
| `ps -ef`                                                       | 查看所有进程                        |
| `ps -ef ｜ grep process_name`                                  | 过滤需要的进程                      |
| `kill -s process_name`                                         | kill指定名称的进程                  |
| `kill -s pid`                                                  | kill指定pid的进程                   |
| `top`                                                          | 实时显示进程状态                    |
| `vmstat 1 20`                                                  | 每1秒采集一次系统状态，共采20次     |
| `iostat`                                                       | 查看io读写/cpu使用情况              |
| `sar -u 1 10`                                                  | 查询cpu使用情况（1秒一次一共十次）  |
| `sar -d 1 10`                                                  | 查询磁盘使用情况（1秒一次一共十次） |

## 常见系统服务命令

| 常用命令                           | 作用         |
| :--------------------------------- | :----------- |
| `chkconfig --list`                 | 列出系统服务 |
| `service <service_name> status`    | 查看某个服务 |
| `service <service_name> start`     | 启动某个服务 |
| `service <service_name> stop`      | 终止某个服务 |
| `service <service_name> restart`   | 重启某个服务 |
| `systemctl status <service_name>`  | 查看某个服务 |
| `systemctl start <service_name>`   | 启动某个服务 |
| `systemctl stop <service_name>`    | 终止某个服务 |
| `systemctl restart <service_name>` | 重启某个服务 |
| `systemctl enable <service_name>`  | 开启自启动   |
| `systemctl disable <service_name>` | 关闭自启动   |

## 文件和目录操作

| 常用命令                   | 作用                                                      |
| :------------------------- | :-------------------------------------------------------- |
| `cd <directory>`           | 进入某个目录                                              |
| `cd ..`                    | 进入上级目录                                              |
| `cd ../..`                 | 进入上两级目录                                            |
| `cd`                       | 进入个人主目录                                            |
| `cd -`                     | 返回上一步所在目录                                        |
| `pwd`                      | 显示当前路径                                              |
| `ls`                       | 查看文件目录列表                                          |
| `ls -F`                    | 查看目录中的内容（显示是文件还是目录）                    |
| `ls -l`                    | 查看文件目录列表详情                                      |
| `ls -a`                    | 查看隐藏文件                                              |
| `ls -lh`                   | 查看文件目录列表详情（增强文件大小易读性）                |
| `ls -lSr`                  | 查看文件目录列表（以文件大小升序查看）                    |
| `tree`                     | 查看文件目录树形结构                                      |
| `mkdir <directory_name>`   | 创建目录                                                  |
| `mkdir dir1 dir2`          | 同时创建两个目录                                          |
| `mkdir -p /tmp/dir1/dir2`  | 创建目录树                                                |
| `rm -f file_name`          | 删除文件                                                  |
| `rm -rf dir_name`          | 删除目录及子目录                                          |
| `rmdir dir_name`           | 删除目录                                                  |
| `mv old_dir new_dir`       | 重命名/移动目录                                           |
| `cp file1 file2`           | 复制文件                                                  |
| `cp dir/*`                 | 复制某目录下的所有文件到当前目录                          |
| `cp -a dir1 dir2`          | 复制目录                                                  |
| `cp -a /tmp/dir1`          | 复制一个目录到当前目录                                    |
| `ln file1 link1`           | 创建指向文件/目录的物理链接                               |
| `ln -s file1 link1`        | 创建指向文件/目录的软链接                                 |
| `find / -name file1`       | 从根目录开始搜索文件/目录                                 |
| `find / -user user1`       | 搜索用户user1的文件/目录                                  |
| `find /dir -name *.bin`    | 在目录/dir中搜索有.bin后缀的文件                          |
| `locate <keyword>`         | 快速定位文件                                              |
| `locate *.mp4`             | 寻找以.mp4结尾的文件                                      |
| `whereis <keyword>`        | 显示某二进制文件/可执行文件的路径                         |
| `which <keyword>`          | 查找系统目录下某二进制文件                                |
| `chmod ugo+rwx dir1`       | 设置目录所有者（u）、群组（g）、其他人（o）的读写执行权限 |
| `chmod go-rwx dir1`        | 移除群组（g）、其他人（o）的读写执行权限                  |
| `chmod user1 file1`        | 改变文件的所有者属性                                      |
| `chmod -R user1 dir1`      | 递归改变目录的所有者属性                                  |
| `chgrp group1 file1`       | 改变文件群组                                              |
| `chgrp user1:group1 file1` | 改变文件的所有人和群组                                    |

## 文件查看和处理

| 常用命令                      | 作用                                     |
| :---------------------------- | :--------------------------------------- |
| `cat file_name`               | 查看文件内容                             |
| `cat -n file_name`            | 查看文件内容并标识行数                   |
| `tac file_name`               | 从最后一行倒着查看文件内容               |
| `more file_name`              | 查看一个长文件的内容                     |
| `less file_name`              | 类似more命令，但是允许反向操作           |
| `head -n file_name`           | 查看文件前n行                            |
| `tail -n file_name`           | 查看文件后n行                            |
| `tail -f /log/msg`            | 实时查看添加到文件中的内容               |
| `grep keyword file_name`      | 从文件中搜索关键词                       |
| `grep ^keyword file_name`     | 从文件中搜索以关键词开头的内容           |
| `grep [0-9] file_name`        | 从文件中选择所有包含数字的行             |
| `sed 's/s1/s2/g' file_name`   | 将文件中的s1替换为s2                     |
| `sed '/^$/d' file_name`       | 将文件中空白行删除                       |
| `sed '/*#/d;/^$/d' file_name` | 将文件中空白行和注释删除                 |
| `sed -e '1d' file_name`       | 从文件中排除第一行                       |
| `sed -e 's/s1//g' file_name`  | 从文档中只删除关键词s1并保留其余全部     |
| `sed -n '/s1/p' file_name`    | 查看只包含关键词s1的行                   |
| `sed -n '1,5p;5q' file_name`  | 查看第一行到第五行的内容                 |
| `sed -n '5p;5q' file_name`    | 查看第五行的内容                         |
| `paste file1 file2`           | 合并两个文件或者两栏的内容               |
| `paste -d '+' file1 file2`    | 合并两个文件或者两栏的内容,中间用+区分   |
| `sort file1 file2`            | 排序两个文件的内容                       |
| `comm -1 file1 file2`         | 比较两个文件的内容（去除file1所含内容）  |
| `comm -2 file1 file2`         | 比较两个文件的内容（去除file2所含内容）  |
| `comm -3 file1 file2`         | 比较两个文件的内容（去除两文件共有内容） |

## 打包和解压

| 常用命令                            | 作用                     |
| :---------------------------------- | :----------------------- |
| `zip xxx.zip file`                  | 压缩至zip包              |
| `zip -r xxx.zip file1 file2 dir1`   | 将多个文件+目录压成zip包 |
| `unzip xxx.zip`                     | 解压缩                   |
| `tar -cvf xxx.tar file`             | 创建非压缩tar包          |
| `tar -cvf xxx.tar file1 file2 dir1` | 将多个文件+目录打包      |
| `tar -tf xxx.tar`                   | 查看tar包的内容          |
| `tar -xvf xxx.tar`                  | 解包                     |
| `tar -xvf xxx.tar -C /dir`          | 解包至指定目录           |
| `tar -cvfj xxx.tar.bz2 dir`         | 创建bz2压缩包            |
| `tar -jxvf xxx.tar.bz2`             | 解压bz2压缩包            |
| `tar -cvfz xxx.tar.gz dir`          | 创建gzip压缩包           |
| `tar -zxvf xxx.tar.gz`              | 解压gzip压缩包           |
| `bunzip2 xxx.bz2`                   | 解压bz2压缩包            |
| `bzip2 filename`                    | 压缩文件                 |
| `gunzip xxx.gz`                     | 解压gzip压缩包           |
| `gzip filename`                     | 压缩文件                 |
| `gzip -9 filename`                  | 最大程度压缩文件         |

## RPM包管理

| 常用命令                    | 作用                        |
| :-------------------------- | :-------------------------- |
| `rpm -qa`                   | 查看已安装的rpm包           |
| `rpm -q pkg_name`           | 查询某个rpm包               |
| `rpm -q --whatprovides xxx` | 查询xxx功能是由哪个包提供的 |
| `rpm -q --whatrequires xxx` | 查询xxx功能被哪个程序包依赖 |
| `rpm -q --changelog xxx`    | 查询xxx包的更改记录         |
| `rpm -qi pkg_name`          | 查询某个包的详细信息        |
| `rpm -qd pkg_name`          | 查询某个包所提供的文档      |
| `rpm -qc pkg_name`          | 查询已安装包提供的配置文件  |
| `rpm -ql pkg_name`          | 查询某个包安装了哪些文件    |
| `rpm -qf pkg_name`          | 查询某个文件属于哪个包      |
| `rpm -qR pkg_name`          | 查询某个包的依赖关系        |
| `rpm -ivh xxx.rpm`          | 安装包                      |
| `rpm -ivh --test xxx.rpm`   | 测试安装包                  |
| `rpm -ivh --nodeps xxx.rpm` | 安装包时忽略依赖关系        |
| `rpm -e xxx`                | 卸载程序包                  |
| `rpm -Fvh pkg_name`         | 升级已安装的包              |
| `rpm -Uvh pkg_name`         | 升级包（若未安装则安装）    |
| `rpm -V pkg_name`           | 包详细信息校验              |

## YUM包管理

| 常用命令                              | 作用                 |
| :------------------------------------ | :------------------- |
| `yum repolist enabled`                | 显示可用的源仓库     |
| `yum search pkg_name`                 | 搜索软件包           |
| `yum install pkg_name`                | 下载并安装软件包     |
| `yum install --downloadonly pkg_name` | 只下载不安装         |
| `yum list`                            | 显示所有程序包       |
| `yum list installed`                  | 查看当前系统已安装包 |
| `yum list updates`                    | 查看可以更新的包列表 |
| `yum check-update`                    | 查看可以升级的包列表 |
| `yum update`                          | 更新所有软件包       |
| `yum update pkg_name`                 | 升级指定软件包       |
| `yum deplist pkg_name`                | 列出软件包的依赖关系 |
| `yum remove pkg_name`                 | 删除软件包           |
| `yum clean all`                       | 清除缓存             |
| `yum clean packages`                  | 清除缓存的软件包     |
| `yum clean headers`                   | 清除缓存的header     |

## DPKG包管理

| 常用命令               | 作用                    |
| :--------------------- | :---------------------- |
| `dpkg -c xxx.deb`      | 列出deb包的内容         |
| `dpkg -i xxx.deb`      | 安装/更新deb包          |
| `dpkg -r pkg_name`     | 移除deb包               |
| `dpkg -P pkg_name`     | 移除deb包（不保留配置） |
| `dpkg -l`              | 查看系统中已安装的deb包 |
| `dpkg -l pkg_name`     | 显示包内容              |
| `dpkg -L pkg_name`     | 显示包安装的文件        |
| `dpkg -s pkg_name`     | 查看包的详细信息        |
| `dpkg -unpack xxx.deb` | 解开deb包的内容         |

## APT软件工具

| 常用命令                    | 作用                   |
| :-------------------------- | :--------------------- |
| `apt-cache search pkg_name` | 搜索程序包             |
| `apt-cache show pkg_name`   | 获取程序包的概览信息   |
| `apt-get install pkg_name`  | 安装/升级软件包        |
| `apt-get purge pkg_name`    | 卸载软件（包括配置）   |
| `apt-get remove pkg_name`   | 卸载软件（不包括配置） |
| `apt-get update`            | 更新包索引信息         |
| `apt-get upgrade`           | 更新已安装软件包       |
| `apt-get clean`             | 清理缓存               |
