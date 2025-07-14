# ROS2数据流

> 地址：./examples/c++-ros2-dataflow
>
> 关键词：ROS2

确保ROS2环境已正确[安装和配置](/appendix/ros2-installation.md)

Dora通过[ros2-client](https://crates.io/crates/ros2-client)与ROS进行交互
C++ API为了与ROS通信，需要启用ROS2桥接功能。

## 准备相关依赖
由于例子与`turtlesim`和`AddTwoInts`相关
```bash
$ sudo apt install ros-jazzy-turtlesim ros-jazzy-examples-rclcpp-minimal-service
```
```bash
$ source /opt/ros/jazzy/setup.bash
$ cargo build --package dora-node-api-cxx --features ros2-bridge
$ mkdir build
$ cp ../../target/cxxbridge/dora-node-api-cxx/dora-node-api.cc ./build/dora-node-api.cc
$ cp ../../target/cxxbridge/dora-node-api-cxx/dora-node-api.h ./build/dora-node-api.h
$ cp ../../target/cxxbridge/dora-node-api-cxx/dora-ros2-bindings.cc ./build/dora-ros2-bindings.cc
$ cp ../../target/cxxbridge/dora-node-api-cxx/dora-ros2-bindings.h ./build/dora-ros2-bindings.h
```
当ROS2中的包出现变化时，需要重新构建`dora-node-api-cxx`从而确保`dora-ros2-bindings`的正确性。
在构建前务必先source需要使用的ROS环境，以确保各ROS包能被检测到并生成桥接文件

## 编译
```bash
$ alias CXX=g++ # clang++ 也可以
$ CXX ./node-rust-api/main.cc ./build/dora-ros2-bindings.cc ./build/dora-node-api.cc -std=c++17 -lm -lrt -ldl -lz -pthread -ldora_node_api_cxx -L ../../target/debug/ -o ./build/node_rust_api
```

## 运行
打开另外两个终端

需要使用`rmw_fastrtps_cpp`Jazzy 中应该是默认的，如果在`.bashrc`等地方设置成了别的注意要设置回来。
更改设置后重启daemon，`ros2 daemon stop`, `ros2 daemon start`
### 启动turtlesim
```bash
$ source /opt/ros/jazzy/setup.bash
$ ros2 run turtlesim turtlesim_node
```
### 启动AddTwoInts服务
```bash
$ source /opt/ros/jazzy/setup.bash
$ ros2 run examples_rclcpp_minimal_service service_main
```
### 启动Dora节点
```bash
$ dora run dataflow.yml
```
<p style="text-align:center"><video autoplay src="/images/c++-ros2.webm" alt="运行画面" width="90%" /></p>
