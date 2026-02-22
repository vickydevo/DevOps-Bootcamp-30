# Continuous Integration (CI) and Continuous Delivery/Deployment (CD)

## What is CI?
Continuous Integration (CI) is a software development practice where developers frequently integrate their code changes into a shared repository. Each integration is verified by automated builds and tests to detect issues early.

## What is CD?
Continuous Delivery (CD) is the practice of automating the release process so that software can be deployed to production at any time. Continuous Deployment takes this a step further by automatically deploying every change that passes the automated tests to production.

---

# Jenkins Overview

## What is Jenkins?
Jenkins is an open-source automation server that helps automate parts of software development, including building, testing, and deploying applications. It supports CI/CD pipelines and integrates with numerous tools and plugins.

## Jenkins Terminology
- **Job/Project**: A task or process configured in Jenkins, such as building or testing code.
- **Pipeline**: A series of steps defined in code to automate the CI/CD process.
- **Node**: A machine where Jenkins runs jobs. The main Jenkins server is the "master," and additional machines are "agents."
- **Workspace**: A directory on a node where Jenkins executes a job.
- **Plugin**: An extension that adds functionality to Jenkins.

---

# Installing and configuring Jenkins Master
### jenkins offical documentations [text](https://www.jenkins.io/doc/tutorials/tutorial-for-installing-jenkins-on-AWS/)

## Prerequisites
1. A system with Java installed (Jenkins requires Java 11 or newer).
2. Administrative privileges to install packages.

## Installation Steps
1. **Update the System**:
    ```bash
    sudo apt update && sudo apt upgrade -y
    ```

2. **Install Java**:
    ```bash
    sudo apt install openjdk-11-jdk -y
    ```

3. **Add Jenkins Repository**:
    ```bash
    curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
    echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
    ```

4. **Install Jenkins**:
    ```bash
    sudo apt update
    sudo apt install jenkins -y
    ```

5. **Start , disable and Enable Jenkins**:
    ```bash
    sudo systemctl start jenkins
    sudo systemctl enable jenkins
    sudo systemctl stop jenkins
    sudo systemctl disable jenkins
    ```

6. **Access Jenkins**:
    - Open a browser and navigate to `http://<your-server-ip>:8080`.
    - Retrieve the initial admin password:

      ```bash
      sudo cat /var/lib/jenkins/secrets/initialAdminPassword
      ```
    - Follow the setup wizard to complete the installation.
7.**Viewing service configurations**


  ```bash
      systemctl cat jenkins
      systemctl edit jenkins
 ```
## Changing Jenkins Default Port

By default, Jenkins runs on port 8080. To change the port:

1. Open the Jenkins configuration file:
    ```bash
    sudo vi /etc/default/jenkins
    ```
2. Find the line:
    ```ini
    HTTP_PORT=8080
    ```
3. Change `8080` to your desired port number, for example:
    ```ini
    HTTP_PORT=9090
    ```
4. Save and exit the editor.

5. Restart Jenkins to apply the change:
    ```bash
    sudo systemctl restart jenkins
    ```

Jenkins will now be accessible on the new port.
---

This document provides an overview of CI/CD, Jenkins, and the steps to install a Jenkins master.