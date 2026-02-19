# Nginx Web Server Setup on Amazon Linux 2023

## What is a Web Server?
A web server is software or hardware that serves web content to users over the internet. It processes incoming requests from clients (such as web browsers) and delivers requested web pages, images, videos, or other resources.
Web servers like Apache, Nginx, and IIS primarily serve static content (HTML, CSS, JavaScript) and act as reverse proxies, forwarding requests to backend applications. They do not process backend logic directly. Instead, they work with application servers to handle dynamic content.
## What is a Reverse Proxy?
A reverse proxy is a server that sits between client requests and backend servers. It forwards incoming requests from users to one or more backend servers and returns the response to the client.

## Types of Web Servers
There are several types of web servers, categorized based on their functionality and usage:

### 1. Apache HTTP Server (Apache)
- **Developer:** Apache Software Foundation  
- **Pros:** Open-source, highly customizable with modules, widely used.  
- **Cons:** Performance issues under heavy traffic compared to newer web servers.  
- **Best for:** General-purpose web hosting, PHP-based applications like WordPress.  

### 2. Nginx
- **Developer:** Igor Sysoev  
- **Pros:** High-performance, efficient resource usage, good for handling concurrent connections, built-in reverse proxy and load balancing.  
- **Cons:** Configuration can be complex for beginners.  
- **Best for:** High-traffic websites, static content delivery, and reverse proxy use cases.  

### 3. Microsoft IIS (Internet Information Services)
- **Developer:** Microsoft  
- **Pros:** Integrated with Windows Server, easy to use with ASP.NET applications.  
- **Cons:** Limited to Windows environments.  
- **Best for:** Windows-based applications and enterprises using Microsoft stack.  

### 4. Tomcat (Apache Tomcat)
- **Developer:** Apache Software Foundation  
- **Pros:** Specially designed for running Java Servlets and JSP applications.  
- **Cons:** Not a general-purpose web server, only for Java-based applications.  
- **Best for:** Java-based applications and APIs.  

### Which One is the Best?
The best web server depends on your needs:
- **For general-purpose hosting:** Apache or Nginx.  
- **For high-performance and scalability:** Nginx or LiteSpeed.  
- **For Windows-based applications:** IIS.  
- **For Java applications:** Tomcat.  
- **For simple and secure web hosting:** Caddy.  

**Best Overall Choice:** Nginx is considered one of the best web servers for performance, security, and scalability, making it a top choice for modern web applications.

---

## Why Use Nginx?
- **High Performance:** Handles multiple concurrent connections with low resource consumption.
- **Load Balancing:** Distributes traffic efficiently among multiple servers.
- **Reverse Proxy:** Improves security by hiding backend services.
- **Security Features:** Supports TLS/SSL termination, request filtering, and more.
- **Scalability:** Suitable for small to large-scale applications.

---

## Installation Steps
### Step 1: Update the Package Manager
```bash
sudo apt update -y
```

### Step 2: Install Nginx
```bash
sudo apt install -y nginx
```

### Step 3: Start Nginx
```bash
sudo systemctl start nginx
```

### Step 4: Enable Nginx to Start on Boot
```bash
sudo systemctl enable nginx
```

### Step 5: Verify Nginx Installation
1. Open a web browser.
2. Enter your instance's public IP or DNS.
3. You should see the Nginx welcome page.

---

## Creating and Serving a Test HTML File
### Step 1: Create a Test HTML File
```bash
echo '<h1>Hello, Nginx on Amazon Linux 2023!</h1>' | sudo tee /var/www/html/index.html
```

### Step 2: Verify the File
```bash
cat /var/www/html/index.html
```

### Step 3: Restart Nginx (if necessary)
```bash
sudo systemctl restart nginx
```

### Step 4: Access the File in a Browser
1. Open a browser.
2. Enter your instance's public IP or DNS.
3. You should see the test page content.

---

## Updating the HTML File
### Step 1: Edit the HTML File
```bash
echo '<h1>Updated Content: Nginx on Amazon Linux 2023!</h1>' | sudo tee /var/www/html/index.html
```

### Step 2: Check the Changes
```bash
cat /var/www/html/index.html
```

### Step 3: Refresh Browser to See Updates

---

## Additional Nginx Commands
### Check Nginx Status
```bash
sudo systemctl status nginx
```

### Stop Nginx
```bash
sudo systemctl stop nginx
```

### Restart Nginx
```bash
sudo systemctl restart nginx
```

---

## Conclusion
Nginx is a powerful and efficient web server that enhances website performance, security, and scalability. By following the steps above, you can set up and manage an Nginx web server on Amazon Linux 2023 with ease.
