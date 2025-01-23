**Server Monitoring Script Overview**

### **Introduction**
This server monitoring script helps in tracking server health and performance effectively. Below are the key components and their purposes, formatted for better understanding and implementation.

---
##Pratik's File 
### **Key Features of the Script**

#### **1. Script Purpose and Date**
```bash
# Server Monitoring Script
# Date: 2025-01-23
```
- **Purpose:** Monitor server uptime, processes, disk usage, and network traffic.

#### **2. Server Uptime**
```bash
uptime > uptime.log
```
- **Logs server uptime** into a file named `uptime.log`.

#### **3. Top 5 Processes**
```bash
top -b -n 1 | head -n 5 > top.log
```
- **Captures the top 5 CPU/memory-intensive processes** and saves them in `top.log`.

#### **4. Disk Usage**
```bash
df -h > df.log
```
- **Generates human-readable disk usage** statistics in `df.log`.

#### **5. Network Traffic**
```bash
netstat -s | grep -i "Packets:received" > netstat.log
```
- **Logs received network packets** to `netstat.log`.

#### **6. Script Outputs**
Below are the formatted commands to display the logged information.

- **Server Uptime:**
  ```bash
  echo "-------------------------"
  echo "🕒 Server Uptime:"
  cat uptime.log
  ```

- **Top Processes:**
  ```bash
  echo "-------------------------"
  echo "🔥 Top 5 Processes:"
  cat top.log
  ```

- **Disk Usage:**
  ```bash
  echo "-------------------------"
  echo "🗀 Disk Usage:"
  cat df.log
  ```

- **Network Traffic:**
  ```bash
  echo "-------------------------"
  echo "🌐 Network Traffic:"
  cat netstat.log
  ```

---

### **Additional Monitoring Commands**

- **Memory Usage:**
  ```bash
  echo "-------------------------"
  echo "🧠 Memory Usage:"
  free -h | awk '/^Mem/ {print "Used: " $3 " / Total: " $2}'
  ```

- **CPU Information:**
  ```bash
  echo "-------------------------"
  echo "⚙️ CPU Information:"
  lscpu | grep -E '^(Model name|CPU\(s\):|Thread\(s\) per core:|Core\(s\) per socket:)'
  ```

- **Detailed Running Processes:**
  ```bash
  echo "-------------------------"
  echo "🗋 Detailed Running Processes:"
  ps aux --sort=-%mem | head -n 10 | awk '{print $1, $2, $3, $4, $11}'
  ```

- **Active Network Connections:**
  ```bash
  echo "-------------------------"
  echo "🔗 Active Network Connections:"
  ss -tuln | head -n 10
  ```

- **Disk I/O Stats:**
  ```bash
  echo "-------------------------"
  echo "📊 Disk I/O Stats:"
  iostat -xz 1 3 | awk 'NR==4 || /Device:/ || /sda/'
  ```

- **System Logs:**
  ```bash
  echo "-------------------------"
  echo "🗒 System Logs (Last 10 Lines):"
  tail -n 10 /var/log/syslog | grep -v "kernel"
  ```

---

### **Conclusion**
This script provides comprehensive server monitoring, helping you keep track of critical performance metrics in a structured and efficient manner. Use it to proactively manage and troubleshoot server performance.

---

