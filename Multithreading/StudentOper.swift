//
//  StudentOper.swift
//  Multithreading
//
//  Created by Harbros47 on 5.01.21.
//

import Foundation

class StudentOper {
    var name: String
   
    let queue = DispatchQueue(label: "Developer")
    func guessAnswer(randomNumber: Int, range: ClosedRange<Int>, closure: @escaping (String, Int) -> Void) {
        queue.async {
        var random = Int.random(in: range)
        while random != randomNumber {
            random = Int.random(in: range)
        }
            DispatchQueue.main.async {
                closure(self.name, random)
            }
        }
    }
    
    init(name: String) {
        self.name = name
    }
}
