//
//  Observale.swift
//  MVVM Movie
//
//  Created by Nasser Mohamed on 31/05/2023.
//

import Foundation
class Observale<T>{
    var value :T?{didSet{
        DispatchQueue.main.async {
            self.listener?(self.value)
        }
    }}
    init(_ value: T? ) {
        self.value = value
    }
    private var listener: ((T?)->Void)?
    func bind(_ listener: @escaping ((T?)->Void)){
        listener(value)
        self.listener = listener
    }
    
}
