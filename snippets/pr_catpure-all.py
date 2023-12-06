from scapy.all import *
def packet_handler(packet):
    if packet.haslayer(Dot11ProbeReq):
            source_mac = packet.addr2
            ssid = packet.info.decode('utf-8', errors='ignore')
            signal_strength = packet.dBm_AntSignal
            timestamp = packet.time

            print(f"Probe Request from {source_mac} for SSID: {ssid} | Signal Strength: {signal_strength} dBm | Timestamp: {timestamp}")

sniff(iface='wlan1mon', prn=packet_handler, store=0)
