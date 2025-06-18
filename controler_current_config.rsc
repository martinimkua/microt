# 2025-06-01 09:19:10 by RouterOS 7.19
# software id = IZ4N-0J1S
#
# model = RBD53iG-5HacD2HnD
# serial number = HGH09VD8D4E
/caps-man channel
add band=2ghz-b/g/n control-channel-width=20mhz frequency=2412 name=\
    Channel_24 save-selected=yes skip-dfs-channels=yes
add band=5ghz-onlyac control-channel-width=20mhz extension-channel=XXXX \
    frequency=5220 name=Channel_50 save-selected=yes
/interface bridge
add admin-mac=D4:01:C3:BF:98:56 auto-mac=no name=Bridge_LAN
/interface wireless
# managed by CAPsMAN
# channel: 2412/20-Ce/gn(27dBm), SSID: YAROSLAV, CAPsMAN forwarding
set [ find default-name=wlan1 ] ssid=MikroTik
# managed by CAPsMAN
# channel: 5220/20-eeCe/ac(24dBm), SSID: YAROSLAV, CAPsMAN forwarding
set [ find default-name=wlan2 ] ssid=MikroTik
/interface ethernet
set [ find default-name=ether1 ] name=Port1_Wan
set [ find default-name=ether2 ] name=Port2_Lan
set [ find default-name=ether3 ] name=Port3_Lan
set [ find default-name=ether4 ] name=Port4_Lan
set [ find default-name=ether5 ] name=Port5_Lan
/interface veth
add address=192.168.1.250/24 gateway=192.168.1.1 gateway6="" name=\
    veth-telegram
/caps-man datapath
add bridge=Bridge_LAN client-to-client-forwarding=yes name=Datapath_Main
/caps-man security
add authentication-types=wpa2-psk encryption=aes-ccm name=Main
/caps-man configuration
add channel=Channel_24 country="united states" datapath=Datapath_Main \
    distance=indoors guard-interval=long hw-protection-mode=cts-to-self \
    keepalive-frames=enabled max-sta-count=20 mode=ap multicast-helper=full \
    name=Cfg_24 rx-chains=0,1,2,3 security=Main ssid=YAROSLAV tx-chains=\
    0,1,2,3
add channel=Channel_50 country="united states" datapath=Datapath_Main \
    distance=indoors guard-interval=long hw-protection-mode=none \
    installation=indoor keepalive-frames=enabled max-sta-count=20 mode=ap \
    multicast-helper=full name=Cfg_50 rx-chains=0,1,2,3 security=Main ssid=\
    YAROSLAV tx-chains=0,1,2,3
/caps-man interface
add configuration=Cfg_24 disabled=no l2mtu=1600 mac-address=D4:01:C3:BF:98:5A \
    master-interface=none name=Controller_2.4 radio-mac=D4:01:C3:BF:98:5A \
    radio-name=D401C3BF985A
add configuration=Cfg_50 disabled=no l2mtu=1600 mac-address=D4:01:C3:BF:98:5B \
    master-interface=none name=Controller_5.0 radio-mac=D4:01:C3:BF:98:5B \
    radio-name=D401C3BF985B
add configuration=Cfg_50 disabled=no mac-address=CC:2D:E0:3E:90:CF \
    master-interface=none name=MikroTik-1 radio-mac=CC:2D:E0:3E:90:CF \
    radio-name=CC2DE03E90CF
add configuration=Cfg_24 disabled=no l2mtu=1600 mac-address=64:D1:54:FF:56:61 \
    master-interface=none name=MikroTik-2 radio-mac=64:D1:54:FF:56:61 \
    radio-name=64D154FF5661
add configuration=Cfg_50 disabled=no l2mtu=1600 mac-address=64:D1:54:FF:56:60 \
    master-interface=none name=MikroTik-3 radio-mac=64:D1:54:FF:56:60 \
    radio-name=64D154FF5660
add configuration=Cfg_24 disabled=no l2mtu=1600 mac-address=B8:69:F4:6C:10:2D \
    master-interface=none name=PA1_WAP_AC_2.4 radio-mac=B8:69:F4:6C:10:2D \
    radio-name=B869F46C102D
