//
//  AthletesView.swift
//  Athletes
//
//  Created by Michael Slattery on 10/17/20.
//

import UIKit

class AthletesView: UIView {
    
    static let cellReuseIdentifier = "AthleteCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        athletesCollectionView.backgroundColor = .white
        addSubview(athletesCollectionView)
        addSubview(backButton)
        addSubview(filterButton)
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: self.topAnchor, constant: Constants.defaultSpacing),
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.smallSpacing),
            backButton.trailingAnchor.constraint(equalTo: self.centerXAnchor),
            
            filterButton.topAnchor.constraint(equalTo: backButton.topAnchor),
            self.trailingAnchor.constraint(equalTo: filterButton.trailingAnchor, constant: Constants.smallSpacing),
            filterButton.leadingAnchor.constraint(equalTo: self.centerXAnchor),
            
            athletesCollectionView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: Constants.smallSpacing),
            athletesCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: athletesCollectionView.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: athletesCollectionView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let athletesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let c = UICollectionView(frame: .zero, collectionViewLayout: layout)
        c.translatesAutoresizingMaskIntoConstraints = false
        c.register(AthleteCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
        return c
    }()
    
    let backButton: UIButton = {
        let b = UIButton()
        b.setTitle("Back", for: .normal)
        b.setTitleColor(.systemBlue, for: .normal)
        b.backgroundColor = .white
        b.translatesAutoresizingMaskIntoConstraints = false
        b.contentHorizontalAlignment = .left
        return b
    }()
    
    let filterButton: UIButton = {
        let b = UIButton()
        b.setTitle("Filter", for: .normal)
        b.setTitleColor(.systemBlue, for: .normal)
        b.backgroundColor = .white
        b.translatesAutoresizingMaskIntoConstraints = false
        b.contentHorizontalAlignment = .right
        return b
    }()
}
