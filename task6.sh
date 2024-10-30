#!/bin/bash

# Get current date and time
current_date=$(date)

# Get current user
current_user=$(whoami)

# Get internal IP address (macOS compatible)
internal_ip=$(ifconfig | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2}')

# Get hostname
hostname=$(hostname)

# Get external IP address (check for curl and internet connection)
if ! command -v curl &> /dev/null; then
    external_ip="curl not installed"
else
    external_ip=$(curl -s ifconfig.me)
    if [[ -z "$external_ip" ]]; then
        external_ip="No internet connection"
    fi
fi

# Get macOS version (instead of Linux distribution)
os_name="macOS"
os_version=$(sw_vers -productVersion)

# Get system uptime (macOS compatible)
system_uptime=$(uptime | awk -F, '{print $1}' | sed 's/.*up //')

# Get disk usage for root (/)
disk_usage=$(df -h / | awk 'NR==2 {print $3 " used, " $4 " free"}')

# Get total and free RAM (macOS compatible using vm_stat)
memory_free=$(vm_stat | grep free | awk '{print $3}' | sed 's/\.//')
memory_used=$(vm_stat | grep active | awk '{print $3}' | sed 's/\.//')
memory_free_gb=$(echo "$memory_free*4096/1024/1024/1024" | bc -l | awk '{printf "%.2f", $1}')
memory_used_gb=$(echo "$memory_used*4096/1024/1024/1024" | bc -l | awk '{printf "%.2f", $1}')
ram_info="${memory_used_gb} GB used, ${memory_free_gb} GB free"

# Get CPU info: number of cores and frequency (macOS compatible using sysctl)
cpu_cores=$(sysctl -n hw.ncpu)
cpu_frequency=$(sysctl -n hw.cpufrequency | awk '{print $1/1000000 " MHz"}')

# Print the report to the terminal
echo "----------------------------------------"
echo "System Report - $(date)"
echo "----------------------------------------"
echo "Current Date and Time: $current_date"
echo "Current User: $current_user"
echo "Internal IP Address: $internal_ip"
echo "Hostname: $hostname"
echo "External IP Address: $external_ip"
echo "OS Name: $os_name"
echo "OS Version: $os_version"
echo "System Uptime: $system_uptime"
echo "Disk Usage in /: $disk_usage"
echo "RAM Info: $ram_info"
echo "CPU Cores: $cpu_cores"
echo "CPU Frequency: $cpu_frequency"
echo "----------------------------------------"

