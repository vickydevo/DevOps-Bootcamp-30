# 4 Stages in Git
![Image](https://github.com/user-attachments/assets/6f535013-9a08-4403-9c8b-ef5b39b96e6a)
## 1. Work Area / Untracked  
This is where you make changes to your files. These changes are not yet tracked by Git.  
```bash
git add .
```

## 2. Staging Area / Tracked  
Files are added to the staging area and are ready to be committed.  
```bash
git commit -m "<message>"
```

## 3. Local Repository  
Your changes are committed to your local repository.  
```bash
git push
```

## 4. Remote Repository  
Your changes are pushed to the remote repository.  

### Useful Commands:
- View commit history:  
    ```bash
    git log
    ```
- Check for remote repository:  
    ```bash
    git remote        # Output: origin
    git remote -v
    ```
- Clone a remote repository:  
    ```bash
    git clone <url>
    ```

---

# Git Branch
## What Are Branches in Git?

Branches in Git are a way to work on different versions of a repository at one time. They allow developers to isolate their work, experiment with new features, fix bugs, or collaborate with others without affecting the main codebase.

### Why Use Branches?

1. **Isolation**: Keep your work separate from the main codebase until it's ready.
2. **Collaboration**: Multiple developers can work on different features simultaneously.
3. **Version Control**: Maintain a clean history of changes for each feature or bug fix.
4. **Testing**: Test new features or fixes in isolation before merging them into the main branch.

### How Branches Work

- The `main` branch (or `master`) is typically the default branch where stable code resides.
- Developers create new branches for specific tasks, such as adding a feature or fixing a bug.
- Once the work is complete, the branch is merged back into the main branch.

By using branches effectively, teams can maintain a clean and organized workflow, ensuring that the main branch always contains stable and production-ready code.
## Different Teams and Branches:
- **Development Team**: Works on new features or requirements.  
- **Testing Team**: Tests the code for bugs.  
- **DevOps Team**: Manages deployment and infrastructure.  


### What is a Branching Strategy?

A branching strategy is a set of rules or guidelines that a development team follows to manage branches in a version control system like Git. It defines how and when branches are created, merged, and deleted to ensure a smooth and efficient workflow. A good branching strategy helps teams collaborate effectively, maintain code quality, and deliver features or fixes faster.

### Common Branching Strategies

1. **Git Flow**:
    - A well-defined strategy with dedicated branches for features, releases, and hotfixes.
    - Example branches: `main`, `develop`, `feature/*`, `release/*`, `hotfix/*`.
    - **Use Case**: Suitable for projects with scheduled releases.

2. **GitHub Flow**:
    - A simpler strategy with a single `main` branch and short-lived feature branches.
    - Developers create feature branches, merge them into `main`, and deploy directly.
    - **Use Case**: Ideal for continuous deployment workflows.

3. **GitLab Flow**:
    - Combines GitHub Flow with environment-specific branches (e.g., `staging`, `production`).
    - **Use Case**: Useful for teams managing multiple environments.

4. **Trunk-Based Development**:
    - Developers work directly on a single branch (`main` or `trunk`) with frequent commits.
    - Feature flags are often used to manage incomplete features.
    - **Use Case**: Best for teams practicing continuous integration and delivery.

---

### Examples of Branching Strategies in MNCs

1. **Microsoft**:
    - Uses a combination of GitHub Flow and Trunk-Based Development.
    - Focuses on short-lived feature branches and frequent integration into `main`.

2. **Google**:
    - Primarily follows Trunk-Based Development.
    - Developers commit directly to the main branch with rigorous code reviews.

3. **Amazon**:
    - Uses a custom branching strategy tailored for microservices.
    - Each team manages its own repository with feature branches merged into `main`.

### Choosing the Right Strategy

When selecting a branching strategy, consider:
- **Team Size**: Larger teams may benefit from Git Flow, while smaller teams can use GitHub Flow.
- **Release Frequency**: Frequent releases align well with Trunk-Based Development or GitHub Flow.
- **Project Complexity**: Complex projects may require Git Flow for better organization.
- **Tooling**: Ensure the strategy integrates well with CI/CD pipelines and tools.

By adopting a branching strategy that fits your team's needs, you can streamline development, reduce conflicts, and deliver high-quality software efficiently.

## Branch Management Commands:

### Create a New Branch:
```bash
git branch <branch-name>
```

### List Available Branches:
```bash
git branch
```

### Push a New Branch to Remote Repository:
```bash
git push --set-upstream origin <branch-name>
# Short version:
git push -u origin <branch-name>
```

### Switch to a New Branch:
```bash
git checkout <branch-name>
```

### Push Changes in a New Branch:
Ensure `HEAD` is pointing to the new branch:  
```bash
git push
```

---

## Checking Commits in Local Repository:
```bash
git log
git log --oneline
```

---

## Working with Remote Branches:

### List Remote Branches:
```bash
git branch -r
```

### Pull Changes from Remote to Local Repository:
```bash
git pull
```

---

## Real-Time Example:

1. **Create a Feature Branch**:  
     ```bash
     git branch feature/new-feature
     git checkout feature/new-feature
     ```
    **In a single command:**  
    To create a new branch called `feature/home` and switch to it while creating a `home.py` file:
    ```bash
    git checkout -b feature/home && touch home.py
    ```


2. **Make Changes and Commit**:  
     ```bash
     git add .
     git commit -m "Added new feature"
     ```

3. **Push Feature Branch to Remote**:  
     ```bash
     git push -u origin feature/new-feature
     ```

4. **Merge Changes to Development Branch**:  
     ```bash
     git checkout development
     git merge feature/new-feature
     ```

5. **Push Development Branch to Remote**:  
     ```bash
     git push
     ```
6. **Delete Any Local and Remote Branch**:  
    - Delete a local branch:  
        ```bash
        git branch -d feature/login
        ```
    - Delete a remote branch:  
        ```bash
        git push origin --delete feature/login
        ```
7. **Quick Reference: Cloning and Working with Branches**:

    - Clone a Repository

        ```bash
        git clone <url>
        ```

    - List All Branches (Local and Remote)

        ```bash
        git branch -a
        ```

