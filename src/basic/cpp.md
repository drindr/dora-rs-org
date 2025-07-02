# C/C++

## 需要预先准备的包
为了实现C/C++多语言混合编程，需要准备好相关的包。
需要从源码安装Dora，并且构建相关包：
- 运行时
```bash
$ cargo build -p dora-runtime
```
- 如果需要使用C API
```bash
$ cargo build -p dora-node-api-c
$ cargo build -p dora-operator-api-c
```
- 如果需要使用Rust API
```bash
$ cargo build -p dora-node-api-cxx
$ cargo build -p dora-operator-api-cxx
```

如果对Rust与C++的混合编译感兴趣，可以参阅[cxx.rs](https://cxx.rs/)
