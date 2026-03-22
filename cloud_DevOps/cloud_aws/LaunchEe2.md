

# EC2 Instance Provisioning Guide

## 1. Log in to AWS Management Console

1. Access the [AWS Management Console](https://aws.amazon.com/console/).
2. Log in using your IAM user or Root credentials.

---

## 2. Access the EC2 Dashboard

1. In the global search bar at the top, type **EC2**.
2. Select the **EC2** service from the results.
3. Click the **Launch Instance** button to begin the configuration.

<img width="1382" height="732" alt="Image" src="https://github.com/user-attachments/assets/4913b9ea-1c46-4026-8744-47d5355462d5" />
---

## 3. Configure Instance Identity and OS

1. **Name and Tags:** Assign a name to your instance (e.g., `Application-Server-01`).
2. **Application and OS Images (AMI):** - Select the **Ubuntu** logo.
* Choose **Ubuntu Server 24.04 LTS (HVM), SSD Volume Type** from the dropdown menu.
* Ensure the architecture is set to **64-bit (x86)**.

<img width="1252" height="785" alt="Image" src="https://github.com/user-attachments/assets/90b7edf8-74a0-481f-b098-86d6a445560c" />

---

## 4. Select Instance Type and Key Pair

1. **Instance Type:** - Search for and select **t3.micro**.

<img width="1366" height="710" alt="Image" src="https://github.com/user-attachments/assets/1ca53243-dd3f-4e07-ba3b-5c883cad1b52" />

* *Note: If instance type is outside the Free Tier; ensure you monitor your usage to manage costs.*


2. **Key Pair (Login):**
* Click **Create new key pair**.
* Name the key (e.g., `server-access-key`).
* Select **RSA** and **.pem** format.
* Download and save the file securely; it is required for SSH access.

<img width="1488" height="706" alt="Image" src="https://github.com/user-attachments/assets/e7665c05-1616-4eff-a25d-b03e5e86fdf3" />

---

## 5. Configure Network and Storage

1. **Network Settings:**
* Click **Edit** if you need to select a specific VPC or Subnet.
* Ensure **Auto-assign public IP** is set to **Enable**.
* Check **Allow SSH traffic from** and set it to **My IP** for security.
* Check **Allow HTTP traffic from the internet** to enable web access.


2. **Configure Storage:**
* Change the Root Volume size from the default 8 GiB to **20 GiB**.
* Select **gp3** as the volume type for optimized performance.

<img width="1247" height="689" alt="Image" src="https://github.com/user-attachments/assets/0b43d711-e58a-4623-9ec0-8c3c62d7ef95" />

---

## 6. Launch and Finalize

1. Review the **Summary** panel on the right side of the screen to confirm:
* OS: Ubuntu 24.04
* Type: t3.micro
* Storage: 8 GiB


2. Click **Launch Instance**.
3. Click **View all instances** and wait until the **Status check** column displays `3/3 checks passed`.

---

## 7. Establish Connection

1. Select your running instance and click **Connect**.
2. Go to the **SSH Client** tab.
3. Open your local terminal and set the correct permissions for your key:
```bash
chmod 400 server-access-key.pem

```


4. Connect using the Public DNS:
```bash
ssh -i "server-access-key.pem" ubuntu@<your-instance-public-ip>

```


*Note: The default username for this image is `ubuntu`.*

