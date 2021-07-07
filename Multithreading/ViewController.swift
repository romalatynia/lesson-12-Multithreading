//
//  ViewController.swift
//  Multithreading
//
//  Created by Harbros47 on 5.01.21.
//

import UIKit

class ViewController: UIViewController {
    private let value = 40
    private let range = 0...100
    private let newValue = 23

    private let vlad = Student(name: "Влад")
    private let dima = Student(name: "Дима")
    private let vadim = Student(name: "Вадим")
    private let viktor = Student(name: "Витя")
    private let roma = Student(name: "Рома")

    private let arina = StudentOper(name: "Арина")
    private let anya = StudentOper(name: "Аня")
    private let diana = StudentOper(name: "Диана")
    private let nastya = StudentOper(name: "Настя")
    private let yana = StudentOper(name: "Яна")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let students = [
            vlad,
            dima,
            vadim,
            viktor,
            roma
        ]
        
        let singletoneQeue = Singletone.singletone.concurrent
        guess(students: students, queue: singletoneQeue)
        
        let studentsOper = [
            arina,
            anya,
            diana,
            nastya,
            yana
        ]
        
        operationGuess(studentsOper: studentsOper)
    }
    
    private func guess(students: [Student], queue: DispatchQueue) {
        queue.async {
            students.forEach { $0.guessAnswer(randomNumber: self.value, range: self.range) { name, random in
                print("\(name) угадал число \(random)")}
            }
        }
    }
    
    private func operationGuess(studentsOper: [StudentOper]) {
        let operationQueue = OperationQueue()
        operationQueue.addOperation {
            studentsOper.forEach { $0.guessAnswer(randomNumber: self.newValue, range: self.range) { name, random in
                print("\(name) угадал число \(random)")}
            }
        }
    }
}
