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
        
        athletesCollectionView.backgroundColor = .white
        addSubview(athletesCollectionView)
        
        NSLayoutConstraint.activate([
            athletesCollectionView.topAnchor.constraint(equalTo: self.topAnchor),
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
}
