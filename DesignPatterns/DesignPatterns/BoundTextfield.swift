//
//  BoundTextfield.swift
//  DesignPatterns
//
//  Created by luis flores on 4/4/21.
//

import UIKit

class BoundTextfield: UITextField {
    
    // MARK: Properties

    var changedClosure: (() -> ())?
    
    // MARK: Methods
    
    @objc func valueChanged() {
        changedClosure?()
    }
    
    func bind(to observable: Observable<String>) {
        addTarget(self, action: #selector(BoundTextfield.valueChanged), for: .editingChanged)
        changedClosure = { [weak self] in
            observable.bindingChanged(to: self?.text ?? "")
        }
            observable.valueChanged = { [weak self] in
                self?.text = $0
        }
    }
}
