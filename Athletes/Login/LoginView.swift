//
//  LoginView.swift
//  Athletes
//
//  Created by Michael Slattery on 10/17/20.
//

import UIKit

class LoginView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubviews()
        addConstraints()
    }
    
    func addSubviews() {
        addSubview(usernameTextField)
        addSubview(passwordTextField)
        addSubview(logInButton)
    }
    
    func addConstraints() {
        
        let defaultSpacing = Constants.defaultSpacing
        
        NSLayoutConstraint.activate([
            
            usernameTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: defaultSpacing * 2),
            usernameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: defaultSpacing),
            self.trailingAnchor.constraint(equalTo: usernameTextField.trailingAnchor, constant: defaultSpacing),
            
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: defaultSpacing),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: defaultSpacing),
            self.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor, constant: defaultSpacing),
            
            logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: defaultSpacing),
            logInButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: defaultSpacing),
            self.trailingAnchor.constraint(equalTo: logInButton.trailingAnchor, constant: defaultSpacing)
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let usernameTextField: DetailedTextField = {
        let t = DetailedTextField()
        t.placeholder = "Username"
        t.layer.borderWidth = 1.0
        t.autocorrectionType = .no
        t.autocapitalizationType = .none
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    
    let passwordTextField: DetailedTextField = {
        let t = DetailedTextField()
        t.placeholder = "Password"
        t.layer.borderWidth = 1.0
        t.isSecureTextEntry = true
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    
    let logInButton: UIButton = {
        let b = UIButton()
        b.setTitle("Log In", for: .normal)
        b.backgroundColor = .systemBlue
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
}
