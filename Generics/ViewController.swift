//
//  ViewController.swift
//  Generics
//
//  Created by Milos Dimic on 11/29/18.
//  Copyright © 2018 Milos Dimic. All rights reserved.
//

import UIKit

protocol Summable {
    static func +(lhs: Self, rhs: Self) -> Self
}

protocol Substractable {
    static func -(lhs: Self, rhs: Self) -> Self
}

extension Int: Summable, Substractable {}
extension Double: Summable, Substractable {}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let addedDoubles = add(a: 3.3, b: 5.2)
        print(addedDoubles)
        
        let addedIntegers = add(a: 1, b: 77)
        print(addedIntegers)
        
        let middleMember = getMiddleMember(array: [4,1,5,3,2])
        print(middleMember)
        
        let middleValue = getMiddleMember(array: ["c","a","b"])
        print(middleValue)
        
        let pairsOfInt = pairs(data: [1:3, 2:3])
        print(pairsOfInt)
        
        let pairsOfIntAndString = pairs(data: [1:"nj", 2:"w"])
        print(pairsOfIntAndString)
        
        var qInt = Queue<Int>()
        qInt.enqueue(newElement: 483683683)
        print(qInt.elements)
        qInt.enqueue(newElement: 121119902)
        print(qInt.elements)
        
        var qString = Queue<String>()
        qString.enqueue(newElement: "first")
        print(qString.elements)
    }
    
    func add<T: Summable>(a: T, b: T) -> T {
        return a + b
    }
    
    func substract<T: Substractable>(a: T, b: T) -> T {
        return a - b
    }

    func getMiddleMember<T>(array: [T]) -> T {
        return array[(array.count - 1) / 2]
    }

    func getMiddleValue<T: Comparable>(array: [T]) -> T {
        return array.sorted()[(array.count - 1) / 2]
    }
    
    func pairs<K,V>(data: [K:V]) -> [(K,V)] {
        return Array(data)
    }

}


struct Queue<Element> {
    
    private (set) var elements: [Element] = []
    
    mutating func enqueue(newElement:Element) {
        elements.append(newElement)
    }
    
    mutating func dequeue() -> Element? {
        guard !elements.isEmpty else { return nil }
        return elements.remove(at: 0)
    }
    
}
