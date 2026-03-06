# Kubectl Commands for Interacting with Kubernetes Cluster

## Basic Commands
```bash
kubectl api-versions
kubectl api-resources

kubectl version --short
kubectl help
kubectl cluster-info
kubectl get all
kubectl get all --show-kind --output=wide

kubectl config view
kubectl config current-context
kubectl config get-contexts
kubectl config use-context <context-name>
```

## Applying and Managing YAML Files
```bash
kubectl apply -f <file-name>.yaml
kubectl delete -f <file-name>.yaml
kubectl explain deployment
kubectl explain pod
kubectl diff -f <file-name>.yaml
```

## Working with Namespaces
```bash
kubectl get namespaces
kubectl create namespace <namespace-name>
kubectl delete namespace <namespace-name>
kubectl config set-context --current --namespace=<namespace-name>
```

## Working with Pods
```bash
kubectl get pods
kubectl describe pod <pod-name>
kubectl logs <pod-name>
kubectl logs <pod-name> --previous
kubectl exec -it <pod-name> -- <command>
kubectl delete pod <pod-name>
kubectl port-forward <pod-name> <local-port>:<pod-port>
```

## Working with Deployments
```bash
kubectl get deployments
kubectl describe deployment <deployment-name>
kubectl create deployment <deployment-name> --image=<image-name>
kubectl set image deployment/<deployment-name> <container-name>=<new-image>
kubectl scale deployment <deployment-name> --replicas=<number>
kubectl rollout status deployment/springboot-deployment-np
kubectl rollout undo deployment/<deployment-name>
kubectl delete deployment <deployment-name>
```

## Working with Services
```bash
kubectl get services
kubectl describe service <service-name>
kubectl expose deployment <deployment-name> --type=<service-type> --port=<port> --target-port=<target-port>
kubectl delete service <service-name>
```
## Working namespaces 
```bash
kubectl get namespaces
# or the shorter version:
kubectl get ns
```
## Working with ReplicaSets
```bash
kubectl get replicasets
kubectl describe replicaset <replicaset-name>
kubectl delete replicaset <replicaset-name>
```

## Working with ConfigMaps
```bash
kubectl create configmap <configmap-name> --from-file=<path-to-file>
kubectl create configmap <configmap-name> --from-literal=<key>=<value>
kubectl get configmaps
kubectl describe configmap <configmap-name>
kubectl delete configmap <configmap-name>
```

## Working with Secrets
```bash
kubectl create secret generic <secret-name> --from-literal=<key>=<value>
kubectl create secret generic <secret-name> --from-file=<path-to-file>
kubectl get secrets
kubectl describe secret <secret-name>
kubectl delete secret <secret-name>
kubectl -n kube-system get pods | grep controller
```

## Working with Persistent Volumes and Persistent Volume Claims
```bash
kubectl get pv
kubectl get pvc
kubectl describe pv <pv-name>
kubectl describe pvc <pvc-name>
kubectl delete pvc <pvc-name>
```

## Working with Jobs and CronJobs
```bash
kubectl get jobs
kubectl describe job <job-name>
kubectl apply -f <job-file>.yaml
kubectl delete job <job-name>
kubectl get cronjobs
kubectl describe cronjob <cronjob-name>
kubectl delete cronjob <cronjob-name>
```

## Configuring Access and Context
```bash
kubectl config current-context
kubectl config get-contexts
kubectl config use-context <context-name>
kubectl auth can-i <verb> <resource>
```

## Resource Management and Debugging
```bash
kubectl top nodes
kubectl top pods
kubectl get events
kubectl describe node <node-name>
kubectl run -i --tty busybox --image=busybox -- sh
kubectl debug node/<node-name> --image=busybox
kubectl get logs --all-namespaces
```

## Additional Useful Commands
```bash
kubectl edit <resource>/<resource-name>
kubectl label <resource>/<resource-name> <key>=<value>
kubectl annotate <resource>/<resource-name> <key>=<value>
kubectl cordon <node-name>
kubectl uncordon <node-name>
kubectl drain <node-name> --ignore-daemonsets --delete-emptydir-data
kubectl taint nodes <node-name> <key>=<value>:<effect>
```

