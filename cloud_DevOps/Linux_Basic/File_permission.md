`# File and Directory Permissions in Linux

## Changing File/Directory Permissions: (chmod)
Permissions in Linux control who can read, write, and execute files and directories. The `chmod` command is used to change these permissions.

### File Permission Structure:
| Type | User | Group | Others | Owner | Group |
|------|------|-------|--------|-------|-------|
| d    | rwx  | r-x   | r-x    | root  | wheel | (Directory)
| -    | rw-  | r--   | r--    | root  | root  | (File)

### Symbolic Notation:
- `u` represents the **owner**.
- `g` represents the **group**.
- `o` represents **others**.

#### Syntax:
```bash
chmod <who_operator> <permission> <filename>
```

### Operators:
- `+` : Adds permissions
- `-` : Removes permissions
- `=` : Sets exact permissions

### Permissions:
- `r` : Read
- `w` : Write
- `x` : Execute

### Examples:
1. **Adding execute permission for the owner:**
   ```bash
   chmod u+x file.txt
   ```
2. **Removing write permission for the group:**
   ```bash
   chmod g-w file.txt
   ```
3. **Setting read and execute permissions for others:**
   ```bash
   chmod o=rx file.txt
   ```

## Octal Representation of Permissions:
| Permission | Octal Value |
|------------|------------|
| r (read)   | 4          |
| w (write)  | 2          |
| x (execute)| 1          |

### Common Permission Sets:
| Binary | Octal | Symbolic |
|--------|-------|---------|
| 000    | 0     | ---     |
| 001    | 1     | --x     |
| 010    | 2     | -w-     |
| 011    | 3     | -wx     |
| 100    | 4     | r--     |
| 101    | 5     | r-x     |
| 110    | 6     | rw-     |
| 111    | 7     | rwx     |

### Octal Notation Examples:
1. **Setting full permissions for the owner, and read and execute for group and others:**
   ```bash
   chmod 755 file.txt
   ```
2. **Giving full permissions to the owner, and read and execute to group and others:**
   ```bash
   chmod 755 file.txt
   ```
3. **Restricting all permissions for the owner while granting read and execute to group and others:**
   ```bash
   chmod 550 file.txt
   ```

Both **symbolic** and **octal** notations offer flexibility in managing file permissions.

## Changing Ownership of Files or Directories: (chown)
The `chown` command changes the ownership of files and directories.

### Syntax:
```bash
chown user:group <filename>
chown -R user:group <directory>
```
- `-R` applies changes recursively to all files and subdirectories.

## Real-Time Use Cases
### 1. Web Server Files
A web server (e.g., Apache, Nginx) needs to serve files but should not allow modifications by unauthorized users.
```bash
chown www-data:www-data /var/www/html/index.html
chmod 644 /var/www/html/index.html
```
Here:
- Owner (`www-data`) has read and write access.
- Group (`www-data`) and others have read-only access.

### 2. Shared Directory for Development Team
A directory shared among developers should allow all team members to modify files.
```bash
chown -R devteam:developers /projects
chmod -R 770 /projects
```
Here:
- The `devteam` user and `developers` group have full access.
- Others have no access.

### 3. Secure Private Files
A user wants to keep a private file that only they can read and write.
```bash
chmod 600 my_secrets.txt
```
Here:
- Owner has read and write access.
- No one else can access the file.

### 4. Public Read-Only Files
A public directory should allow everyone to read files but not modify them.
```bash
chmod -R 755 /public/docs
```
Here:
- Owner has full control.
- Others can only read and execute.

By understanding `chmod` and `chown`, users can effectively manage file security and access in Linux environments.

Task 
```bash
#!/bin/bash

# Function to install a tool
install_tool() {
   local tool_name=$1
   local install_command=$2
   local check_command=$3

   if ! command -v $check_command > /dev/null 2>&1; then
      echo "Installing $tool_name..."
      eval $install_command
      echo "$tool_name installed successfully."
   else
      echo "$tool_name is already installed."
      $check_command --version
   fi
}

# Prompt user for tools to install
echo "Which tools would you like to install? (git, maven, java, docker, tree)"
read -p "Enter the tools separated by space: " tools

# Loop through selected tools and install them
for tool in $tools; do
   case $tool in
      git)
         install_tool "Git" "sudo apt-get install -y git" "git"
         ;;
      maven)
         install_tool "Maven" "sudo apt-get install -y maven" "mvn"
         ;;
      java)
         install_tool "Java" "sudo apt-get install -y openjdk-11-jdk" "java"
         ;;
      docker)
         install_tool "Docker" "sudo apt-get install -y docker.io" "docker"
         ;;
      tree)
         install_tool "Tree" "sudo apt-get install -y tree" "tree"
         ;;
      *)
         echo "Unknown tool: $tool"
         ;;
   esac
done

echo "Installation process completed."
```

# 1. Web Server Files
WEB_DIR="/var/www/html"
WEB_FILE="$WEB_DIR/index.html"
echo "Setting up web server file permissions..."
sudo chown www-data:www-data $WEB_FILE
sudo chmod 644 $WEB_FILE
echo "Web server file permissions set."

# 2. Shared Directory for Development Team
DEV_DIR="/projects"
echo "Setting up shared directory for development team..."
sudo chown -R devteam:developers $DEV_DIR
sudo chmod -R 770 $DEV_DIR
echo "Shared directory permissions set."

# 3. Secure Private Files
PRIVATE_FILE="$HOME/my_secrets.txt"
echo "Securing private file..."
touch $PRIVATE_FILE
chmod 600 $PRIVATE_FILE
echo "Private file secured."

# 4. Public Read-Only Files
PUBLIC_DIR="/public/docs"
echo "Setting up public read-only directory..."
sudo chmod -R 755 $PUBLIC_DIR
echo "Public read-only directory permissions set."

echo "Permission setup completed successfully!"


