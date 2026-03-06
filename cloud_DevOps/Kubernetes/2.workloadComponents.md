# Kubernetes Workloads

Kubernetes (K8s) workloads are objects that manage and run your application containers. Here are the main types of workloads with explanations and examples:

---

## 1. Pod

**Definition:**  
The smallest deployable unit in Kubernetes. A Pod encapsulates one or more containers.

**Example:**
```yaml
apiVersion: v1
kind: Pod
metadata:
    name: my-pod
spec:
    containers:
        - name: nginx
            image: nginx:latest
```

---

## 2. ReplicaSet

**Definition:**  
Ensures a specified number of pod replicas are running at any given time.

**Example:**
```yaml
apiVersion: apps/v1
kind: ReplicaSet
metadata:
    name: my-replicaset
spec:
    replicas: 3
    selector:
        matchLabels:
            app: nginx
    template:
        metadata:
            labels:
                app: nginx
        spec:
            containers:
                - name: nginx
                    image: nginx:latest
```

---

## 3. Deployment

**Definition:**  
Manages ReplicaSets and provides declarative updates for Pods and ReplicaSets.

**Example:**
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
    name: my-deployment
spec:
    replicas: 2
    selector:
        matchLabels:
            app: nginx
    template:
        metadata:
            labels:
                app: nginx
        spec:
            containers:
                - name: nginx
                    image: nginx:latest
```

---

## 4. StatefulSet

**Definition:**  
Manages stateful applications. Provides unique network identities and stable storage.

**Example:**
```yaml
apiVersion: apps/v1
kind: StatefulSet
metadata:
    name: my-statefulset
spec:
    serviceName: "nginx"
    replicas: 2
    selector:
        matchLabels:
            app: nginx
    template:
        metadata:
            labels:
                app: nginx
        spec:
            containers:
                - name: nginx
                    image: nginx:latest
```

---

## 5. DaemonSet

**Definition:**  
Ensures a copy of a Pod runs on all (or some) nodes.

**Example:**
```yaml
apiVersion: apps/v1
kind: DaemonSet
metadata:
    name: my-daemonset
spec:
    selector:
        matchLabels:
            app: fluentd
    template:
        metadata:
            labels:
                app: fluentd
        spec:
            containers:
                - name: fluentd
                    image: fluentd:latest
```

---

## 6. Job

**Definition:**  
Creates one or more Pods and ensures they successfully terminate (for batch jobs).

**Example:**
```yaml
apiVersion: batch/v1
kind: Job
metadata:
    name: my-job
spec:
    template:
        spec:
            containers:
                - name: pi
                    image: perl
                    command: ["perl",  "-Mbignum=bpi", "-wle", "print bpi(2000)"]
            restartPolicy: Never
```

---

## 7. CronJob

**Definition:**  
Runs Jobs on a scheduled time (like a cron in Linux).

**Example:**
```yaml
apiVersion: batch/v1
kind: CronJob
metadata:
    name: my-cronjob
spec:
    schedule: "*/1 * * * *"
    jobTemplate:
        spec:
            template:
                spec:
                    containers:
                        - name: hello
                            image: busybox
                            args:
                                - /bin/sh
                                - -c
                                - date; echo Hello from the Kubernetes cluster
                    restartPolicy: OnFailure
```

---

## Summary Table

| Workload     | Use Case                        |
|--------------|---------------------------------|
| Pod          | Single instance/container        |
| ReplicaSet   | Maintain N identical Pods        |
| Deployment   | Rolling updates, scaling         |
| StatefulSet  | Stateful apps, stable identity   |
| DaemonSet    | Run on every node                |
| Job          | One-off/batch tasks              |
| CronJob      | Scheduled jobs                   |

---

> **Tip:** Use Deployments for most stateless applications, StatefulSets for databases, DaemonSets for node-level agents, and Jobs/CronJobs for batch or scheduled tasks.
