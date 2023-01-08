//
//  Box.swift
//  Architect
//
//  Created by Александр Коробицын on 02.12.2022.
//

import Foundation

class Box<T> {
    
    init(value: T) {
        self.value = value
    }
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    var listener: ((T) -> Void)?
    
    func bind(completion: @escaping(T) -> Void) {
        self.listener = completion
        completion(value)
    }
}


