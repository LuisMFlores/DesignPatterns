//
//  ObservableTextField.swift
//  DesignPatterns
//
//  Created by luis flores on 4/4/21.
//

import UIKit

class ObservableTextField: UITextField {
    
    // MARK: Properties
    
    public var changedClosure: (() -> ())?
    
    // MARK: Methods
    
    @objc public func valueChanged() {
        changedClosure?()
    }
    
    public func bind(with observableText: Observable<String>?) {
        addTarget(self, action: #selector(valueChanged), for: .editingChanged)
        changedClosure = { [weak self] in
            observableText?.value = self?.text
        }
        
        observableText?.valueChanged = {
            self.text = $0
        }
        
        self.text = observableText?.value
    }
}
