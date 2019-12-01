#!/bin/bash

ifconfig
tcpreplay -v --intf1=eth0 /app/output.pcap