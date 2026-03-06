#!/bin/bash
echo "🦞 正在为 Yushen 自动化部署 OpenClaw..."

# 1. 解决 IDX 环境变量冲突
if ! grep -q "unset NPM_CONFIG_PREFIX" ~/.bashrc; then
    sed -i '1i unset NPM_CONFIG_PREFIX' ~/.bashrc
fi
unset NPM_CONFIG_PREFIX

# 2. 安装 nvm
if [ ! -d "$HOME/.nvm" ]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
fi

# 3. 加载 nvm 并安装 Node 22.12.0
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install 22.12.0
nvm use 22.12.0
nvm alias default 22.12.0

# 4. 全局安装 OpenClaw 和进程管理器 PM2
npm install -g openclaw@latest pm2

echo "✅ 安装完成！请执行 'source ~/.bashrc' 然后运行 'openclaw onboard'。"