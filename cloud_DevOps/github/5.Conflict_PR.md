## Understanding Git Conflicts

A **conflict** in Git occurs when changes from different branches cannot be merged automatically. This usually happens when two branches modify the same line in a file or when one branch deletes a file that another branch modifies.

### Example: Conflict Between Two Branches

Suppose you have a file `greeting.txt` with the following content:

```txt
Hello, world!
```

#### 1. Create Two Branches

```bash
git checkout -b branch-A
```
Edit `greeting.txt`:
```txt
Hello, world!
Welcome from branch A.
```
Commit the change:
```bash
git add greeting.txt
git commit -m "Update greeting from branch A"
```

Switch to another branch:
```bash
git checkout main
git checkout -b branch-B
```
Edit `greeting.txt`:
```txt
Hello, world!
Welcome from branch B.
```
Commit the change:
```bash
git add greeting.txt
git commit -m "Update greeting from branch B"
```

#### 2. Merge and Cause a Conflict

Try to merge `branch-A` into `branch-B`:
```bash
git checkout branch-B
git merge branch-A
```
Git will report a conflict in `greeting.txt` because both branches changed the same line.

### Visualizing and Resolving Conflicts in VS Code

1. Open the project in **VS Code**.
2. The conflicted file (`greeting.txt`) will be highlighted.
3. Open the file to see conflict markers:
<img width="1636" height="557" alt="Image" src="https://github.com/user-attachments/assets/9319675c-600f-4fb4-b7b2-e8db13c5d84f" />
---
<img width="1338" height="617" alt="Image" src="https://github.com/user-attachments/assets/aad7d310-cf6a-48d9-aa59-4c8b9f210ec2" />


4. Use the VS Code interface to choose:
    - **Accept Current Change** (branch-B)
    - **Accept Incoming Change** (branch-A)
    - **Accept Both Changes**
    - Or manually edit and remove the conflict markers.

5. After resolving, stage and commit:

    ```bash
    git add greeting.txt
    git commit -m "Resolve merge conflict in greeting.txt"
    ```

---

**Tip:** Always pull the latest changes and communicate with your team to minimize conflicts.
## Creating and Merging Pull Requests on GitHub  

### Understanding Pull Requests  
A pull request (PR) allows you to propose changes to a repository. It is used to suggest new code, fix bugs, or improve the existing codebase.  

### Steps to Create a Pull Request  
1. **Fork the Repository**  
    - Go to the repository on GitHub.  
    - Click the "Fork" button to create a copy under your account.  

2. **Create a New Branch**  
    - Navigate to your forked repository.  
    - Create a new branch with a descriptive name (e.g., `feature-new-feature`).  

3. **Make Your Changes**  
    - Clone your forked repository.  
    - Make changes and commit them:  
      ```bash  
      git commit -m "Your commit message"  
      ```  

4. **Push Your Changes**  
    ```bash  
    git push origin your-branch-name  
    ```  

5. **Create a Pull Request**  
    - Go to your forked repository on GitHub.  
    - Click "Compare & pull request".  
    - Add a descriptive title and description.  
    - Click "Create pull request".  

### Merging a Pull Request  
1. **Review and Approve**  
    - The maintainer reviews your code and provides feedback.  

2. **Merge**  
    - The maintainer merges the pull request using a merge strategy like "Squash and Merge" or "Rebase and Merge".  

---

### Additional Tips  
- Use clear and concise commit messages.  
- Follow the project's coding style and conventions.  
- Ask for help if needed.  
