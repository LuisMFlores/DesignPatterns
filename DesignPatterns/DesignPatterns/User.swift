//
//  User.swift
//  DesignPatterns
//
//  Created by luis flores on 4/4/21.
//

import Foundation

struct User {
    
    // MARK: Properties
    
    var name: Observable<String>
    
}

class Observable<ObservedType> {
    
    // MARK: Properties
    
    private var _value: ObservedType?
    var valueChanged: ((ObservedType?) -> ())?
    public var value: ObservedType? {
        get {
            return _value
        } set {
            _value = newValue
            valueChanged?(_value)
        }
    }
    
    // MARK: Initializers
    
    init(_ value: ObservedType) {
        _value = value
    }
    
    // MARK: Methods
    
    func bindingChanged(to newValue: ObservedType) {
        _value = newValue
        print("New value is \(_value)")
    }
}
