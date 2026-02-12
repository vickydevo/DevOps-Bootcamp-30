## 📘 1.3 Guided Examples + Dry Run (1 Hour)

### What is Dry Run?

Dry run means:

> **Manually executing the pseudocode step-by-step using paper**

It helps to:

* Find errors
* Understand logic
* Build confidence

---

### Example 1: Print Even Numbers from 1 to 100

Pseudocode:

```
FOR i FROM 1 TO 100
    IF i MOD 2 == 0
        OUTPUT i
    END IF
END FOR
```

Dry Run (First Few Steps):

| i | i % 2 | Output |
| - | ----- | ------ |
| 1 | 1     | No     |
| 2 | 0     | 2      |
| 3 | 1     | No     |
| 4 | 0     | 4      |

---

### Example 2: Check if a Number is Prime (Simple Method)

Pseudocode:

```
INPUT n
count = 0
FOR i FROM 1 TO n
    IF n MOD i == 0
        count = count + 1
    END IF
END FOR

IF count == 2
    OUTPUT "Prime"
ELSE
    OUTPUT "Not Prime"
END IF
```

---

### Example 3: Largest of Three Numbers

```
INPUT a, b, c
max = a

IF b > max
    max = b
END IF

IF c > max
    max = c
END IF

OUTPUT max
```

---

### Example 4: Grade Calculation Using IF–ELSE

```
INPUT marks
IF marks >= 75
    OUTPUT "Distinction"
ELSE IF marks >= 60
    OUTPUT "First Class"
ELSE IF marks >= 40
    OUTPUT "Pass"
ELSE
    OUTPUT "Fail"
END IF
```

---