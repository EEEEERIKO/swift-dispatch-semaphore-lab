//
//  main.swift
//  DispatchSemaphoreLab
//
//  Created by Erik Valencia Cardona on 23/10/26.
//

import Foundation

// MARK: - 1. Task

func performTask(id: Int, semaphore: DispatchSemaphore) {
    semaphore.wait()

    defer {
        semaphore.signal()
    }

    print("Task \(id) started")

    sleep(1)

    print("Task \(id) finished")
}


// MARK: - 2. Run Limited Concurrent Tasks

func runConcurrentTasks() {
    let semaphore = DispatchSemaphore(value: 2)

    let group = DispatchGroup()

    for id in 1...5 {
        group.enter()

        Thread {
            defer {
                group.leave()
            }

            performTask(id: id, semaphore: semaphore)
        }.start()
    }

    group.wait()

    print("All tasks finished")
}

runConcurrentTasks()
