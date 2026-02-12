# Computer Architecture & Data Flow Overview


## 1. Introduction to the Computer System
A computer is an electronic device that processes data through programmable instructions. It operates via a synergy between **Hardware** (physical components) and **Software** (instructions).

### Hardware Components
* **CPU (Central Processing Unit):** The "Brain." Executes instructions and manages data flow.
* **Memory (RAM):** Fast, volatile temporary storage for active tasks.
* **Storage (HDD/SSD):** Permanent, non-volatile storage for files and the OS.
* **Motherboard:** The central nervous system connecting all components.
* **PSU, Input, and Output:** Power supply and user interface tools (Keyboard, Monitor, etc.).

---

![Image](https://github.com/user-attachments/assets/52b40e33-47b4-44ab-9e33-9c088febc5f9)

## 2. The CPU: Core Logic & Internal Memory
The CPU doesn't just "do" math; it manages a complex hierarchy of internal storage to stay efficient.

### The Sub-Units
1.  **Control Unit (CU):** The director. It fetches, decodes, and manages data flow between the CPU and other hardware.
2.  **Arithmetic Logic Unit (ALU):** The calculator. Performs math and logical comparisons.

### Internal Memory Hierarchy (Static Memory)
To avoid waiting for the slower RAM, the CPU uses two types of high-speed storage:
* **Registers:** The smallest and fastest storage. Data **must** be in a register to be executed by the ALU.
* **Cache (L1, L2, L3):** Made of **SRAM (Static RAM)**. It stores frequently used data based on *repetition* (Temporal Locality).
    * *L1:* Smallest, fastest, located inside the core.
    * *L3:* Largest cache, shared across multiple cores.

---

## 3. Data Flow: From Request to Execution
When a user initiates a task (e.g., opening Chrome), the data moves through a specific "Relay Race":

### The Step-by-Step Path


1.  **User Request:** You click an icon; the OS receives the interrupt.
2.  **OS Response:** The OS locates the program files on the **HDD/SSD**.
3.  **Loading to RAM:** Since the CPU cannot run programs directly from the slow HDD/SSD, the files are loaded into **RAM** via the system bus.
4.  **CU Fetching:** The **Control Unit** fetches instructions from RAM using memory addresses.
5.  **Caching:** If the task is repeated, the CU keeps that data in the **SRAM Cache** to avoid going back to RAM.
6.  **Processing (The Cycle):** * Data moves into **Registers**.
    * The **CU** decodes the instruction.
    * The **ALU** executes the calculation.
7.  **Output:** Results are sent to the GPU (for display) or written back to the RAM/Storage.

---

## 4. Key Performance Insights
| Component | Volatility | Speed | Role |
| :--- | :--- | :--- | :--- |
| **SSD/HDD** | Non-Volatile | Slowest | Permanent Home |
| **RAM** | Volatile | Fast | Active Workspace |
| **SRAM (Cache)** | Volatile | Very Fast | Repeated Data Storage |
| **Registers** | Volatile | Instant | Execution Point |

**Summary of Data Flow:**
`HDD/SSD` $\rightarrow$ `RAM` $\rightarrow$ `Cache (SRAM)` $\rightarrow$ `Registers` $\rightarrow$ `ALU (Execution)`