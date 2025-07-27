# openloong实例
在[dora-rs/ospp2025openloong](https://github.com/dora-rs/ospp2025-openloong)仓库*Openloong-proto*文件夹提供了openloong的gRPC-proto控制接口
## 1.GPS导航
使用gRPC微服务获取机器人当前位置

在[dora-rs/ospp2025openloong](https://github.com/dora-rs/ospp2025-openloong)仓库gps_navigaton_gprc文件夹提供了server和client的python实现
### 1.1 使用gRPC编译proto
在安装有gRPC的python环境中执行:
```
python -m grpc_tools.protoc -I./protoFiles --python_out=proto --pyi_out=proto --grpc_python_out=proto protoFiles/gps_navigation.proto
```
gRPC会读取proto文件*protoFiles/gps_navigation.proto*并将生成的文件放在proto目录下
### 1.2 启动gRPC server服务
在安装有gRPC的python环境下执行
```
python gps_navigation_server.py
```
### 1.3 启动gRPC client服务
```
python gps_navigation_client.py
```

## 2.上肢控制
### 2.1 使用gRPC编译proto
### 2.2 启动gRPC server服务
### 2.3 启动gRPC client服务
## openloong-dora工作流实例
### 3.1 使用gRPC编译proto
### 3.2 启动gRPC server服务
### 3.3 启动gRPC client服务