#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# 说明：
# 除了第一行的#!/bin/bash不要动，其他的设置，前面带#表示不起作用，不带的表示起作用了（根据你自己需要打开或者关闭）
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# 修改openwrt登陆地址,把下面的192.168.110.1修改成你想要的就可以了
#sed -i 's/192.168.1.1/192.168.110.1/g' package/base-files/files/bin/config_generate

# 修改主机名字，把R30B1修改你喜欢的就行（不能纯数字或者使用中文）
#sed -i 's/ImmortalWrt/R30B1/g' package/base-files/files/bin/config_generate

# 修改开源驱动wifi名称
#sed -i 's/OpenWrt/R30B1_AX3000/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 修改闭源驱动2G wifi名称
#sed -i 's/ImmortalWrt-2.4G/R30B1_AX3000_2.4G/g' package/mtk/applications/mtwifi-cfg/files/mtwifi.sh
#sed -i 's/MT7981_AX3000_2.4G/R30B1_AX3000_2.4G/g' package/mtk/drivers/wifi-profile/files/mt7981/mt7981.dbdc.b0.dat
#sed -i 's/MT798x_AX3000_2.4G/R30B1_AX3000_2.4G/g' package/mtk/applications/gl-sdk4-mtk-wifi-v2/files/wireless.config
#sed -i 's/$hostname-2.4G/R30B1_2.4G/g' package/mtk/drivers/wifi-profile/files/common/mt79xx/lib/wifi/mtk.sh
#sed -i 's/OpenWRT-2.4G/R30B1_2.4G/g' package/mtk/drivers/wifi-profile/files/common/mt79xx/lib/wifi/mtk.sh

# 修改闭源驱动5G wifi名称
sed -i 's/ImmortalWrt-5G/R30B1_AX3000_5G/g' package/mtk/applications/mtwifi-cfg/files/mtwifi.sh
#sed -i 's/MT7981_AX3000_5G/R30B1_AX3000_5G/g' package/mtk/drivers/wifi-profile/files/mt7981/mt7981.dbdc.b1.dat
#sed -i 's/MT798x_AX3000_5G/R30B1_AX3000_5G/g' package/mtk/applications/gl-sdk4-mtk-wifi-v2/files/wireless.config
#sed -i 's/$hostname-5G/R30B1_5G/g' package/mtk/drivers/wifi-profile/files/common/mt79xx/lib/wifi/mtk.sh
#sed -i 's/OpenWRT-5G/R30B1_5G/g' package/mtk/drivers/wifi-profile/files/common/mt79xx/lib/wifi/mtk.sh

# 添加个性信息
#sed -i 's/R22.8.2/R22.8.2 by nanchuci/g' package/lean/default-settings/files/zzz-default-settings

# 修改banne文件（banne文件在根目录）（不要修改此行代码,怕弄的diy-lede.sh文件全失效,不需要的话前面加#，或者全行代码删除了）
#rm -rf ./package/base-files/files/etc/banne && cd .. && cp -f ./banner openwrt/package/base-files/files/etc/ && cd openwrt

# 更改时区
#sed -i "s/'UTC'/'CST-8'\n        set system.@system[-1].zonename='Asia\/Shanghai'/g" package/base-files/files/bin/config_generate

#修正连接数
#sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=65535' package/base-files/files/etc/sysctl.conf

#修改默认登录密码
#sed -i 's|root::0:0:99999:7:::|root:$1$3KE5ghiL$wO7ejWeQ8Hxj6osIgD.xi/:19661:0:99999:7:::|g' package/base-files/files/etc/shadow

######
#sed -i 's/ImmortalWrt-5G/R30B1_AX3000_5G/g' package/mtk/applications/luci-app-mtwifi-cfg/root/usr/share/luci-app-mtwifi-cfg/luci-mod-status.json

###### 取消bootstrap为默认主题 ######
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

###### 取消myddns_ipv4 ######
sed -i '/myddns_ipv4/,$d' feeds/packages/net/ddns-scripts/files/etc/config/ddns

###### 科学 ######
#sed -i '1i src-git feeds_app https://github.com/kenzok8/openwrt-packages' feeds.conf.default
#sed -i '2i src-git small https://github.com/kenzok8/small' feeds.conf.default
#./scripts/feeds update -a && rm -rf feeds/luci/applications/{luci-app-alist,luci-app-adguardhome,luci-app-ipsec-vpnd,luci-app-ipsec-vpnserver-manyusers,luci-app-smartdns,luci-app-mosdns,luci-app-passwall,luci-app-ssr-plus,luci-app-vssr} && rm -rf feeds/packages/net/{alist,adguardhome,brook,hysteria,mosdns,smartdns,chinadns-ng,v2ray-core,v2ray-geodata,v2ray-plugin,xray-core,xray-plugin,shadowsocks-rust,trojan-go,trojan-plus,trojan}
#rm -rf feeds/packages/lang/golang
#git clone https://github.com/kenzok8/golang feeds/packages/lang/golang

