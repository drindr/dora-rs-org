# 分布式（多Daemon）

> 地址：examples/multiple-daemons
> 关键词：Daemon, Coordinator

Dora通过Coordinator来协调多个Daemon的运行。Daemon可以来自不同的机器。这是Dora分布式的基础。

## 启动准备
### 启动一个协调器（Coordinator）
```bash
$ dora coordinator
```
其运行ip与端口的绑定可用过`--coordinator-addr`和`--coordinator-port`设置，具体通过`--help`参数来查看，样例中用默认的设置即可。

### 启动守护进程（Daemon）
```bash
$ DORA_EXAMPLES=/dora-examples dora daemon --machine-id A --coordinator-addr <协调器的地址> --coordinator-port <协调器的端口>
$ DORA_EXAMPLES=/dora-examples dora daemon --machine-id B --coordinator-addr <协调器的地址> --coordinator-port <协调器的端口>
```
分别启动两个分别名为A和B的守护进程。
默认协调器ip地址为`127.0.0.1`，如果协调器不位于本地，请将其设置为协调器所在机器的ip地址。
具体可以参考`dora daemon --help`。

## 构建
```bash
$ dora build dataflow.yml
```
可以通过`--coordinator-addr`和`--coordinator-port`来指定协调器的地址和端口。
具体可以参考`dora build --help`。

## 运行
``` bash
$ dora start dataflow.yml
```
可以通过`--coordinator-addr`和`--coordinator-port`来指定处理该dataflow的协调器的地址和端口。
具体可以参考`dora start --help`。
