# 🦞 OpenClaw for Google IDX

这是一个专为 Google IDX 优化的 OpenClaw 一键安装模版。

## 🚀 如何使用？
1. 在 Google IDX 中选择 **"Import a Repo"**。
2. 输入本仓库地址。
3. 等待 `setup.sh` 运行完毕。
4. 在终端输入 `source ~/.bashrc`。
5. 输入 `openclaw onboard` 进行配置。
6. 配置完成后，使用 PM2 后台启动：
   `pm2 start "openclaw gateway" --name claw`

## 🛠️ 包含功能
- 自动升级 Node 至 22.12.0+
- 自动绕过 IDX 权限冲突
- 内置 PM2 进程管理