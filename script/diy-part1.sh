#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add feed sources
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
#sed -i '$a src-git diy https://github.com/CCnut/feed-netkeeper.git;LUCI-LUA-UCITRACK' feeds.conf.default

status_cfg=$(git status | grep -cE "feeds.conf.default$")
if [[ $status_cfg -eq 1 ]]; then
    git reset HEAD feeds.conf.default
    git checkout feeds.conf.default
fi

\rm -rf ./tmp
\rm -rf ./logs/*

git pull

# Add a feed source
echo "src-git feeds_app https://github.com/kenzok8/openwrt-packages" >> feeds.conf.default
echo "src-git small https://github.com/benboguan/small" >> feeds.conf.default
./scripts/feeds update -a && rm -rf feeds/luci/applications/{luci-app-alist,luci-app-adguardhome,luci-app-ipsec-vpnd,luci-app-ipsec-vpnserver-manyusers,luci-app-smartdns,luci-app-mosdns,luci-app-passwall,luci-app-ssr-plus,luci-app-vssr} && rm -rf feeds/packages/net/{alist,adguardhome,brook,hysteria,mosdns,smartdns,chinadns-ng,v2ray-core,v2ray-geodata,v2ray-plugin,xray-core,xray-plugin,shadowsocks-rust,trojan-go,trojan-plus,trojan}
rm -rf feeds/small/{luci-app-fchomo,luci-app-bypass,luci-app-nikki,luci-app-passwall2,mihomo,nikki}
rm -rf feeds/packages/lang/golang
git clone https://github.com/kenzok8/golang feeds/packages/lang/golang
#rm -rf feeds/luci/applications/luci-app-passwall
#git clone https://github.com/xiaorouji/openwrt-passwall feeds/luci/applications
#\rm -rf ./feeds/small/luci-app-homeproxy
./scripts/feeds install -a
#make menuconfig

# Add luci-theme-argon
#cd lede/package/lean
#rm -rf luci-theme-argon 
#git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon
#git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config
