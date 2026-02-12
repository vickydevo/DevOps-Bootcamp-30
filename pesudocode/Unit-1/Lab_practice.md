
Below is a **clean, university-ready `README.md`** containing **only pseudocode**, written in a **simple, beginner-friendly style**, exactly matching your **Lab / Practice (1 hour)** requirement.

You can **directly copy–paste** this into a file named `README.md`.

---

# Lab / Practice – Unit 1

## Pseudocode Practice (1 Hour)

**Course:** Pseudocode – Placement-Oriented Module
**Unit:** Unit 1 – Basics & Control Flow
**Focus:** Writing clear, structured pseudocode (NO actual programming language)

---

## 📝 Instructions to Students

* Write **only pseudocode**, not Python / C / Java code
* Follow proper indentation
* Use keywords like `INPUT`, `OUTPUT`, `IF`, `FOR`, `END IF`, `END FOR`
* Think step-by-step before writing
* Dry-run your logic mentally or on paper

---

## 1️⃣ Sum of First N Natural Numbers

### Problem Statement

Given a number **N**, find the sum of the first **N natural numbers**.

Example:
If N = 5 → Sum = 1 + 2 + 3 + 4 + 5 = 15

---

### Pseudocode

```
INPUT N
sum = 0

FOR i FROM 1 TO N
    sum = sum + i
END FOR

OUTPUT sum
```

---

## 2️⃣ Check if a Year is a Leap Year

### Problem Statement

Given a year, check whether it is a **leap year** or **not**.

### Leap Year Rules (Simple):

* Year divisible by 400 → Leap year
* OR year divisible by 4 AND not divisible by 100

---

### Pseudocode

```
INPUT year

IF (year MOD 400 == 0)
    OUTPUT "Leap Year"
ELSE IF (year MOD 4 == 0 AND year MOD 100 != 0)
    OUTPUT "Leap Year"
ELSE
    OUTPUT "Not a Leap Year"
END IF
```

---

## 3️⃣ Print All Multiples of 3 Up to N

### Problem Statement

Given a number **N**, print all numbers up to **N** that are divisible by 3.

Example:
If N = 10 → Output: 3, 6, 9

---

### Pseudocode

```
INPUT N

FOR i FROM 1 TO N
    IF i MOD 3 == 0
        OUTPUT i
    END IF
END FOR
```

---

## ✅ Expected Learning from This Lab

By completing this lab, students should be able to:

✔ Write basic pseudocode using sequence, IF, and loops
✔ Apply logical conditions correctly
✔ Think step-by-step without syntax fear
✔ Prepare for interview-style logic questions

---

📌 **Note:**
Actual programming code (Python / C / Java) is **not required** for this lab.
Focus is on **logic clarity**, not syntax.

---

If you want next, I can:

* Add **dry-run tables** for these problems
* Prepare **Unit 2 Lab pseudocode**
* Create **answer-key + common mistakes**

Just say **NEXT LAB** 👍
