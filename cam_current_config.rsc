# 2025-06-01 09:27:06 by RouterOS 7.19.1
# software id = 2TWK-6JB5
#
# model = RBwAPG-5HacT2HnD
# serial number = 7DF307E37676
/interface bridge
add admin-mac=64:D1:54:FF:56:5F auto-mac=no comment=defconf name=bridgeLocal \
    port-cost-mode=short
/interface wireless
# managed by CAPsMAN
# channel: 2412/20-Ce/gn(28dBm), SSID: YAROSLAV, CAPsMAN forwarding
set [ find default-name=wlan1 ] ssid=MikroTik
# managed by CAPsMAN
# channel: 5220/20-eeCe/ac(28dBm), SSID: YAROSLAV, CAPsMAN forwarding
set [ find default-name=wlan2 ] ssid=MikroTik
/interface lte apn
set [ find default=yes ] ip-type=ipv4 use-network-apn=no
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/interface bridge port
add bridge=bridgeLocal comment=defconf ingress-filtering=no interface=ether1 \
    internal-path-cost=10 path-cost=10
/ip firewall connection tracking
set udp-timeout=10s
/ip settings
set max-neighbor-entries=8192
/ipv6 settings
set disable-ipv6=yes max-neighbor-entries=8192
/interface ovpn-server server
add auth=sha1,md5 mac-address=FE:C5:0F:60:FB:DA name=ovpn-server1
/interface wireless cap
# 
set bridge=bridgeLocal caps-man-addresses=192.168.1.1 discovery-interfaces=\
    ether1 enabled=yes interfaces=wlan1,wlan2
/ip address
add address=192.168.1.10/24 interface=bridgeLocal network=192.168.1.0
/ip dns
set servers=8.8.8.8,8.8.4.4
/ip ipsec profile
set [ find default=yes ] dpd-interval=2m dpd-maximum-failures=5
/ip route
add gateway=192.168.1.1
/ip service
set ssh disabled=yes
set telnet disabled=yes
set www disabled=yes
set api disabled=yes
set api-ssl disabled=yes
/routing bfd configuration
add disabled=no interfaces=all min-rx=200ms min-tx=200ms multiplier=5
/system clock
set time-zone-name=Europe/Kiev
/system identity
set name=wap_cam
