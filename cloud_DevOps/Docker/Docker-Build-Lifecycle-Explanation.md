# Docker Build Lifecycle – Spring Boot Project

# 1️⃣ What is Build Context?

When we run:

```bash
docker build -t spring:jdk-src .
```

The `.` represents the **current directory**.

That directory (including all files and folders inside it) is called the:

> **Build Context**

### Build Context Contains:

* `Dockerfile`
* `pom.xml`
* `src/`
* `.dockerignore`

Docker sends this entire directory to the Docker daemon before starting the build.

⚠️ Important:
If a file is not inside this directory, `COPY` cannot access it.

---

# 2️⃣ What Happens During `docker build`?

When Docker reads the Dockerfile:

* It does NOT directly modify your local machine.
* It creates a temporary isolated environment.
* It executes each instruction step-by-step.
* It creates image layers for each instruction.

Example:

```dockerfile
FROM eclipse-temurin:21
WORKDIR /app
COPY pom.xml .
COPY src src
RUN mvn clean package
```

Each instruction:

1. Creates a temporary container
2. Executes the command
3. Saves the result as an image layer
4. Removes the temporary container

---

# 3️⃣ Are Intermediate Containers Isolated?

✅ Yes.

During build:

* Docker creates temporary containers.
* They are isolated from the host system.
* They only have access to:

  * Base image filesystem
  * Build context files (via COPY/ADD)

They cannot directly access your local machine.

---

# 4️⃣ When Does CMD Run?

Important:

`CMD` does NOT run during build.

Example:

```dockerfile
CMD ["java", "-jar", "app.jar"]
```

This runs only when we start a container:

```bash
docker run spring:jdk-src
```

---

# 5️⃣ Build Phase vs Runtime Phase

## 🔹 Build Phase

Command:

```bash
docker build -t spring:jdk-src .
```

Process:

Local Machine
↓
Build Context Sent to Docker
↓
Temporary Build Containers
↓
Image Created

No application runs here.

---

## 🔹 Runtime Phase

Command:

```bash
docker run spring:jdk-src
```

Process:

Image
↓
Container Created
↓
CMD Executes
↓
Application Starts

---

# 6️⃣ Image vs Container

| Image                | Container            |
| -------------------- | -------------------- |
| Blueprint            | Running instance     |
| Read-only layers     | Writable layer added |
| Created during build | Created during run   |
| Does NOT execute CMD | Executes CMD         |

---

# 7️⃣ Important Concepts for Interviews

You can explain like this:

* Build context is the set of files sent to the Docker daemon during image build.
* Docker uses temporary isolated containers to execute Dockerfile instructions.
* Each instruction creates an image layer.
* CMD is executed only when a container is started from the image.

---

# 8️⃣ Practical Debug Tip

To check what files exist during build, temporarily add:

```dockerfile
RUN ls -R
```

Then rebuild:

```bash
docker build -t test .
```

Remove the line after debugging.

---

# 🎯 Summary

✔ Build context = local project directory sent to Docker
✔ Build happens inside isolated temporary containers
✔ Image is created layer by layer
✔ Container is created from image
✔ CMD runs only when container starts

---

