#!/bin/bash

mkdir -p files/root
pushd files/root

# Clone oh-my-zsh repository
git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh ./.oh-my-zsh

# Install extra plugins
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ./.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting ./.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/zsh-users/zsh-completions ./.oh-my-zsh/custom/plugins/zsh-completions
# 添加第三方源码
echo "src-git smpackage https://github.com/kenzok8/small-package.git" >> feeds.conf.default
# 更新并安装
./scripts/feeds update -a
./scripts/feeds install -a
# 可选：特定配置
echo "CONFIG_PACKAGE_luci-app-netspeedtest=y" >> .config
echo "CONFIG_PACKAGE_luci-app-gecoosac=y" >> .config

# Get .zshrc dotfile
cp $GITHUB_WORKSPACE/scripts/.zshrc .

popd
