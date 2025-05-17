#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
# 修改路由器IP为192.168.100.1
sed -i "s/$192.168.1.1/$192.168.100.1/g" package/base-files/files/bin/config_generate

# 修改路由器主机名为X-WRT
sed -i "s/$hostname='ImmortalWrt'/$hostname='X-WRT'/g" package/base-files/files/bin/config_generate

# 修改时区为 CST-8
sed -i "s/$timezone='UTC'/$timezone='CST-8'/g" package/base-files/files/bin/config_generate

# 修改地区为上海
sed -i '/CST-8/a \\t\tset system.@system[-1].zonename='Asia/Shanghai'' package/base-files/files/bin/config_generate
