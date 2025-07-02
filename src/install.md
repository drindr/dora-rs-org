# 安装
Dora 提供了多种安装方式
<!-- langtabs-start -->
```pip
pip install dora-rs-cli
```
```Linux
curl --proto '=https' --tlsv1.2 -LsSf https://github.com/dora-rs/dora/releases/latest/download/dora-cli-installer.sh | sh
```
```MacOS
curl --proto '=https' --tlsv1.2 -LsSf https://github.com/dora-rs/dora/releases/latest/download/dora-cli-installer.sh | sh
```
```Windows
powershell -ExecutionPolicy ByPass -c "irm https://github.com/dora-rs/dorareleases/latest/download/dora-cli-installer.ps1 | iex"
```
```Cargo
cargo install dora-cli
```
```Docker
docker pull ghcr.io/dora-rs/dora-slim #拉取镜像
docker run ghcr.io/dora-rs/dora-slim dora --help #运行容器
```
```Latest
git clone https://github.com/dora-rs/dora.git
cd dora
cargo build --release -p dora-cli
PATH=$PATH:$(pwd)/target/release
```
<!-- langtabs-end -->

> [!IMPORTANT]
> 本文主要围绕主分支的最新代码展开，如果想获得完全相同体验请尽量使用主分支上的Dora。

确认完成安装
```bash
$ dora --version
dora-cli 0.3.11
```
