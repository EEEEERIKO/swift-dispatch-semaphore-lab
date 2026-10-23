# Swift Dispatch Semaphore Lab

A Swift concurrency lab exploring multithreading, concurrency limits, and task synchronization using Grand Central Dispatch (GCD) and `DispatchSemaphore`.

## 🎯 Objective

Understand how multiple tasks can execute concurrently and how to control the maximum number of tasks running simultaneously using a semaphore.

## 🧠 Concepts Covered

- **`Thread`** — Creates and starts independent threads of execution.
- **`DispatchSemaphore`** — Limits concurrent access to a protected section of code using a fixed number of permits.
- **`DispatchGroup`** — Tracks multiple tasks and waits until they have all completed.
- **`wait()` and `signal()`** — Acquire and release semaphore permits.
- **`defer`** — Ensures resources are released when a function scope exits.
- **Concurrency** — Demonstrates how execution order can vary between runs.

## ⚙️ How It Works

The program creates five tasks using `Thread`. Each task attempts to acquire a semaphore permit before starting its work.

The semaphore is initialized with two permits:

```swift
let semaphore = DispatchSemaphore(value: 2)
```

This allows **at most two tasks at a time** to execute the code protected by the semaphore. If both permits are occupied, additional threads wait until a permit becomes available.

Each task simulates work with `sleep(1)` and releases its permit using `defer` and `semaphore.signal()`.

A `DispatchGroup` tracks all five threads, allowing the main execution flow to wait until every task has finished.

## 🛠️ Technologies

- Swift
- Foundation
- Grand Central Dispatch (GCD)
- Xcode

## 🚀 How to Run

1. Clone or download this repository.
2. Open `DispatchSemaphoreLab.playground` in Xcode, or create a Swift command-line project named `DispatchSemaphoreLab` and place the code in `main.swift`.
3. Run the program.
4. Inspect the console output to observe task execution and completion.

## 📂 Project Structure

```text
swift-dispatch-semaphore-lab/
├── DispatchSemaphoreLab/
│   └── main.swift
└── README.md
```

If using a command-line project instead of a Playground, the source file can be named `main.swift`.

## 📋 Expected Output

The exact order may vary between executions. A possible output is:

```text
Task 1 started
Task 2 started
Task 1 finished
Task 3 started
Task 2 finished
Task 4 started
Task 3 finished
Task 5 started
Task 4 finished
Task 5 finished
All tasks finished
```

The important behavior is that all five tasks finish and the program prints `All tasks finished` at the end. No more than two tasks can execute inside the semaphore-protected section simultaneously.

## 📚 Key Takeaway

A semaphore controls how many tasks may enter a critical section concurrently. Combined with `DispatchGroup`, it provides a simple way to limit concurrency while waiting for a collection of tasks to complete.

---

**Project type:** Swift learning exercise  
**Focus:** Multithreading, GCD, concurrency control, and synchronization
