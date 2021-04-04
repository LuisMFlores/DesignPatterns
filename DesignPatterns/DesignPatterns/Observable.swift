//
//  Observable.swift
//  DesignPatterns
//
//  Created by luis flores on 4/4/21.
//

import Foundation

class Observable<T> {
    
    // MARK: Properties

    private var _value: T?
    public var value: T? {
        get {
            return _value
        }
        set {
            _value = newValue
            valueChanged?(newValue)
            print(value)
        }
    }
    public var valueChanged: ((T?) -> ())?
    
    
    // MARK: Initializers
    
    public init(with value: T?) {
        _value = value
    }
    
    // MARK: Methods
    
    public func binding(with value: T?) {
        _value = value
    }
}
