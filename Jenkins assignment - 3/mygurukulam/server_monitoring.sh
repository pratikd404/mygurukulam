#!/bin/bash

# सर्वर मॉनिटरिंग स्क्रिप्ट
# दिनांक: 2025-01-23

# सर्वर अपटाइम को uptime.log फाइल में सेव करेंगे
uptime > uptime.log

# टॉप 5 प्रोसेसेस को top.log में स्टोर करेंगे
top -b -n 1 | head -n 5 > top.log

# डिस्क उपयोग का आउटपुट df.log में
df -h > df.log

# नेटवर्क ट्रैफिक पैकेट्स को netstat.log में
netstat -s | grep -i "Packets:received" > netstat.log

# अपटाइम का आउटपुट दिखाइए
echo "-------------------------"
echo "🕒 सर्वर अपटाइम:"
cat uptime.log

# टॉप प्रोसेसेस का आउटपुट
echo "-------------------------"
echo "🔥 टॉप 5 प्रोसेसेस:"
cat top.log

# डिस्क उपयोग का आउटपुट
echo "-------------------------"
echo "💾 डिस्क उपयोग:"
cat df.log

# नेटवर्क ट्रैफिक का आउटपुट
echo "-------------------------"
echo "🌐 नेटवर्क ट्रैफिक:"
cat netstat.log

# मेमोरी उपयोग
echo "-------------------------"
echo "🧠 मेमोरी उपयोग:"
free -h | awk '/^Mem/ {print "Used: " $3 " / Total: " $2}'

# CPU जानकारी
echo "-------------------------"
echo "⚙️ CPU जानकारी:"
lscpu | grep -E '^(Model name|CPU\(s\):|Thread\(s\) per core:|Core\(s\) per socket:)'

# विस्तृत रनिंग प्रोसेसेस
echo "-------------------------"
echo "📋 विस्तृत रनिंग प्रोसेसेस:"
ps aux --sort=-%mem | head -n 10 | awk '{print $1, $2, $3, $4, $11}'

# सक्रिय नेटवर्क कनेक्शन
echo "-------------------------"
echo "🔗 सक्रिय नेटवर्क कनेक्शन:"
ss -tuln | head -n 10

# डिस्क I/O स्टैट्स
echo "-------------------------"
echo "📊 डिस्क I/O स्टैट्स:"
iostat -xz 1 3 | awk 'NR==4 || /Device:/ || /sda/'

# सिस्टम लॉग्स
#echo "-------------------------"
#echo "📝 सिस्टम लॉग्स (अंतिम 10 लाइनें):"
#tail -n 10 /var/log/syslog | grep -v "kernel"
