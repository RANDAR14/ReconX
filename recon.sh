#!/bin/bash
echo "Enter target IP or domain:"
read target

mkdir -p results
timestamp=$(date +"%Y%m%d_%H%M%S")
outfile="results/${target}_${timestamp}.txt"

echo "[+] Starting Nmap scan on $target..."
nmap -sV -sC -T4 -oN "$outfile" "$target"

echo ""
echo "[+] Scan complete. Results saved to $outfile"
echo "[+] Open ports summary:"
grep "open" "$outfile"
