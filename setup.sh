#!/bin/bash
echo "🦞 正在为 Yushen 自动化部署纯净版 OpenClaw..."

# 1. 解决 IDX 环境变量冲突
if ! grep -q "unset NPM_CONFIG_PREFIX" ~/.bashrc; then
    sed -i '1i unset NPM_CONFIG_PREFIX' ~/.bashrc
fi
unset NPM_CONFIG_PREFIX

# 2. 安装 nvm (Node 版本管理)
if [ ! -d "$HOME/.nvm" ]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
fi

# 3. 加载 nvm 并锁定 Node 22.12.0
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install 22.12.0
nvm use 22.12.0
nvm alias default 22.12.0

# 4. 只安装 OpenClaw 本身
npm install -g openclaw@latest

echo "------------------------------------------------"
echo "✅ 环境安装完成！"
echo "👉 请执行: source ~/.bashrc"
echo "👉 然后直接输入: openclaw gateway 启动服务"
echo "------------------------------------------------"
