
# Linux Operating System Fundamentals


Linux is the **operating system that runs most servers in the world**.

* Google, Amazon, Netflix, banks, airports → all run on Linux
* **95% of cloud servers use Linux**
* If you know Linux → you are **job-ready** for Cloud, DevOps, and Security roles

👉 Think of Linux as **the engine room of IT infrastructure**


---

## 📘  Linux OS Basics

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



## Command Line & Basic Commands

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
* `vi/vim/nano` → file Editors 
 
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

## 📘 Processes & Services 

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

## 📘File Permissions & User Management 

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

## 📘Logs & Troubleshooting Basics (1 Hour)

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
Here is the updated, high-speed reference guide. I’ve consolidated the commands and the storage paths into one clean Markdown structure for your notes.

---

# Linux Package Management: Quick Reference

### 1. The Core Concept

Linux uses **Package Managers** to download software from **External Repositories** (Servers). It follows a "Search -> Download -> Install" workflow.

---

### 2. Comparison Table

| Feature | **APT** (Debian/Ubuntu) | **YUM / DNF** (RHEL/CentOS) |
| --- | --- | --- |
| **Used On** | Ubuntu, Debian, Mint | CentOS, RHEL, Fedora, Amazon Linux |
| **Package Format** | `.deb` | `.rpm` |
| **Repo Addresses** | `/etc/apt/sources.list` | `/etc/yum.repos.d/` |
| **Download Cache** | `/var/cache/apt/archives/` | `/var/cache/yum/` |

---

### 3. Essential Commands

| Action | **APT** | **YUM / DNF** |
| --- | --- | --- |
| **Refresh Menu** | `sudo apt update` | `sudo yum check-update` |
| **Install Tool** | `sudo apt install <name> -y` | `sudo yum install <name> -y` |
| **Remove Tool** | `sudo apt remove <name>` | `sudo yum remove <name>` |
| **Upgrade All** | `sudo apt upgrade` | `sudo yum upgrade` |
| **Clear Cache** | `sudo apt clean` | `sudo yum clean all` |

---

### 4. Key Directory Logic

* **The "Address Book" (`/etc/...`):** This is where the links to external servers are stored. If you want to install a tool like Docker or Terraform that isn't in the default list, you add a new `.list` or `.repo` file here.
* **The "Waiting Room" (`/var/cache/...`):** Before a tool is installed, the compressed file is downloaded here.
* *Pro Tip:* Run the **Clean** command regularly on servers to prevent these folders from filling up your disk space.





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