add configuration=Cfg_50 disabled=no l2mtu=1600 mac-address=B8:69:F4:6C:10:2C \
    master-interface=none name=PA1_WAP_AC_5.0 radio-mac=B8:69:F4:6C:10:2C \
    radio-name=B869F46C102C
add configuration=Cfg_24 disabled=no l2mtu=1600 mac-address=74:4D:28:83:84:F7 \
    master-interface=none name=PA2_HAP_AC2_2.4 radio-mac=74:4D:28:83:84:F7 \
    radio-name=744D288384F7
add configuration=Cfg_50 disabled=no l2mtu=1600 mac-address=74:4D:28:83:84:F8 \
    master-interface=none name=PA2_HAP_AC2_5.0 radio-mac=74:4D:28:83:84:F8 \
    radio-name=744D288384F8
add configuration=Cfg_24 disabled=no l2mtu=1600 mac-address=CC:2D:E0:1D:0D:8B \
    master-interface=none name=PA3_WAP_AC_2.4 radio-mac=CC:2D:E0:1D:0D:8B \
    radio-name=CC2DE01D0D8B
add configuration=Cfg_50 disabled=no l2mtu=1600 mac-address=CC:2D:E0:1D:0D:8A \
    master-interface=none name=PA3_WAP_AC_5.0 radio-mac=CC:2D:E0:1D:0D:8A \
    radio-name=CC2DE01D0D8A
add configuration=Cfg_24 disabled=no mac-address=64:D1:54:FF:56:5F \
    master-interface=none name=PA4_WAP_AC_2.4 radio-mac=64:D1:54:FF:56:5F
add configuration=Cfg_50 disabled=no mac-address=64:D1:54:FF:56:5E \
    master-interface=none name=PA4_WAP_AC_5.0 radio-mac=64:D1:54:FF:56:5E
/interface list
add name=WAN
add name=LAN
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add comment=Admin_network name=Home_pool ranges=192.168.1.20-192.168.1.254
/ip dhcp-server
add address-pool=Home_pool interface=Bridge_LAN lease-time=1d name=Home_SRV
/system logging action
set 0 memory-lines=5000
/caps-man access-list
add action=accept allow-signal-out-of-range=10s comment=\
    "All ACCEPT -70 or more" disabled=yes interface=any signal-range=-70..120
add action=reject allow-signal-out-of-range=10s comment=\
    "All DROP -80 and more" disabled=yes interface=any signal-range=-120..-80
/caps-man manager
set enabled=yes
/caps-man provisioning
add action=create-enabled comment=ALL hw-supported-modes=gn \
    master-configuration=Cfg_24 name-format=prefix-identity
add action=create-enabled comment=ALL hw-supported-modes=ac \
    master-configuration=Cfg_50 name-format=prefix-identity
/interface bridge port
add bridge=Bridge_LAN interface=Port2_Lan
add bridge=Bridge_LAN interface=Port3_Lan
add bridge=Bridge_LAN interface=Port4_Lan
add bridge=Bridge_LAN interface=Port5_Lan
add bridge=Bridge_LAN interface=veth-telegram
/ipv6 settings
set allow-fast-path=no disable-ipv6=yes forward=no
/interface wireless cap
# 
set discovery-interfaces=Bridge_LAN enabled=yes interfaces=wlan1,wlan2
/ip address
add address=192.168.1.1/24 comment=Admin_network interface=Bridge_LAN \
    network=192.168.1.0
/ip cloud
set ddns-enabled=yes ddns-update-interval=10m
/ip dhcp-client
add interface=Port1_Wan use-peer-dns=no
/ip dhcp-server lease
add address=192.168.1.2 client-id=1:b8:69:f4:6c:10:2b mac-address=\
    B8:69:F4:6C:10:2B server=Home_SRV
add address=192.168.1.3 client-id=1:74:4d:28:83:84:f2 mac-address=\
    74:4D:28:83:84:F2 server=Home_SRV
