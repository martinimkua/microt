# jun/01/2025 09:21:44 by RouterOS 6.49.18
# software id = 3M4U-EUDU
#
# model = RB960PGS-PB
# serial number = HDM08TEMBNY
/interface bridge
add admin-mac=48:A9:8A:2A:BA:8C auto-mac=no name=Bridge_LAN
/interface ethernet
set [ find default-name=ether1 ] name=Port1_Lan
set [ find default-name=ether2 ] name=Port2_Lan poe-out=forced-on
set [ find default-name=ether3 ] name=Port3_Lan poe-out=forced-on
set [ find default-name=ether4 ] name=Port4_Lan poe-out=forced-on
set [ find default-name=ether5 ] name=Port5_Lan poe-out=forced-on
set [ find default-name=sfp1 ] disabled=yes
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
/ip dhcp-client
add comment=defconf disabled=no interface=Bridge_LAN
/ip firewall filter
add action=log chain=icmp comment=\
    "======================================================================" \
    disabled=yes
add action=log chain=icmp comment=\
    "                                     -= its a Switch2_RB960 =-" \
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
set name=Switch2_RB960
/system package update
set channel=long-term
/system script
add dont-require-permissions=no name=ExportConfig owner=tmp01 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="\
    \r\
    \n##   Date create 17/05/2025\r\
    \n\r\
    \n{\r\
    \n\t:global filename \"\";\r\
    \n\t:global sysname [/system identity get name];\r\
    \n\t:global date [/system clock get date];\r\
    \n\t:global time [/system clock get time];\r\
    \n\t:global months (\"jan\",\"feb\",\"mar\",\"apr\",\"may\",\"jun\",\"jul\
    \",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\");\r\
    \n\t:global hour [:pick \$time 0 2];\r\
    \n\t:global min [:pick \$time 3 5];\r\
    \n\t:global sec [:pick \$time 6 8];\r\
    \n\t:global month [:pick \$date 0 3];\r\
    \n\t:set month ([ :find \$months \$month -1 ] + 1);\r\
    \n\t:if (\$month < 10) do={ :set month (\"0\" . \$month); }\r\
    \n\t:global day [:pick \$date 4 6];\r\
    \n\t:global year [:pick \$date 7 11];\r\
    \n\t:set filename (sysname . \"_\".\$day.\"-\".\$month.\"-\".\$year.\"_(\"\
    .\$hour.\"-\".\$min.\"-\".\$sec.\")\");\r\
    \n\t/system backup save name=\"\$filename\";\r\
    \n\t/export terse file=\"\$filename.terse\";\r\
    \n\t:log info \">> Export_Config\";\r\
    \n}\r\
    \n\r\
    \n"
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
