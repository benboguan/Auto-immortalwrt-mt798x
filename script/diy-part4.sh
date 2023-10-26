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
sed -i 's/192.168.1.1/192.168.110.1/g' package/base-files/files/bin/config_generate

# 修改主机名字，把R30B1修改你喜欢的就行（不能纯数字或者使用中文）
sed -i 's/ImmortalWrt/R30B1/g' package/base-files/files/bin/config_generate

# 修改开源驱动wifi名称
#sed -i 's/OpenWrt/R30B1_AX3000/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 修改闭源驱动2G wifi名称
sed -i 's/MT7981_AX3000_2.4G/R30B1_AX3000_2.4G/g' package/mtk/drivers/wifi-profile/files/mt7981/mt7981.dbdc.b0.dat
#sed -i 's/OpenWRT-2.4G/R30B1_AX3000_2.4G/g' package/mtk/drivers/wifi-profile/files/mt7981/files/lib/wifi/mt_dbdc.sh

# 修改闭源驱动5G wifi名称
sed -i 's/MT7981_AX3000_5G/R30B1_AX3000_5G/g' package/mtk/drivers/wifi-profile/files/mt7981/mt7981.dbdc.b1.dat
#sed -i 's/OpenWRT-5G/R30B1_AX3000_5G/g' package/mtk/drivers/wifi-profile/files/mt7981/files/lib/wifi/mt_dbdc.sh

# 添加个性信息
#sed -i 's/R22.8.2/R22.8.2 by nanchuci/g' package/lean/default-settings/files/zzz-default-settings

# 修改banne文件（banne文件在根目录）（不要修改此行代码,怕弄的diy-lede.sh文件全失效,不需要的话前面加#，或者全行代码删除了）
#rm -rf ./package/base-files/files/etc/banne && cd .. && cp -f ./banner openwrt/package/base-files/files/etc/ && cd openwrt

# 更改时区
sed -i "s/'UTC'/'CST-8'\n        set system.@system[-1].zonename='Asia\/Shanghai'/g" package/base-files/files/bin/config_generate

#修正连接数
#sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=165535' package/base-files/files/etc/sysctl.conf

###### 取消bootstrap为默认主题 ######
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

###### 替换iwinfo ######
#rm -rf package/network/utils/iwinfo && svn co https://github.com/benboguan/immortalwrt-mt798x/branches/R30B1/package/network/utils/iwinfo package/network/utils/iwinfo
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

# Add lua-ipops
#svn co https://github.com/x-wrt/com.x-wrt/trunk/lua-ipops

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
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-pptp-server

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
git clone --depth=1 https://github.com/Ausaci/luci-app-nat6-helper

# default luci-theme-argon
#rm -rf feeds/luci/themes/luci-theme-bootstrap
#rm -rf feeds/luci/themes/luci-theme-argon
#git clone --depth=1 https://github.com/jerrykuku/luci-theme-argon

# Add luci-theme-alpha
#git clone --depth=1 https://github.com/derisamedia/luci-theme-alpha
#git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config
