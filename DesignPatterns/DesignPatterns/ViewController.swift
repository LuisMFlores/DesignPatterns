//
//  ViewController.swift
//  DesignPatterns
//
//  Created by luis flores on 4/4/21.
//

import UIKit

class ViewController: UIViewController {

    var user = User(name: Observable("Luis Flores"))
    // MARK: IBOutlets
    
    @IBOutlet weak var usernameTextfield: BoundTextfield!
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextfield.bind(to: user.name)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.user.name.value = "Luis Manuel"
        }
    }
    

}

