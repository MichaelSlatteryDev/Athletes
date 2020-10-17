//
//  ViewController.swift
//  Athletes
//
//  Created by Michael Slattery on 10/17/20.
//

import UIKit

class LoginViewController: UIViewController {
    
    lazy var loginView: LoginView = {
        let l = LoginView(frame: UIScreen.main.bounds)
        return l
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = loginView
        
        loginView.logInButton.addTarget(self, action: #selector(logIn), for: .touchUpInside)
        
//        Api.shared.login(username: "sampleUsername", password: "samplePassword") { username in
//            print(username)
//        }
//        Api.shared.getAthletes() { athletes in
//            print(athletes)
//        }
//        Api.shared.getSquads() { squads in
//            print(squads)
//        }
    }
    
    @objc func logIn() {
        guard let username = loginView.usernameTextField.text, let password = loginView.passwordTextField.text else { return }
        
        Api.shared.login(username: username, password: password) { username in
            print(username)
        }
    }
}

