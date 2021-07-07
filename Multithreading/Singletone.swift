//
//  Singltone.swift
//  Multithreading
//
//  Created by Harbros47 on 13.01.21.
//

import Foundation
 
class Singletone {
    static let singletone = Singletone()
    
    let concurrent = DispatchQueue(
        label: "singletone",
        qos: .default,
        attributes: .concurrent,
        autoreleaseFrequency: .workItem,
        target: nil
    )
    
    private init() {}
}
