# Understanding Merge, Rebase, and Squash in Git

Version Control Systems (VCS) like Git provide powerful tools to manage and streamline your codebase. Among these tools, **merge**, **rebase**, and **squash** are essential for maintaining a clean and organized commit history. Here's an overview of each:

## Merge
Merging is the process of integrating changes from one branch into another. It creates a new commit that combines the histories of both branches.

# Understanding Git Merge vs. Rebase

This guide explains the difference between `git merge` and `git rebase` using a clear timeline and commit examples.

---

## Scenario Setup

**Main Branch (`main`):**
- `C1` (10:00 AM)
- `C2` (10:05 AM)
- `C3` (10:20 AM)

**Feature Branch (`feature`):**
- `C4` (10:03 AM, branched from `C1`)
- `C5` (10:08 AM)

**Commit Graph Before Integration:**
```
    C4 -- C5  (feature)
     /
C1 -- C2 -- C3  (main)
```

---

## 1. Merge Operation

**Process:**
1. Checkout `main`:
   ```bash
   git checkout main
   git merge feature
   ```
2. Git creates a new merge commit `M`.

**Resulting History:**
```
    C4 -- C5
     /        \
C1 -- C2 -- C3 --- M  (main)
```
- All original commit IDs (`C1`–`C5`) are preserved.
- `M` (10:30 AM) is a new merge commit with two parents: `C3` and `C5`.

**When to Use:**  
- Safest for shared/public branches (e.g., remote `main`).
- Preserves full branch history (non-linear).

---

## 2. Rebase Operation

**Commit Graph Before Integration:**
```
    C4 -- C5  (feature)
     /
C1 -- C2 -- C3  (main)
```

**Process:**
1. Checkout `feature`:
   ```bash
   git checkout feature
   git rebase main
   ```
   - Git re-applies `C4` and `C5` on top of `C3`, creating new commits `C4'` and `C5'`.

**Commit Graph After Rebase (before merging to `main`):**
```
C1 -- C2 -- C3  (main)
              \
               C4' -- C5'  (feature)
```
- The `feature` branch now contains `C4'` and `C5'`, which are new commits based on top of `C3`.
- The `main` branch still points to `C3`.

**Explanation:**  
At this stage, your `feature` branch is ahead of `main`. To integrate your changes, you perform a fast-forward merge, which simply moves the `main` branch pointer to `C5'` without creating a new merge commit. This results in a clean, linear history.

2. Fast-forward merge into `main`:
   ```bash
   git checkout main
   git merge feature
   ```

**Resulting History:**
```
C1 -- C2 -- C3 -- C4' -- C5'  (main & feature)
```
- `C4'` and `C5'` are new commits (new IDs, new timestamps).
- History is linear and clean.

**When to Use:**  
- Best for cleaning up local/private branches before sharing.
- Avoid rebasing shared branches (rewrites history).

---

## Summary Table

| Feature      | Merge                                   | Rebase                                      |
|--------------|-----------------------------------------|----------------------------------------------|
| History      | Non-linear, preserves all branches      | Linear, rewrites feature branch history      |
| Commit IDs   | Original commits + new merge commit     | Feature commits get new IDs                  |
| Safety       | Safe for shared/public branches         | Use only on local/private branches           |
| Use Case     | Integrating feature branches remotely   | Cleaning up local history before merging     |

---

## Key Points

- **Merge:** Keeps all commit history, adds a merge commit. Use for shared branches.
- **Rebase:** Rewrites feature branch history, creates new commit IDs. Use for local cleanup.
- **Never rebase shared branches** that others may be using.

---

## Example Timeline with Commit IDs

| Commit | Branch   | Time     | Description                |
|--------|----------|----------|----------------------------|
| C1     | main     | 10:00 AM | Initial commit             |
| C2     | main     | 10:05 AM | Second commit              |
| C4     | feature  | 10:03 AM | Feature work (branched)    |
| C5     | feature  | 10:08 AM | More feature work          |
| C3     | main     | 10:20 AM | Third commit               |
| M      | main     | 10:30 AM | Merge commit (merge only)  |
| C4',C5'| feature  | 10:30 AM | Rebasing creates new IDs   |

---
---
## Summary and Key Differences

| Feature      | Merge                                                                 | Rebase                                                                                  |
|--------------|-----------------------------------------------------------------------|-----------------------------------------------------------------------------------------|
| **History**  | Non-linear. Preserves the exact history of when branches diverged and merged. | Linear. Creates a clean, sequential history. Rewrites commits.                          |
| **Commit IDs** | Original commits (e.g., C1–C5) are kept. A new merge commit is added. | Original commits (e.g., C4, C5) are rewritten into new commits (C4', C5') with new IDs. |
| **Safety**   | Generally safer, especially for shared branches, because it doesn't rewrite history. | Can be dangerous on shared branches because it changes commit history.                  |
| **Use Case** | Best for integrating feature branches into shared, public branches like `main`. | Best for cleaning up your own local, private commits before sharing them.               |
## Squash
Squashing combines multiple commits into a single commit. This is often used during pull requests to simplify the commit history.

### Example:
```bash
git rebase -i HEAD~n
# Choose "squash" for the commits you want to combine 
```

### Pros:
- Reduces noise in the commit history.
- Useful for polishing feature branches before merging.

### Cons:
- Loses granular commit details.

---

## Best Practices
- Use **merge** for integrating completed features into the main branch.
- Use **rebase** to keep your branch updated with the latest changes.
- Use **squash** to clean up your commit history before merging.

By understanding and using these tools effectively, you can maintain a clean and efficient workflow in Git.

## Cherry-Pick
Cherry-picking allows you to apply a specific commit from one branch to another. This is useful when you want to include a particular change without merging the entire branch.

### Example:
```bash
git checkout main
git cherry-pick <commit-hash>
```

### Pros:
- Enables selective application of changes.
- Useful for hotfixes or isolated commits.

### Cons:
- Can lead to duplicate commits if not managed carefully.
- May require conflict resolution.

---

### Use Case:
Suppose you have a bug fix in a feature branch that needs to be applied to the main branch immediately. Instead of merging the entire feature branch, you can cherry-pick the specific commit containing the fix.

```bash
git checkout main
git cherry-pick abc1234
```

This command applies the changes from the commit `abc1234` to the `main` branch.