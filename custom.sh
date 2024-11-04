#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#


# Modify default IP
# sed -i 's/192.168.1.1/10.5.2.1/g' package/base-files/files/bin/config_generate
 
# add custom packages
# echo 'src-git xYx https://github.com/xYx-c/openwrt-luci' >>feeds.conf.default
echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
sed -i '$a src-git xmpackage https://github.com/xiaomeng9597/openwrt-packages2.git;main' feeds.conf.default
sed -i '$a src-git istore https://github.com/linkease/istore.git;main' feeds.conf.default

#主题
# rm -rf feeds/luci/applications/luci-app-argon-config
# rm -rf feeds/kenzo/luci-app-argon-config
git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config

# rm -rf feeds/luci/themes/luci-theme-argon
# rm -rf feeds/kenzo/luci-theme-argon
git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon

rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 20.x feeds/packages/lang/golang

# update golang
# pushd feeds/packages/lang
# rm -rf golang && svn co https://github.com/openwrt/packages/trunk/lang/golang
# popd
