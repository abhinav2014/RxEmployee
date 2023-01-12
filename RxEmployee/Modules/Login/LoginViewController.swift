//
//  LoginViewController.swift
//  RxEmployee
//
//  Created by Abhinav Dobhal on 11/01/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    var coordinator = CoordinatorImpl()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation
    
    @IBAction func loginAction(_ sender: Any) {
        showEmployeeScreen(from: self, navigationMode: .push)
    }
}

extension LoginViewController: Coordinator {
    
    func showEmployeeScreen(from view: UIViewController, navigationMode: NavigationMode) {
        coordinator.showEmployeeScreen(from: self, navigationMode: .push)
    }
    
}
