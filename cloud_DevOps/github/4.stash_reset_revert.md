# Git Commands and Workflow Guide  

## Git Fetch  
### What it Does  
Downloads the latest commits, files, and updates from the remote repository to your local repository's tracking branches (e.g., `origin/main`), but does not merge these changes into your current working branch.  

### Usage  
Allows you to see what changes have been made remotely without affecting your working directory. Useful for reviewing changes before integrating them.  


### Step-by-Step Process

1. **Fetch Latest Changes**
    - Run `git fetch` to download new commits from the remote repository without modifying your working branch.

2. **Review Remote Changes**
    - Use `git log --oneline origin/main` to view the commit history of the remote branch and see what has changed.

3. **Merge Remote Changes**
    - Execute `git merge origin/main` to integrate the fetched changes from the remote branch into your current branch.

This process allows you to safely review and merge remote updates into your local branch.

### Scenario  
You fetch updates from the remote repository but still need to manually merge or rebase the changes into your local branch.  
git merge 
---

## Git Pull  
### What it Does  
Combines fetch and a subsequent merge (or rebase) in one step. It downloads the changes from the remote repository and immediately attempts to integrate them into your current branch.  

### Usage  
Automatically updates your working directory with the changes from the remote repository.  

### Command  
```bash  
git pull  
```  

### Scenario  
You want to get the latest changes from the remote repository and apply them to your current branch immediately.  

---
![Image](https://github.com/user-attachments/assets/0d767d99-eab9-492a-997d-5f7063566854)
## Key Difference Between Fetch and Pull  
- **Fetch**: Only downloads the data but does not affect your working directory or branches.  
- **Pull**: Downloads and automatically merges the changes into your current working branch.  

### Recommended Workflow  
- **Safe Approach**: Use `fetch` first to review changes and then manually merge them.  
- **Quick Approach**: Use `pull` when you are confident and want to update your branch in one step.  

---

## Git Stash Overview  
`git stash` temporarily saves (stashes) changes that are not ready to be committed. It is useful when you need to switch tasks or branches without committing incomplete changes.  

### Example Scenario  
Imagine you are working on a `Dockerfile` and receive a high-priority production support task. You can stash your current work to avoid losing progress.  

### Steps for Using Git Stash  
1. **Stash Your Current Changes**  
    ```bash  
    git stash  
    ```  
    Saves your current changes (both tracked and untracked files if configured) into a temporary storage area.  

2. **View Stashed Changes**  
    ```bash  
    git stash list  
    ```  
    Displays a list of all stashed changes (e.g., `stash@{0}`, `stash@{1}`).  

3. **Apply the Most Recent Stash**  
    ```bash  
    git stash apply  
    ```  
    Restores the stashed changes to your working directory without removing them from the stash list.  

4. **Apply a Specific Stash**  
    ```bash  
    git stash apply stash@{index}  
    ```  

5. **Apply and Remove the Most Recent Stash**  
    ```bash  
    git stash pop  
    ```  

6. **Remove a Specific Stash**  
    ```bash  
    git stash drop stash@{index}  
    ```  

7. **Clear All Stashed Changes**  
    ```bash  
    git stash clear  
    ```  

### Why Use Git Stash?  
- **Interruptions in Work**: Switch tasks without committing incomplete changes.  
- **Clean Working Directory**: Keep your workspace clean.  
- **Context Switching**: Quickly switch between branches or tasks.  
- **Experimentation**: Save experimental changes temporarily.  

---

## Git Revert  
`git revert` undoes changes from a previous commit by creating a new commit that reverses those changes. It does not modify commit history, making it safer for collaborative work.  

### Example  
```bash  
git revert 98bd832  
```  
Creates a new commit that undoes the changes introduced by commit `98bd832`.  

---

## Git Reset  
`git reset` moves the `HEAD` pointer to a previous commit, effectively "resetting" your branch to that point.  

### Types of Reset  
1. **Soft Reset**  
    - **Effect**: Moves the `HEAD` pointer to a specific commit while keeping changes staged.  
    - **Command**:  
      ```bash  
      git reset --soft HEAD~1  
      ```  

2. **Mixed Reset (Default)**  
    - **Effect**: Moves the `HEAD` pointer to a specific commit, unstages the changes, but keeps them in the working directory.  
    - **Command**:  
      ```bash  
      git reset HEAD~1  
      ```  

3. **Hard Reset**  
    - **Effect**: Moves the `HEAD` pointer to a specific commit and discards all changes after that point.  
    - **Command**:  
      ```bash  
      git reset --hard HEAD~1  
      ```  

---
