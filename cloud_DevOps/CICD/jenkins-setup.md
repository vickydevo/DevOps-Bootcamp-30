
## 1. DevOps: The Big Picture
**DevOps** is a set of practices that combines software development (Dev) and IT operations (Ops). Its goal is to shorten the systems development life cycle and provide continuous delivery with high software quality. 

Think of it as the "mindset" of breaking down silos so that the people writing the code and the people maintaining the servers are on the same team.

## 2. CI/CD: The Technical Pipeline
**CI/CD** is the specific automation that implements the DevOps philosophy. It is generally broken down into three distinct stages:

### Continuous Integration (CI)
This focuses on the beginning of the cycle. Every time a developer makes a change, the code is automatically:
* **Built:** Compiled into a runnable format.
* **Tested:** Run through a battery of automated tests to ensure the new code didn't break anything.

Continuous Integration (CI) is a software development practice where developers frequently integrate their code changes into a shared repository. Each integration is verified by automated builds and tests to detect issues early.

### Continuous Delivery (CD)
After the code passes the CI phase, it is automatically pushed to a "Staging" or "Testing" environment. This ensures the code is *always ready* to be deployed, but a human might still need to click a button to push it to the final users.

Continuous Delivery (CD) is the practice of automating the release process so that software can be deployed to production at any time.

### Continuous Deployment (CD)

Continuous Deployment takes this a step further by automatically deploying every change that passes the automated tests to production.

This is the "relentless" version you mentioned. In this setup, there is no manual intervention. If the code passes all tests, it goes straight to the end user.


---

## The Comparison at a Glance

| Feature | DevOps | CI/CD |
| :--- | :--- | :--- |
| **Nature** | Cultural & Organizational | Technical & Process-driven |
| **Scope** | Entire lifecycle (including feedback/monitoring) | The "Path to Production" (Code to Deploy) |
| **Goal** | Collaboration and speed | Automation and reliability |
| **Tools** | Communication (Slack), Kanban, Culture | Jenkins, GitHub Actions, GitLab CI, CircleCI |

---




## The Dancing Doll CI/CD Pipeline Example 

### 1. Source (The Raw Wood)
* **Toy Example:** You select the right timber from the tree and bring it into the workshop.
* **Software Phase:** **Version Control (Git).** This is where the raw code lives. Every time a developer "commits" a new feature, it’s like dropping a new block of wood onto the conveyor belt.

### 2. Build (Cutting & Shaping)
* **Toy Example:** Using a lathe or saw to cut the wood into the rough shape of a doll.
* **Software Phase:** **Continuous Integration (CI).** The system automatically compiles the code. If the code is "rotten" (syntax errors), the machine stops here so you don't waste time painting a broken doll.

### 3. Test (Strength & Quality Check)
* **Toy Example:** You pull on the doll's arms to make sure they don't pop off and check if the wood is cracked.
* **Software Phase:** **Automated Testing.** The pipeline runs "Unit Tests" and "Integration Tests." If a "test" fails, the doll is tossed into the scrap bin, and the developer gets an alert to fix it.

### 4. Release (Painting & Polishing)
* **Toy Example:** The doll is sanded smooth, painted, and dressed. It is now a "Finished Good" sitting in a box in the warehouse, ready to go.
* **Software Phase:** **Continuous Delivery.** The code is packaged into an "Artifact" (like a Docker container) and moved to a staging environment. It looks and acts exactly like the final version.

### 5. Deploy (To the Toy Store)
* **Toy Example:** The truck delivers the boxes to the store shelves where children can actually buy and play with them.
* **Software Phase:** **Continuous Deployment.** The code is pushed to the "Production" servers. The end-user opens their app and suddenly sees the new "Dancing" feature you just built.



---

## Why this prevents "Hiccups"

In a traditional workshop, if the painter finds a crack in the wood, you’ve wasted hours of carving. 

In a **CI/CD** environment:
1.  **Fast Feedback:** If the wood is weak, the "Strength Check" machine catches it in seconds.
2.  **Consistency:** The "Painting Machine" (Automation) uses the exact same shade of blue every single time.
3.  **No Manual Labor:** You don't need a manager to walk the doll from the carver to the painter; the conveyor belt (The Pipeline) does it "relentlessly."

> **The DevOps Distinction:**
> While the **CI/CD** is the conveyor belt and machines, **DevOps** is the fact that the Woodcutter, the Carver, and the Painter all sit in the same room and agree on the best way to work together.

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
3. system config is atleast 2 cpu , 4GB RAM and storage 15GB

## Installation Steps
1. **Update the System**:
    ```bash
    sudo apt update && sudo apt upgrade -y
    ```

2. **Install Java**:
    ```bash
    sudo apt install openjdk-21-jdk -y
    ```

3. **Add Jenkins Repository**:
```bash
    sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
     https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key
    echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
    https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
        /etc/apt/sources.list.d/jenkins.list > /dev/null
```

4. **Install Jenkins**:
    ```bash
    sudo apt update
    sudo apt install jenkins -y
    ```

5. **Start , disable and Enable Jenkins**:
    ```bash
    sudo systemctl status jenkins
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