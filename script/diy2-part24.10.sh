#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# 说明：
# 除了第一行的#!/bin/bash不要动，其他的设置，前面带#表示不起作用，不带的表示起作用了（根据你自己需要打开或者关闭）
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy2-part24.10.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# 修改openwrt登陆地址,把下面的192.168.6.1修改成你想要的就可以了
sed -i 's/192.168.6.1/192.168.112.1/g' package/base-files/files/bin/config_generate

# 修改主机名字，把H5000M修改你喜欢的就行（不能纯数字或者使用中文）
#sed -i 's/ImmortalWrt/H5000M/g' package/base-files/files/bin/config_generate

# 修改开源驱动wifi名称
#sed -i 's/OpenWrt/R30B1_AX3000/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 修改闭源驱动2G wifi名称
#sed -i 's/ImmortalWrt-2.4G/MSG1500_2.4G/g' package/mtk/applications/mtwifi-cfg/files/mtwifi.sh
#sed -i 's/MT7981_AX3000_2.4G/R30B1_AX3000_2.4G/g' package/mtk/drivers/wifi-profile/files/mt7981/mt7981.dbdc.b0.dat
#sed -i 's/$hostname-2.4G/MSG1500_2.4G/g' package/mtk/drivers/wifi-profile/files/common/mt79xx/lib/wifi/mtk.sh
sed -i 's/ImmortalWrt-2.4G/H5000M_2.4G/g' package/mtk/applications/mtwifi-cfg/files/mtwifi.sh

# 修改闭源驱动5G wifi名称
#sed -i 's/ImmortalWrt-5G/MSG1500_5G/g' package/mtk/applications/mtwifi-cfg/files/mtwifi.sh
#sed -i 's/MT7981_AX3000_5G/R30B1_AX3000_5G/g' package/mtk/drivers/wifi-profile/files/mt7981/mt7981.dbdc.b1.dat
#sed -i 's/$hostname-5G/MSG1500_5G/g' package/mtk/drivers/wifi-profile/files/common/mt79xx/lib/wifi/mtk.sh
sed -i 's/ImmortalWrt-5G/H5000M_5G/g' package/mtk/applications/mtwifi-cfg/files/mtwifi.sh

# 修改闭源驱动6G wifi名称
#sed -i 's/ImmortalWrt-5G/MSG1500_5G/g' package/mtk/applications/mtwifi-cfg/files/mtwifi.sh
#sed -i 's/MT7981_AX3000_5G/R30B1_AX3000_5G/g' package/mtk/drivers/wifi-profile/files/mt7981/mt7981.dbdc.b1.dat
#sed -i 's/$hostname-5G/MSG1500_5G/g' package/mtk/drivers/wifi-profile/files/common/mt79xx/lib/wifi/mtk.sh
#sed -i 's/ImmortalWrt-6G/H5000M_6G/g' package/mtk/applications/mtwifi-cfg/files/mtwifi.sh

# 更改时区
#sed -i "s/'UTC'/'CST-8'\n        set system.@system[-1].zonename='Asia\/Shanghai'/g" package/base-files/files/bin/config_generate

###### 取消myddns_ipv4 ######
sed -i '/myddns_ipv4/,$d' feeds/packages/net/ddns-scripts/files/etc/config/ddns
