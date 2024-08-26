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

# Add a feed source
#rm -rf feeds/luci/applications/luci-app-passwall
#echo "src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main" >> "feeds.conf.default"
#echo "src-git passwall https://github.com/xiaorouji/openwrt-passwall.git;main" >> "feeds.conf.default"
#sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
#sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default
sed -i '1i src-git feeds_app https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '2i src-git small https://github.com/kenzok8/small' feeds.conf.default
./scripts/feeds update -a && rm -rf feeds/luci/applications/{luci-app-alist,luci-app-adguardhome,luci-app-smartdns,luci-app-mosdns,luci-app-passwall,luci-app-ssr-plus,luci-app-vssr} && rm -rf feeds/packages/net/{alist,adguardhome,brook,hysteria,mosdns,smartdns,chinadns-ng,v2ray-core,v2ray-geodata,v2ray-plugin,xray-core,xray-plugin,shadowsocks-rust,trojan-go,trojan-plus,trojan}
rm -rf feeds/packages/lang/golang
git clone https://github.com/kenzok8/golang feeds/packages/lang/golang

#rm -rf feeds/luci/applications/luci-app-passwall
#git clone https://github.com/xiaorouji/openwrt-passwall feeds/luci/applications
rm -rf feeds/small/luci-app-homeproxy

./scripts/feeds install -p feeds_app -f adguardhome alist smartdns luci-app-alist luci-app-adguardhome luci-app-smartdns

./scripts/feeds install -p small -f brook hysteria chinadns-ng mosdns v2ray-core v2ray-geodata v2ray-plugin xray-core xray-plugin shadowsocks-rust trojan-go trojan-plus trojan dns2tcp dns2socks \
luci-app-passwall luci-app-ssr-plus luci-app-mosdns

./scripts/feeds install -a
make menuconfig

# Add luci-theme-argon
#cd lede/package/lean
#rm -rf luci-theme-argon 
#git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon
#git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config
