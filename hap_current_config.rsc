# 2025-06-01 09:28:06 by RouterOS 7.18.2
# software id = Y6SD-6YFQ
#
# model = RBD52G-5HacD2HnD
# serial number = B4A00A9CE35C
/interface bridge
add admin-mac=74:4D:28:83:84:F2 auto-mac=no name=Bridge_LAN
/interface wireless
# managed by CAPsMAN
# channel: 2412/20-Ce/gn(27dBm), SSID: YAROSLAV, CAPsMAN forwarding
set [ find default-name=wlan1 ] ssid=MikroTik station-roaming=enabled
# managed by CAPsMAN
# channel: 5220/20-eeCe/ac(27dBm), SSID: YAROSLAV, CAPsMAN forwarding
set [ find default-name=wlan2 ] ssid=MikroTik
/interface ethernet
set [ find default-name=ether1 ] name=Port1_Lan
set [ find default-name=ether2 ] name=Port2_Lan
set [ find default-name=ether3 ] name=Port3_Lan
set [ find default-name=ether4 ] name=Port4_Lan
set [ find default-name=ether5 ] name=Port5_Lan
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/interface bridge port
add bridge=Bridge_LAN interface=Port1_Lan
add bridge=Bridge_LAN interface=Port2_Lan
add bridge=Bridge_LAN interface=Port3_Lan
add bridge=Bridge_LAN interface=Port4_Lan
add bridge=Bridge_LAN interface=Port5_Lan
/ip neighbor discovery-settings
set discover-interface-list=all
/interface wireless cap
# 
set bridge=Bridge_LAN discovery-interfaces=Bridge_LAN enabled=yes interfaces=\
    wlan1,wlan2
/ip dhcp-client
add comment=defconf interface=Bridge_LAN
/ip firewall filter
add action=log chain=icmp comment=\
    "======================================================================" \
    disabled=yes
add action=log chain=icmp comment=\
    "                                     -= its a PA2 =-" disabled=yes
add action=log chain=icmp comment=\
    "                                    -= Changed - 17/05/2025=-" disabled=\
    yes
add action=log chain=icmp comment=\
    "                  -= +38 (067) 546-76-03 / oleksandr.nosar@gmail.com =-" \
    disabled=yes
add action=log chain=icmp comment=\
    "======================================================================" \
    disabled=yes
/ip service
set telnet disabled=yes
set ftp disabled=yes
set ssh disabled=yes
set api disabled=yes
set winbox port=57572
set api-ssl disabled=yes
/system clock
set time-zone-name=Europe/Kiev
/system identity
set name=PA2_HAP_AC2
/system note
set show-at-login=no
/system script
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
add dont-require-permissions=no name=ExportConfig owner=admin policy=\
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
