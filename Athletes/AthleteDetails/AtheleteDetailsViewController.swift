//
//  AtheleteDetailsViewController.swift
//  Athletes
//
//  Created by Michael Slattery on 10/17/20.
//

import UIKit

class AtheleteDetailsViewController: UIViewController {
    
    var athleteDetailsView: AthleteDetailsView = {
        let a = AthleteDetailsView(frame: UIScreen.main.bounds)
        return a
    }()
    
    override func viewDidLoad() {
        view = athleteDetailsView
    }
    
    func setup(athlete: Athlete) {
        athleteDetailsView.setup(athlete: athlete)
    }
}
