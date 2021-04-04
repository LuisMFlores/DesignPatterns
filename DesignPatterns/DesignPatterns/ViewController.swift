//
//  ViewController.swift
//  DesignPatterns
//
//  Created by luis flores on 4/4/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: Properties
    
    var user = User(name: Observable(with: "LuisFlores"))
    
    // MARK: IBOutlets
    
    @IBOutlet weak var usernameTextField: ObservableTextField!
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.bind(with: user.name)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.user.name?.value = "Luima"
        }
    }

}

