# Connecting to a Remote Server in a Private Subnet

A remote server in a private subnet does not have direct internet access or external SSH access from the public internet. To connect, you typically use a jump server (bastion host) in the public subnet. The process involves generating SSH keys, copying the public key to the remote server, and ensuring SSH configurations are correct.
<img width="1012" height="632" alt="Image" src="https://github.com/user-attachments/assets/a02ad942-7b38-4637-aa62-dba6c21c3a84" />
---

## Steps to Connect

If you use the same key pair for both the bastion host and the private app host, you need to copy your private key from your local machine to the bastion host. This allows you to SSH from the bastion to the private server.

To copy your private key (`private.pem`) to the bastion host, use:

```bash
scp -i "private.pem" ./private.pem ec2-user@<bastion_host_ip>:/~
```

Once the key is on the bastion host, SSH into the bastion:

```bash
ssh -i "private.pem" ec2-user@<bastion_host_ip>
```

From the bastion, you can SSH into the private app host using the same key:

```bash
ssh -i ./private.pem ec2-user@<private_host_ip>
```

> **When to generate an SSH key?**  
You generate an SSH key when you need secure, passwordless authentication between servers. In this workflow, generate the SSH key on the jump server before connecting to the remote server. This ensures only authorized users can access the private server via the bastion host.

### 1. Generate SSH Key on Jump Server

Generate an SSH key on the jump server:

```bash
ssh-keygen -t rsa -b 4096
```

- `-t rsa`: Use RSA algorithm.
- `-b 4096`: 4096-bit key for security.

This creates:
- **Private Key** (`id_rsa`): Keep on jump server.
- **Public Key** (`id_rsa.pub`): Copy to target server.
<img width="1548" height="802" alt="Image" src="https://github.com/user-attachments/assets/b109d207-d5b7-4888-bb2c-b52e81b46b60" />
---

### 2. Copy Public Key to Target Server

Try to copy the public key:

```bash
ssh-copy-id username@remote_server_ip
```
<img width="1835" height="487" alt="Image" src="https://github.com/user-attachments/assets/a8542880-2840-470f-9f94-37595d194132" /> 

If you get a "permission denied" error, direct SSH access may be blocked. Use a jump server or VPN, or manually copy the key.

---

### 3. Avoid Editing `sshd_config` for Public Key Authentication

By default, public key authentication should be enabled. On the target server, check `/etc/ssh/sshd_config`:

```text
PubkeyAuthentication yes
PasswordAuthentication yes    # Optional
PermitEmptypPasswords yes           # Disable unless needed
```
![alt text](image-1.png)
If you don't want to edit these, ensure your public key is in `~/.ssh/authorized_keys`.
After updating the SSH configuration, apply the changes by restarting the SSH service:

```bash
sudo systemctl restart sshd
```

This ensures your new authentication settings take effect.
---

### 4. Manually Copy the Public Key

If `ssh-copy-id` fails, manually copy the public key:

1. On the jump server:
    ```bash
    cat ~/.ssh/id_rsa.pub
    ```
    Copy the output.

2. Log in to the target server:
    ```bash
    ssh username@remote_server_ip
    ```

3. On the target server:
    ```bash
    mkdir -p ~/.ssh
    echo "your-copied-public-key" >> ~/.ssh/authorized_keys
    chmod 700 ~/.ssh
    chmod 600 ~/.ssh/authorized_keys
    ```

---

### 5. Restart SSH Service

If you made changes, restart SSH:

```bash
sudo systemctl restart sshd
```

---
## 6. Test SSH Connection from Jump Host to Remote Server

After setting up keys and configurations, verify the connection:

```bash
ssh username@remoteServer_ip
```
<img width="1542" height="535" alt="Image" src="https://github.com/user-attachments/assets/62af7253-50d0-4366-93e9-54ba24b875e1" />

If successful, you should be logged into the remote server via the jump host. If you encounter issues, check SSH key permissions and firewall rules.
## Script: Update `sshd_config` Settings

Use this script to update SSH authentication settings:

```bash
#!/bin/bash

# Usage: ./update_sshd_config.sh <PubkeyAuthentication> <PasswordAuthentication>
# Example: ./update_sshd_config.sh yes yes

PUBKEY_AUTH=$1
PASSWORD_AUTH=$2
SSHD_CONFIG="/etc/ssh/sshd_config"

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

cp $SSHD_CONFIG "${SSHD_CONFIG}.bak"

if grep -q "^PubkeyAuthentication" $SSHD_CONFIG; then
    sed -i "s/^PubkeyAuthentication.*/PubkeyAuthentication $PUBKEY_AUTH/" $SSHD_CONFIG
else
    echo "PubkeyAuthentication $PUBKEY_AUTH" >> $SSHD_CONFIG
fi

if grep -q "^PasswordAuthentication" $SSHD_CONFIG; then
    sed -i "s/^PasswordAuthentication.*/PasswordAuthentication $PASSWORD_AUTH/" $SSHD_CONFIG
else
    echo "PasswordAuthentication $PASSWORD_AUTH" >> $SSHD_CONFIG
fi

systemctl restart sshd

echo "Updated sshd_config with PubkeyAuthentication=$PUBKEY_AUTH and PasswordAuthentication=$PASSWORD_AUTH"
```

---

**Note:** Always backup configuration files before making changes.