#rm -rf feeds/luci/applications/luci-app-passwall
#git clone https://github.com/xiaorouji/openwrt-passwall feeds/luci/applications
#\rm -rf ./feeds/small/luci-app-homeproxy
#./scripts/feeds install -p feeds_app -f adguardhome alist smartdns luci-app-alist luci-app-adguardhome luci-app-smartdns
#./scripts/feeds install -p small -f brook hysteria chinadns-ng mosdns v2ray-core v2ray-geodata v2ray-plugin xray-core xray-plugin shadowsocks-rust trojan-go trojan-plus trojan dns2tcp dns2socks \
#luci-app-passwall luci-app-ssr-plus luci-app-mosdns

###### 加载补丁文件 ######
#for packagepatch in $( ls feeds/packages/feeds-package-patch ); do
#    cd feeds/packages/
#    echo Applying feeds-package-patch $packagepatch
#    patch -p1 --no-backup-if-mismatch < feeds-package-patch/$packagepatch
#    cd ../..
#done
#
#for smallpatch in $( ls feeds/small/feeds-luci-patch ); do
#    cd feeds/small/
#    echo Applying feeds-luci-patch $smallpatch
#    patch -p1 --no-backup-if-mismatch < feeds-luci-patch/$smallpatch
#    cd ../..
#done
#
#for lucipatch in $( ls feeds/luci/luci-patch ); do
#    cd feeds/luci/
#    echo Applying luci-patch $lucipatch
#    patch -p1 --no-backup-if-mismatch < luci-patch/$lucipatch
#    cd ../..
#done

#for apppatch in $( ls feeds/feeds_app/feeds-app-patch ); do
#    cd feeds/feeds_app/
#    echo Applying feeds-app-patch $apppatch
#    patch -p1 --no-backup-if-mismatch < feeds-app-patch/$apppatch
#    cd ../..
#done

# Clone community packages to package/community
mkdir package/community
pushd package/community

# Add Lienol's Packages
#git clone --depth=1 https://github.com/Lienol/openwrt-package

# Add luci-app-eqos
#svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-eqos

# Add dnsfilter
#git clone --depth=1 https://github.com/garypang13/luci-app-dnsfilter

# Add luci-app-passwall
#git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall-packages
#git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall
#git clone --depth=1 https://github.com/kenzok8/small

# Add luci-app-vssr <M>
#git clone --depth=1 https://github.com/jerrykuku/lua-maxminddb.git
#git clone --depth=1 https://github.com/jerrykuku/luci-app-vssr

# Add mentohust & luci-app-mentohust
#git clone --depth=1 https://github.com/BoringCat/luci-app-mentohust
#git clone --depth=1 https://github.com/KyleRicardo/MentoHUST-OpenWrt-ipk

# Add lucky
#git clone https://github.com/firkerword/luci-app-lucky.git package/lucky

# Add luci-app-natflow-users
#svn co https://github.com/x-wrt/com.x-wrt/trunk/luci-app-natflow-users

# Add natflow
#svn co https://github.com/x-wrt/com.x-wrt/trunk/natflow

# Add iptvhelper & luci-app-iptvhelper
#svn co https://github.com/kiddin9/openwrt-packages/trunk/iptvhelper
#svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-iptvhelper

# Add luci-app-easymesh
#svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-easymesh

# Add luci-app-pbr
#svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-iptvhelper

# add luci-app-pptp-server
#svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-pptp-server

# add luci-app-pptpd
#svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-pptpd

# add quickstart
#svn co https://github.com/kiddin9/openwrt-packages/trunk/quickstart

# add luci-app-quickstart
#svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-quickstart

# add msd_lite
#rm -rf feeds/packages/net/msd_lite
#git clone --depth=1 https://github.com/rozhuk-im/msd_lite

# add luci-app-msd_lite
#svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-msd_lite

# Add luci-app-pushbot
#svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-pushbot

# Add luci-app-nat6-helper
#git clone --depth=1 https://github.com/Ausaci/luci-app-nat6-helper

# default luci-theme-argon
#rm -rf feeds/luci/themes/luci-theme-bootstrap
#rm -rf feeds/luci/themes/luci-theme-argon
#git clone --depth=1 https://github.com/jerrykuku/luci-theme-argon

# Add luci-theme-alpha
#git clone --depth=1 https://github.com/derisamedia/luci-theme-alpha
#git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config

#./scripts/feeds install -a
#make menuconfig
