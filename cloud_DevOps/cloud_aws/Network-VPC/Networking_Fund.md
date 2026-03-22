



# IP Addressing, Subnetting & Protocols


## 🌐 What is Networking? (Very Simple)

Networking means:

> **Connecting computers so they can talk to each other**

Examples:

* Your mobile connected to Wi-Fi
* Laptop accessing a website
* Cloud server talking to a database

👉 Without networking, **cloud and DevOps do not exist**

---

##  IP Addressing & Subnetting 

### What is an IP Address? (Layman Explanation)

An IP address is:

> **The home address of a computer on a network**

Just like:

* House address helps postman
* IP address helps data reach the correct computer

Example:

```
192.168.1.10
```

* 4 numbers
* Each number: 0 to 255

---

### Private IP Addresses (Inside Companies)

These are **not visible on the internet**.

| Range                         | Usage                |
| ----------------------------- | -------------------- |
| 10.0.0.0 – 10.255.255.255     | Large companies      |
| 172.16.0.0 – 172.31.255.255   | Medium networks      |
| 192.168.0.0 – 192.168.255.255 | Home / small offices |

💡 Your home Wi-Fi router usually gives `192.168.x.x`

---

### Public IP Addresses (Internet Facing)

* Used by websites and cloud servers
* Given by ISP or cloud provider
* Anyone on the internet can reach them (if allowed)

💡 Example: Google server IP

---

### What is Subnetting? (Simple Reason)

Subnetting means:

> **Dividing a big network into smaller parts**

Why?

* Better security
* Better organization
* Easier management

---

### Practical Subnet Example

Company network:

```
192.168.0.0 – 192.168.0.255 (256 IPs)
```

Divide into:

* Dev subnet → `192.168.0.0 – 192.168.0.127`
* Prod subnet → `192.168.0.128 – 192.168.0.255`

👉 Dev and Prod are **isolated**

---

### CIDR Notation (Just Understand, Don’t Calculate)

| CIDR | Meaning |
| ---- | ------- |
| /24  | 256 IPs |
| /25  | 128 IPs |

Examples:

```
192.168.0.0/24
192.168.0.0/25
192.168.0.128/25
```

---

### Practical Thinking Exercise

Company network:

```
10.0.0.0/16
```

Split into:

* 10.0.0.0/24
* 10.0.1.0/24
* 10.0.2.0/24

💡 Each department gets its **own subnet**

---

##  TCP/IP & Basic Protocols (1 Hour)

### TCP/IP Model (Conceptual – Easy Version)

| Layer       | What Happens Here    | Examples         |
| ----------- | -------------------- | ---------------- |
| Application | What users see       | HTTP, HTTPS, SSH |
| Transport   | How data is sent     | TCP, UDP         |
| Internet    | Addressing & routing | IP               |
| Link        | Physical connection  | Wi-Fi, Ethernet  |

---

### TCP vs UDP (Simple Difference)

| TCP          | UDP                |
| ------------ | ------------------ |
| Reliable     | Fast               |
| Slower       | Less reliable      |
| Used for web | Used for streaming |

---

### Common Protocols (Must Remember)

| Protocol | Purpose             | Port  |
| -------- | ------------------- | ----- |
| HTTP     | Website             | 80    |
| HTTPS    | Secure website      | 443   |
| SSH      | Login to Linux      | 22    |
| DNS      | Name → IP           | 53    |
| DHCP     | Auto IP             | 67/68 |
| FTP      | File transfer (old) | 21    |

---

### What Happens When You Type [www.google.com](http://www.google.com)?

1. DNS converts name → IP
2. Browser connects to port 443
3. HTTPS request sent
4. Data travels via Wi-Fi/Ethernet

👉 This happens in **milliseconds**

---

## ✅ Key Takeaway (README–1)

✔ Understand IP addresses
✔ Know private vs public IPs
✔ Understand subnetting concept
✔ Know common protocols & ports

---


### What is a VPC? (Layman Explanation)

VPC means:

> **Your own private network inside the cloud**

Just like:

* Office network inside a building
* Only authorized people allowed

Example:

```
VPC: 10.0.0.0/16
```

---

### Subnets in Cloud

#### Public Subnet

* Has public IP
* Can access internet
* Used for:

  * Web servers

#### Private Subnet

* No public IP
* Hidden from internet
* Used for:

  * Databases
  * Internal services

---

### Security Groups (Cloud Firewall)

Security group controls:

* Who can connect
* Which port is allowed

Example:

* Allow port 80 → website access
* Allow port 22 → admin login

---

### Simple Security Group Meaning

Inbound Rule:

```
Allow TCP 80 from anywhere
```

👉 Anyone can access website

Outbound Rule:

```
Allow all traffic
```

👉 Server can talk to internet

---

### Simple Cloud Network Example

```
VPC: 10.0.0.0/16
├── Public Subnet: 10.0.1.0/24
│   └── Web Server
│       └── SG: 80, 443, 22 (admin only)
└── Private Subnet: 10.0.2.0/24
    └── Database
        └── SG: 3306 from web subnet only
```

---

### Internet Gateway & NAT (Basic Idea)

* **Internet Gateway** → Connects public subnet to internet
* **NAT Gateway** → Allows private subnet to access internet **without being exposed**

💡 Like:

* Public door vs backdoor with guard

---
