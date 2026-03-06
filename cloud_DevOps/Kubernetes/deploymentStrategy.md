### `README.md`

# Software Deployment Strategies

This document outlines the most common strategies for deploying software updates to production environments, ranging from simple manual methods to advanced zero-downtime techniques.

---

## 1. Recreate

**The "Turn it off and on" Method.**

* **How it works:** Version A is fully shut down before Version B is started. There is a period where no service is available to the user.
* **When to use:** When your application cannot handle two versions running simultaneously (e.g., major database migrations) and a short window of downtime is acceptable.
* **Pros:** Simple; no version compatibility issues.
* **Cons:** High downtime; poor user experience during the transition.

---

## 2. Rolling Update

**The "One-by-One" Method.**

* **How it works:** New instances (Version B) are added one at a time while old instances (Version A) are removed. The load balancer gradually shifts traffic to the new instances as they pass health checks.
* **When to use:** The standard for most web applications where zero downtime is required and the app is backward compatible.
* **Pros:** Zero downtime; cost-effective as it doesn't require double the infrastructure.
* **Cons:** Slow rollout; for a period, users may see different versions of the app (Session Affinity issues).

---

## 3. Blue-Green

**The "Switcheroo" Method.**

* **How it works:** You maintain two identical, separate environments. "Blue" is live; "Green" is the new version. Once Green is fully tested in isolation, the router/load balancer flips 100% of the traffic to Green.
* **When to use:** High-availability systems where you need an instant "Undo" button (flipping back to Blue).
* **Pros:** Zero downtime; extremely low risk; instant rollbacks.
* **Cons:** Expensive; requires doubling your hosting resources during the flip.

---

## 4. Canary Deployment

**The "Beta Test" Method.**

* **How it works:** You deploy Version B to a tiny subset of servers (e.g., 5% of traffic). You monitor errors and logs; if successful, you slowly ramp up to 100%.
* **When to use:** For mission-critical apps where you want to test new features on real users without risking the entire population.
* **Pros:** Best for risk mitigation; allows for "real-world" performance monitoring.
* **Cons:** Complex to set up (requires advanced traffic shaping/service mesh).

---

## 5. Big Bang Deployment

**The "All-at-Once" Method.**

* **How it works:** All servers/instances are updated to Version B simultaneously. Unlike "Recreate," which waits for a shutdown, a Big Bang attempt tries to swap everything instantly.
* **When to use:** Legacy systems or massive, synchronized updates where partial rollouts are technically impossible.
* **Pros:** Fast; ensures all users are on the same version at the exact same time.
* **Cons:** **Extremely Risky.** If Version B has a bug, it affects 100% of your users immediately. Rollbacks are difficult and stressful.

---

## 6. Shadow Deployment

**The "Invisible" Method.**

* **How it works:** Version B is deployed alongside Version A. Incoming traffic is "forked"—Version A handles the real request, while Version B processes a copy of the request in the background to test performance.
* **When to use:** For high-load backend changes where you need to see how the code handles real traffic without impacting the user.
* **Pros:** Zero risk to users; perfect for stress testing.
* **Cons:** High complexity; risk of "side effects" (e.g., duplicate emails or database writes).

---

## Strategy Comparison Matrix

| Strategy | Downtime | Risk | Cost | Complexity |
| --- | --- | --- | --- | --- |
| **Recreate** | High | Medium | Low | Low |
| **Rolling** | None | Medium | Low | Medium |
| **Blue-Green** | None | Low | High | Medium |
| **Canary** | None | Lowest | Medium | High |
| **Big Bang** | Minimal | High | Low | Low |
| **Shadow** | None | Zero | High | Very High |

---
