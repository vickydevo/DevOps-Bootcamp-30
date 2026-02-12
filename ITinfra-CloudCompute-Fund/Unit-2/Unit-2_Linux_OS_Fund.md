
# Unit 2: Linux Operating System Fundamentals

**Duration:** 6 Hours
**Mode:** 2 Hours Lecture + 4 Hours Hands-on Lab
**Learning Outcome Addressed:** LO2

---

## 🌍 Why This Unit Is Important (In Simple Words)

Linux is the **operating system that runs most servers in the world**.

* Google, Amazon, Netflix, banks, airports → all run on Linux
* **95% of cloud servers use Linux**
* If you know Linux → you are **job-ready** for Cloud, DevOps, and Security roles

👉 Think of Linux as **the engine room of IT infrastructure**


---

## 📘 2.1 Linux OS Basics (1.5 Hours)

### What is Linux? (Layman Explanation)

* Linux is an **operating system**, just like Windows or Android
* It controls:

  * CPU
  * Memory
  * Hard disk
  * Network

💡 **Example:**
Windows = used on personal laptops
Linux = used on **servers** (machines that run websites & apps)

---

### Linux Components (Easy Understanding)

* **Kernel** → Brain of the OS (controls hardware)
* **GNU Utilities** → Tools to work with files and commands

Popular Linux versions:

* Ubuntu (easy, beginner-friendly)
* CentOS / RHEL (used in companies)

---

### File System Hierarchy (Think Like a House)

| Folder  | Meaning               | Example         |
| ------- | --------------------- | --------------- |
| `/root` | Admin’s personal room | Only owner      |
| `/home` | Users’ rooms          | Students/users  |
| `/etc`  | Settings cupboard     | Config files    |
| `/var`  | Changing data         | Logs            |
| `/log`  | Record book           | Errors & events |

💡 **Example:**
Just like a college has **admin office, classrooms, notice board**, Linux has folders.

---

### Booting Process (Simple Flow)

1. Power ON
2. BIOS checks hardware
3. Linux kernel loads
4. Services start (network, login, etc.)

👉 Just like **switching on a phone → Android loads → apps start**

---

### Users & Permissions (Basic Idea)

Linux controls **who can do what**.

Permissions have **3 parts**:

* Owner
* Group
* Others

Each has:

* `r` → read
* `w` → write
* `x` → execute

Example:

```bash
chmod 755 file.sh
```

Means:

* Owner → read, write, execute
* Group → read, execute
* Others → read, execute

---

## 📘 2.2 Command Line & Basic Commands (1.5 Hours)

### What is Command Line?

* Instead of clicking with mouse
* You **type commands**
* Faster and powerful for servers

💡 Servers don’t have screens → only command line

---

### Essential Commands (Must Practice)

#### Navigation Commands

* `ls` → list files
* `cd` → change folder
* `pwd` → show current location
* `find` → search files

#### File Operations

* `cp` → copy
* `mv` → move/rename
* `rm` → delete
* `cat` → view file
* `head`, `tail` → view start/end
* `grep` → search inside files

#### User & Permission

* `useradd`
* `passwd`
* `sudo`
* `chmod`
* `chown`

#### System Commands

* `top` → CPU usage
* `ps` → running processes
* `df` → disk space
* `du` → folder size
* `uname` → OS info
* `whoami` → current user

---

### Pipes & Redirection (Like Water Pipes)

```bash
command1 | command2
```

👉 Output of first goes to second

```bash
>   → overwrite
>>  → append
```

Example:

```bash
ls > files.txt
```

---

### Manual Pages (Self-Learning Tool)

```bash
man ls
```

👉 Linux’s **built-in help book**

---

## 📘 2.3 Processes & Services (1 Hour)

### Process vs Program (Very Simple)

* Program → Installed file
* Process → Running program

💡 Chrome installed ≠ Chrome running

---

### Viewing Processes

* `ps aux`
* `top`
* `htop`

👉 See:

* CPU usage
* Memory usage

---

### Services (Background Workers)

Services run automatically:

* Web server
* Database
* Network

Commands:

```bash
systemctl start apache2
systemctl stop apache2
systemctl status apache2
systemctl enable apache2
```

---

### Killing a Process (Carefully!)

```bash
kill PID
killall process-name
```

💡 Like closing a frozen app

---

## 📘 2.4 File Permissions & User Management (1 Hour)

### Permission Examples

| Permission | Meaning                       |
| ---------- | ----------------------------- |
| `644`      | Read/write owner, read others |
| `755`      | Executable files              |

Example:

```bash
chmod 755 script.sh
```

---

### Creating Users

```bash
sudo useradd developer
sudo passwd developer
```

👉 Create new employee login

---

### Sudo Concept

* Normal users cannot do admin tasks
* `sudo` gives **temporary admin rights**

💡 Like staff taking permission from principal

---

## 📘 2.5 Logs & Troubleshooting Basics (1 Hour)

### What Are Logs?

Logs are **records of what happened**.

Just like:

* CCTV footage
* Call history

---

### Important Log Files

| Log                          | Purpose       |
| ---------------------------- | ------------- |
| `/var/log/syslog`            | System events |
| `/var/log/auth.log`          | Login issues  |
| `/var/log/apache2/error.log` | Web errors    |

---

### Reading Logs

```bash
tail -f /var/log/syslog
grep ERROR /var/log/syslog
```

```bash
journalctl -u apache2
journalctl -p err
```

---

## 🌍 Real-World Scenario (Placement-Oriented)

### Problem:

Server is slow.

### Steps:

1. Check CPU usage → `top`
2. Identify heavy process → `ps`
3. Kill or restart → `kill`
4. Check logs → `tail -f /var/log/syslog`

👉 This is **real DevOps work**

---

## ✅ Key Takeaways

✔ Comfortable with Linux command line
✔ Can manage users and permissions
✔ Can control services
✔ Can read logs and fix basic issues
✔ Ready for Cloud & DevOps learning

---

👍
---

## 🎯 Unit Objectives (What Students Will Learn)

After this unit, students will be able to:

* Use Linux commands confidently (without fear)
* Understand files, folders, and permissions
* Create users and give proper access
* Check which programs are running
* Fix basic Linux problems using logs

---

## 🕒 Time Distribution (6 Hours)

| Section   | Topic                              | Duration  | Mode           |
| --------- | ---------------------------------- | --------- | -------------- |
| 2.1       | Linux OS Basics                    | 1.5 hrs   | Lecture + Demo |
| 2.2       | Command Line & Basic Commands      | 1.5 hrs   | Lecture + Demo |
| 2.3       | Processes & Services               | 1 hr      | Demo + Lab     |
| 2.4       | File Permissions & User Management | 1 hr      | Lab            |
| 2.5       | Logs & Troubleshooting Basics      | 1 hr      | Lab            |
| **Total** |                                    | **6 hrs** |                |

