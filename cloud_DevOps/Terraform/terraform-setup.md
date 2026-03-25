
## 1\. Install Terraform on Windows

The most reliable way to install Terraform on Windows is using **Chocolatey** (a package manager) or by manual binary placement.

### Option A: Using Chocolatey (Recommended)

Open PowerShell as **Administrator** and run:

```powershell
choco install terraform
```

### Option B: Manual Installation

1.  Download the Windows 64-bit ZIP from the [Terraform Downloads](https://www.terraform.io/downloads) page.
2.  Extract the `terraform.exe` file to a folder (e.g., `C:\terraform`).
3.  Add `C:\terraform` to your **System Environment Variables** (PATH).
4.  Verify by opening a new terminal and typing: `terraform -v`.

-----

## 2\. Install AWS CLI

1.  Download the **AWS CLI MSI Installer** for Windows: [Download here](https://www.google.com/search?q=https://awscli.amazonaws.com/AWSCLIV2.msi).
2.  Run the installer and follow the prompts.
3.  Restart your terminal (Git Bash, PowerShell, or CMD).
4.  Verify the installation:
    ```bash
    aws --version
    ```

-----

## 3\. Configure AWS Profiles

Instead of a default configuration, we will create a **Named Profile**. This allows you to store credentials for different projects safely.

Run the following command in your terminal:

```bash
aws configure --profile my-dev-project
```

It will ask for your credentials:

  * **Access Key ID:** `[Your Key]`
  * **Secret Access Key:** `[Your Secret]`
  * **Region:** `us-east-1` (or your preferred region)
  * **Output:** `json`

These details are saved locally in `~/.aws/credentials`.

-----

## 4\. Using the Profile in Terraform

Now, you tell Terraform exactly which profile to use within the `provider` block. This prevents Terraform from accidentally deploying to the wrong AWS account.

### Updated `main.tf`

```hcl
# 1. Define the Provider using a Named Profile
provider "aws" {
  region  = "us-east-1"
  profile = "my-dev-project" # This matches the name used in 'aws configure'
}

# 2. Create the EC2 Resource
resource "aws_instance" "example_server" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 (check your region)
  instance_type = "t2.micro"

  tags = {
    Name = "Dev-Server"
  }
}
```

-----

## 5\. Deployment Workflow

Once your code is ready with the profile defined, follow the standard execution:

1.  **`terraform init`**: Prepare the directory.
2.  **`terraform plan`**: Terraform will automatically look for the `my-dev-project` credentials in your AWS folder.
3.  **`terraform apply`**: Confirm with `yes`.

-----

### Pro Tip: Security

> [\!TIP]
> By using the `profile` argument in your code, you never have to put your **Secret Keys** inside the `.tf` files. This keeps your credentials safe and out of version control systems like GitHub.
