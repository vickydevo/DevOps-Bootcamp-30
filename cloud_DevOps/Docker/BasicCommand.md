Here is the complete, consolidated `README.md` file. It combines your previous requests into a single, professional guide that you can use for your own documentation or share with others.

---

# 🐳 Docker Essentials: The Complete Guide

This `README.md` serves as a quick-reference for managing the full lifecycle of a Docker container—from building and running to tagging and pushing to a remote registry.

---

## 1. Image Management

Commands to handle Docker images (the static blueprints).

| Command | Purpose |
| --- | --- |
| `docker pull <image>` | Downloads an image from Docker Hub (e.g., `docker pull nginx`). |
| `docker images` | Lists all images currently stored on your local machine. |
| `docker build -t <name> .` | Builds a new image from a **Dockerfile** in the current directory. |
| `docker rmi <image_id>` | Deletes a specific local image. |

---

## 2. Container Lifecycle

Commands to create and control your active environments.

| Command | Purpose |
| --- | --- |
| `docker run <image>` | Creates and starts a container from an image. |
| `docker run -d <image>` | Runs the container in **detached mode** (background). |
| `docker run -p 80:80 <image>` | Runs a container and maps a **host port** to a **container port**. |
| `docker ps` | Lists all **running** containers. |
| `docker ps -a` | Lists **all** containers (including stopped ones). |
| `docker stop <id/name>` | Gracefully stops a running container. |
| `docker rm <id/name>` | Deletes a specific container. |

---

## 3. Interaction & Troubleshooting

Commands to "peek" inside or debug your containers.

| Command | Purpose |
| --- | --- |
| `docker logs <id/name>` | Shows the output/logs of a container (useful for debugging). |
| `docker exec -it <id/name> bash` | Opens an interactive terminal **inside** a running container. |
| `docker inspect <id/name>` | Shows low-level JSON info (IP addresses, config, etc.). |
| `docker system prune` | **Cleanup:** Removes all stopped containers and unused data. |

---

## 4. Registry & Distribution (Push/Pull)

The workflow for moving your images to a cloud registry (Docker Hub, AWS ECR, etc.).

| Command | Purpose |
| --- | --- |
| **`docker login`** | Authenticates your CLI with your Docker registry account. |
| **`docker tag <src> <target>`** | Renames/Labels an image so it can be pushed to a specific repository. |
| **`docker push <image_name>`** | Uploads your tagged image to the remote registry. |
| **`docker logout`** | Ends your registry session for security. |

---

## 🚀 Standard Workflow Example

To move a local project to a remote repository (e.g., Docker Hub):

1. **Build your image:**
`docker build -t my-app .`
2. **Login to your account:**
`docker login`
3. **Tag for the registry:**
`docker tag my-app:latest yourusername/my-app:v1.0`
4. **Push to the cloud:**
`docker push yourusername/my-app:v1.0`

---