add address=192.168.1.4 client-id=1:cc:2d:e0:1d:d:89 mac-address=\
    CC:2D:E0:1D:0D:89 server=Home_SRV
add address=192.168.1.8 client-id=1:48:a9:8a:2a:ba:8c mac-address=\
    48:A9:8A:2A:BA:8C server=Home_SRV
add address=192.168.1.7 client-id=1:c4:ad:34:e3:5d:b mac-address=\
    C4:AD:34:E3:5D:0B server=Home_SRV
add address=192.168.1.5 client-id=1:f4:1e:57:95:db:cb disabled=yes \
    mac-address=F4:1E:57:95:DB:CB server=Home_SRV
add address=192.168.1.226 client-id=1:c0:39:5a:55:bf:c5 mac-address=\
    C0:39:5A:55:BF:C5 server=Home_SRV
add address=192.168.1.5 client-id=1:f4:1e:57:95:db:cb disabled=yes \
    mac-address=F4:1E:57:95:DB:CB server=Home_SRV
/ip dhcp-server network
add address=192.168.1.0/24 dns-server=192.168.1.1 gateway=192.168.1.1
/ip dns
set allow-remote-requests=yes servers=8.8.8.8,8.8.4.4
/ip firewall filter
add action=log chain=icmp comment=\
    "======================================================================" \
    disabled=yes
add action=log chain=icmp comment=\
    "                                     -= its a MAIN on hap AC3 =-" \
    disabled=yes
add action=log chain=icmp comment=\
    "                                    -= Changed - 17/05/2025=-" disabled=\
    yes
add action=log chain=icmp comment=\
    "                  -= +38 (067) 546-76-03 / oleksandr.nosar@gmail.com =-" \
    disabled=yes
add action=log chain=icmp comment=\
    "======================================================================" \
    disabled=yes
add action=accept chain=input comment=">> Myconf: accept ICMP Normal Ping" \
    disabled=yes limit=50/5s,2:packet protocol=icmp
add action=accept chain=input comment=">> Myconf: accept Winbox Main" \
    disabled=yes dst-port=57572 log-prefix=ACCEPT_WinBox protocol=tcp
add action=accept chain=input comment=\
    ">> Myconf: accept established,related,untracked" connection-state=\
    established,related,untracked disabled=yes
add action=accept chain=input comment=\
    ">> Myconf: accept to local loopback (for CAPsMAN)" disabled=yes \
    dst-address=127.0.0.1
add action=drop chain=input comment=">> Myconf: drop all from WAN" disabled=\
    yes in-interface=Port1_Wan log-prefix="DROP ALL Input from WAN"
add action=fasttrack-connection chain=forward comment=\
    ">> Myconf: accept fasttrack" connection-state=established,related \
    hw-offload=yes
add action=accept chain=forward comment=\
    ">> Myconf: accept established,related, untracked" connection-state=\
    established,related,untracked disabled=yes
add action=drop chain=forward comment=">> Myconf: drop all from WAN" \
    connection-nat-state=!dstnat in-interface-list=WAN log=yes log-prefix=\
    "DROP ALL Forward from WAN"
add action=log chain=icmp comment=\
    "======================================================================" \
    disabled=yes
/ip firewall nat
add action=log chain=icmp comment=\
    "======================================================================" \
    disabled=yes
add action=masquerade chain=srcnat comment=">> Myconf: internet All" \
    out-interface=Port1_Wan
add action=log chain=icmp comment=\
    "======================================================================" \
    disabled=yes
/ip firewall service-port
set tftp disabled=yes
set h323 disabled=yes
set sip disabled=yes
/ip hotspot service-port
set ftp disabled=yes
/ip service
set ftp disabled=yes
set ssh disabled=yes
set telnet disabled=yes
set www disabled=yes port=8573
set api disabled=yes
set api-ssl disabled=yes
set winbox port=57572
/system clock
set time-zone-name=Europe/Kyiv
/system identity
set name=Controller_AC3
/system logging
set 0 topics=info,!dhcp,!wireless
/system routerboard settings
set auto-upgrade=yes
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
