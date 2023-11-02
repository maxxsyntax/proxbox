#Use for Debugging
from scapy.all import *
# Dictionary to store SSIDs and their signal strengths
ssid_signal_dict = {}

# Function to handle captured probe request packets
def packet_handler(packet):
    if packet.haslayer(Dot11ProbeReq):
        # Extract the source MAC address, SSID, signal strength, and timestamp
        source_mac = packet.addr2
        ssid = packet.info.decode('utf-8', errors='ignore')
        signal_strength = packet.dBm_AntSignal
        timestamp = packet.time

        # Display the results for all SSIDs and signal strengths
        print(f"Probe Request from {source_mac} for SSID: {ssid} | Signal Strength: {signal_strength} dBm")

        # Store SSID and signal strength in the dictionary
        if source_mac not in ssid_signal_dict:
            ssid_signal_dict[source_mac] = []
        ssid_signal_dict[source_mac].append((ssid, signal_strength))

        # Check if there are more than 3 unique SSIDs
        if len(ssid_signal_dict[source_mac]) > 3:
            print("BURST!")

# Sniff Wi-Fi packets on the specified interface
# You can change 'wlan0' to your wireless interface
sniff(iface='wlan0mon', prn=packet_handler, store=0)
