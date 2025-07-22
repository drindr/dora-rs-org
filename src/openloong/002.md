# 开发环境准备
### Dora环境
### Opennlong环境
#### Openloong微服务框架gRPC安装
#### 1. 安装python发行版
安装准备条件:
python 3.7或更高版本
pip 9.0.1或更高版本
安装gprc:
```
python -m pip install grpcio
#或者在系统范围内安装
sudo python -m pip install grpcio
```
1. 安装gprc工具
```
python -m pip install grpcio-tools
```
从Github仓库下载官方最新版本代码以及相关示例
```
git clone -b v1.73.0 --depth 1 --shallow-submodules https://github.com/grpc/grpc
```
在```examples/python/helloworld```目录下运行:
```
python greeter_server.py
```
在另一个终端中, ```examples/python/helloworld```目录下运行:
```
python greeter_client.py
```
以上顺利完成可启动gRPC服务
#### 可能踩坑的点
1. 在递归克隆gRPC仓库时容易在克隆子模块时失败, 导致模块缺失, 后续编译(C++版本)虽然可能顺利通过, 但会缺少部分功能无法运行gRPC框架;
#### 2. 编译安装C++版本

