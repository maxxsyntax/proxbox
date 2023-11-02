import scapy.all as scapy
import time

# Function to process probe requests
def process_probe_request(pkt, probe_requests):
    if pkt.haslayer(scapy.Dot11ProbeReq):
        source_address = pkt.addr2
        ssid = pkt.info.decode('utf-8', errors='ignore')
        signal_strength = pkt.dBm_AntSignal
        timestamp = pkt.time

        if source_address in probe_requests:
            probe_requests[source_address]['ssids'].append(ssid)
            probe_requests[source_address]['last_timestamp'] = timestamp
        else:
            probe_requests[source_address] = {
                'ssids': [ssid],
                'first_timestamp': timestamp,
                'last_timestamp': timestamp,
                'signal_strength': signal_strength
            }

# Create an empty dictionary to store probe request information
probe_requests = {}

while True:
    # Sniff for probe requests for 1 second
    scapy.sniff(iface="wlan1mon", prn=lambda pkt: process_probe_request(pkt, probe_requests), timeout=1)

    for source_address, data in probe_requests.items():
        if len(data['ssids']) > 0:
            time_diff = data['last_timestamp'] - data['first_timestamp']
            print(f"Source Address: {source_address}")
            print(f"SSIDs Requested: {', '.join(data['ssids'])}")
            print(f"Time Difference: {time_diff:.2f} seconds")
            print(f"Signal Strength: {data['signal_strength']} dBm")
            print()

    # Clear the probe_requests dictionary for the next round
    probe_requests = {}
