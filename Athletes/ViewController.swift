//
//  ViewController.swift
//  Athletes
//
//  Created by Michael Slattery on 10/17/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPurple
        // Do any additional setup after loading the view.
        
        Api.shared.login(username: "sampleUsername", password: "samplePassword") { username in
            print(username)
        }
        Api.shared.getAthletes() { athletes in
            print(athletes)
        }
        Api.shared.getSquads() { squads in
            print(squads)
        }
    }
}

