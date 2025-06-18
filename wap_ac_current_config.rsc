# 2025-06-01 09:30:36 by RouterOS 7.18.2
# software id = B7VI-DUTP
#
# model = RBwAPG-5HacT2HnD
# serial number = 848508425197
/interface bridge
add admin-mac=CC:2D:E0:1D:0D:89 auto-mac=no name=Bridge_LAN
add admin-mac=64:D1:54:FF:56:5F auto-mac=no comment=defconf name=bridgeLocal \
    port-cost-mode=short
/interface wireless
# managed by CAPsMAN
# channel: 2412/20-Ce/gn(28dBm), SSID: YAROSLAV, CAPsMAN forwarding
set [ find default-name=wlan1 ] ssid=MikroTik station-roaming=enabled
# managed by CAPsMAN
# channel: 5220/20-eeCe/ac(28dBm), SSID: YAROSLAV, CAPsMAN forwarding
set [ find default-name=wlan2 ] ssid=MikroTik
/interface ethernet
set [ find default-name=ether1 ] name=Port1_Lan
/interface lte apn
set [ find default=yes ] ip-type=ipv4 use-network-apn=no
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip hotspot profile
set [ find default=yes ] html-directory=hotspot
/interface bridge port
add bridge=Bridge_LAN interface=Port1_Lan
/ip firewall connection tracking
# ipv6 neighbor configuration has changed, please restart the device in order to apply the new settings
set udp-timeout=10s
/ip neighbor discovery-settings
# ipv6 neighbor configuration has changed, please restart the device in order to apply the new settings
set discover-interface-list=all
/ip settings
# ipv6 neighbor configuration has changed, please restart the device in order to apply the new settings
set max-neighbor-entries=8192
/ipv6 settings
# ipv6 neighbor configuration has changed, please restart the device in order to apply the new settings
set disable-ipv6=yes max-neighbor-entries=8192
/interface ovpn-server server
add auth=sha1,md5 mac-address=FE:C5:0F:60:FB:DA name=ovpn-server1
/interface wireless cap
# 
set bridge=Bridge_LAN discovery-interfaces=Bridge_LAN enabled=yes interfaces=\
    wlan1,wlan2
/ip dhcp-client
add comment=defconf interface=Bridge_LAN
add comment=defconf interface=bridgeLocal
/ip firewall filter
add action=log chain=icmp comment=\
    "======================================================================" \
    disabled=yes
add action=log chain=icmp comment=\
    "                                     -= its a PA3 =-" disabled=yes
add action=log chain=icmp comment=\
    "                                    -= Changed - 17/05/2025=-" disabled=\
    yes
add action=log chain=icmp comment=\
    "                  -= +38 (067) 546-76-03 / oleksandr.nosar@gmail.com =-" \
    disabled=yes
add action=log chain=icmp comment=\
    "======================================================================" \
    disabled=yes
/ip ipsec profile
set [ find default=yes ] dpd-interval=2m dpd-maximum-failures=5
/ip service
set telnet disabled=yes
set ftp disabled=yes
set ssh disabled=yes
set api disabled=yes
set winbox port=57572
set api-ssl disabled=yes
/routing bfd configuration
add disabled=no interfaces=all min-rx=200ms min-tx=200ms multiplier=5
/system clock
set time-zone-name=Europe/Kiev
/system identity
set name=PA3_WAP_AC
/system note
set show-at-login=no
/system script
add dont-require-permissions=no name=ExportConfig owner=tmp01 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="{\
    \r\
    \n\t:local filename  \"\";\r\
    \n\t:local filenameS \"\";\r\
    \n\t:local filenameT \"\";\r\
    \n\t:local sysname [/system identity get name];\r\
    \n\t:local appver [/system package update get installed-version];\t\r\
    \n\t:local date [/system clock get date];\r\
    \n\t:local time [/system clock get time];\r\
    \n\t:local year [:pick \$date 0 4];\r\
    \n\t:local month [:pick \$date 5 7];\r\
    \n\t:local day [:pick \$date 8 11];\r\
    \n\t:local hour [:pick \$time 0 2];\r\
    \n\t:local min [:pick \$time 3 5];\r\
    \n\t:local sec [:pick \$time 6 8];\r\
    \n\r\
    \n\t:set filename  (sysname .\"_\". \$day.\"-\".\$month.\"-\".\$year.\"_\"\
    .\$hour.\"-\".\$min.\"-\".\$sec.\"_ROS_\".\$appver);\r\
    \n\t:set filenameT (sysname .\"_\". \$day.\"-\".\$month.\"-\".\$year.\"_\"\
    .\$hour.\"-\".\$min.\"-\".\$sec.\"_ROS_\".\$appver.\"_terse\");\r\
    \n\r\
    \n\r\
    \n\t/system backup save name=\"\$filename\";\r\
    \n\t/export terse file=\"\$filenameT\";\r\
    \n\r\
    \n\r\
    \n\t:delay 1s;\r\
    \n\t:log info  \"...Export config complete\";\r\
    \n}\r\
    \n\r\
    \n \r\
    \n "
add dont-require-permissions=no name=CleanALL owner=tmp01 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="\
    \r\
    \n##   Date create 17/05/2025\r\
    \n\r\
    \n{\r\
    \n\t/file remove [find name~\"txt\"];\r\
    \n\t/file remove [find name~\"rsc\"];\r\
    \n\t/file remove [find name~\"backup\"];\r\
    \n\t/ip firewall filter reset-counters-all;\r\
    \n\t/ip firewall nat reset-counters-all;\r\
    \n\t/ip firewall raw reset-counters-all;\r\
    \n\t/ip dns cache flush;\r\
    \n\r\
    \n\t/system logging action set memory memory-lines=1;\r\
    \n\t/system logging action set memory memory-lines=5000;\r\
    \n}"
add dont-require-permissions=no name=CleanLog owner=tmp01 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="{\
    \r\
    \n\t/system logging action set memory memory-lines=1;\r\
    \n\t/system logging action set memory memory-lines=5000\r\
    \n}"
