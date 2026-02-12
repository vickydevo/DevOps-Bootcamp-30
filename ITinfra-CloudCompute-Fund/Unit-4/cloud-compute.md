# Unit 4: Cloud Computing Basics - AWS/Azure (Hands-on)
Duration: 8 hours
Mode: 2 hrs Lecture + 1 hr Demo + 5 hrs Hands-on Lab

# 📘 README-1

# Unit 4.1: Cloud Fundamentals (AWS / Azure)

**Duration:** 1 Hour
**Mode:** Lecture
**Learning Outcome:** LO4

---

## 🌍 What is Cloud Computing? (Very Simple Meaning)

Cloud computing means:

> **Using someone else’s computer over the internet and paying only for what you use**

Instead of:

* Buying servers
* Maintaining hardware
* Paying electricity bills

You **rent servers from companies like AWS or Azure**.

💡 Example:

* Owning a bike vs booking Ola/Uber
* Buying a generator vs using BESCOM electricity

---

## ❓ Why Cloud? (With Real-Life Examples)

### 1️⃣ No Hardware to Buy

* No server room
* No AC
* No UPS

👉 Everything is already maintained by cloud provider

---

### 2️⃣ Scale Instantly

* Need more CPU/RAM? → Click a button
* Need 10 servers? → Ready in minutes

💡 Example:
During online exams, college website traffic increases suddenly.

---

### 3️⃣ Pay Per Use

* Pay only for:

  * Hours used
  * Storage used
* Stop server → cost stops

💡 Like mobile recharge – pay only what you use

---

### 4️⃣ Global Availability

* Deploy servers in:

  * India
  * US
  * Europe

⚠ Trade-offs:

* Latency
* Data laws
* Compliance issues

---

## ☁ Cloud Service Models (Very Important for Interviews)

### IaaS – Infrastructure as a Service

| You Manage     | Provider Manages  |
| -------------- | ----------------- |
| OS, Apps, Data | Hardware, Network |

**Example:** AWS EC2, Azure VM
**Cost:** Medium

💡 You rent a **raw computer**

---

### PaaS – Platform as a Service

| You Manage         | Provider Manages     |
| ------------------ | -------------------- |
| Application & Data | OS, runtime, servers |

**Example:** AWS Elastic Beanstalk, Azure App Service
**Cost:** High

💡 Just upload code, cloud runs it

---

### SaaS – Software as a Service

| You Manage | Provider Manages |
| ---------- | ---------------- |
| Nothing    | Everything       |

**Example:** Gmail, Office 365, Salesforce
**Cost:** Expensive

💡 Just login and use

---

## 🔐 Shared Responsibility Model (CRITICAL CONCEPT)

### Cloud Provider is Responsible For:

* Physical security (guards, locks)
* Data center
* Hardware
* Virtualization layer

---

### YOU are Responsible For:

* OS updates
* Application security
* User access (IAM)
* Data encryption
* Firewall rules

⚠ **BIG MISTAKE TO AVOID:**
Cloud provider does **NOT** secure your VM automatically.

---

## ✅ Key Takeaway (Unit 4.1)

✔ Cloud = rent, don’t buy
✔ Know IaaS, PaaS, SaaS clearly
✔ Security is **shared**, not fully cloud’s job

---

---

# 📘 README-2

# Unit 4.2: Compute – Virtual Machines (AWS EC2 / Azure VM)

**Duration:** 2 Hours
**Mode:** Lecture + Demo
**Learning Outcome:** LO4

---

## 🖥 What is a Virtual Machine? (Layman Explanation)

A VM is:

> **A rented computer running inside a data center**

You choose:

* CPU
* RAM
* Storage
* OS

💡 Like renting a hotel room instead of buying a house

---

## AWS EC2 vs Azure VM

* Same concept
* Different names and UI
* Both support:

  * Linux
  * Windows

👉 Skills are transferable

---

## 🧠 Instance Types (Just Categories – No Deep Specs)

| Type              | Use                  |
| ----------------- | -------------------- |
| General Purpose   | Learning, small apps |
| Compute Optimized | Heavy CPU            |
| Memory Optimized  | Large RAM apps       |

👉 For students → **General Purpose only**

---

## 🛠 VM Creation Flow (Step-by-Step Understanding)

1️⃣ Choose **Region**

* Example: Mumbai, Bangalore

2️⃣ Choose **AMI**

* OS template
* Example: Ubuntu 22.04

3️⃣ Choose **Instance Type**

* CPU + RAM

4️⃣ Security Group

* Firewall rules

5️⃣ Key Pair

* Used for SSH login

6️⃣ Launch VM

* Ready in ~2 minutes

7️⃣ SSH into VM

* Linux terminal access

---

## 🔑 Secure Access (SSH Concept)

* Password login is risky
* Key-based login is secure

```bash
ssh -i key.pem ubuntu@public-ip
```

💡 Like:

* Password → normal lock
* Key → biometric lock

---

## 💰 Cost Awareness (VERY IMPORTANT)

| Instance | Approx Cost |
| -------- | ----------- |
| t2.micro | ~$9/month   |
| t2.small | ~$17/month  |

⚠ **Always stop/terminate** unused VMs

---

## ✅ Key Takeaway (Unit 4.2)

✔ VM = rented server
✔ Security group = firewall
✔ Key pair = secure login
✔ Cost control is your responsibility

---

---

# 📘 README-3

# Unit 4.3 & 4.4: Storage, Networking & Hands-on Labs

**Duration:** 5 Hours
**Mode:** Hands-on Lab
**Learning Outcome:** LO4

---

## 💾 Cloud Storage Types (Simple Comparison)

### Object Storage

| Feature      | Description        |
| ------------ | ------------------ |
| Storage type | Files              |
| Example      | AWS S3, Azure Blob |
| Use          | Logs, backups      |

💡 Like Google Drive

---

### Block Storage

| Feature      | Description   |
| ------------ | ------------- |
| Storage type | Hard disk     |
| Example      | AWS EBS       |
| Use          | OS, databases |

💡 Like USB drive attached to computer

---

## 🌐 Networking Basics (Must Know)

### VPC (Virtual Private Cloud)

* Your private network in cloud

### Subnets

* Public subnet → internet access
* Private subnet → no internet

---

## 🔥 Security Groups (Firewall)

Controls:

* Who can access
* Which port is open

| Port | Purpose        |
| ---- | -------------- |
| 22   | SSH            |
| 80   | Website        |
| 443  | Secure website |

---

## 🧪 Hands-on Labs (5 Hours Breakdown)

### Lab 1: Create Cloud Account

* AWS / Azure free tier

---

### Lab 2: Launch Linux VM

* Choose Ubuntu
* Add security group
* Create key pair

---

### Lab 3: SSH into VM

* Login securely
* Run Linux commands

---

### Lab 4: Install Web Server

```bash
sudo apt update
sudo apt install nginx
```

Access via browser using public IP

---

### Lab 5: Storage Demo

* Upload file to S3
* Generate URL
* Access file

---

### Lab 6: Cost Cleanup

* Stop VM
* Terminate VM
* Delete unused storage

---

## 🌍 Real-World Scenario

### Scenario:

Website hacked because security group allowed all ports.

### Lesson:

* Open only required ports
* Follow least privilege

---

## ✅ Final Key Takeaways (Unit 4)

✔ Understand cloud fundamentals
✔ Can launch & manage VM
✔ Knows storage types
✔ Understands security & cost
✔ Ready for DevOps tools

---

