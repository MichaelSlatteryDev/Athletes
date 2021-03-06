//
//  AthletesViewController.swift
//  Athletes
//
//  Created by Michael Slattery on 10/17/20.
//

import UIKit
import SDWebImage

class AthletesViewController: UIViewController {
    
    var allAthletes: [Athlete]?
    var athletes: [Athlete]?
    
    var athletesView: AthletesView = {
        let a = AthletesView(frame: UIScreen.main.bounds)
        return a
    }()
    
    override func viewDidLoad() {
        
        view = athletesView
        
        athletesView.athletesCollectionView.delegate = self
        athletesView.athletesCollectionView.dataSource = self
        
        athletesView.backButton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        athletesView.filterButton.addTarget(self, action: #selector(filterTapped), for: .touchUpInside)
        
        Api.shared.getAthletes() { [weak self] response in
            guard let athletes = response?.athletes else { return }
            
            self?.allAthletes = athletes
            self?.athletes = athletes
            
            DispatchQueue.main.async {
                self?.athletesView.athletesCollectionView.reloadData()
            }
        }
    }
    
    @objc func backTapped() {
        dismiss(animated: true)
    }
    
    @objc func filterTapped() {
        let filterViewController = FilterViewController()
        filterViewController.modalPresentationStyle = .overCurrentContext
        filterViewController.modalTransitionStyle = .crossDissolve
        filterViewController.delegate = self
        present(filterViewController, animated: true)
    }
}

extension AthletesViewController: FilterDelegate {
    func filter(squadId: Int?) {
        if let squadId = squadId {
            athletes = allAthletes?.filter { $0.squadIds.contains(squadId) }
        } else {
            athletes = allAthletes
        }
        athletesView.athletesCollectionView.reloadData()
    }
}

extension AthletesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let noOfCellsInRow = 3

        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout

        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))

        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let athletes = athletes else { return 0 }
        return athletes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let athletes = athletes, let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AthletesView.cellReuseIdentifier, for: indexPath) as? AthleteCell else { return UICollectionViewCell() }
        
        let athlete = athletes[indexPath.row]
        cell.setup(username: athlete.username, imageUrl: athlete.image.url)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let athletes = athletes else { return }
        
        let athlete = athletes[indexPath.row]
        let athleteDetailsViewController = AtheleteDetailsViewController()
        athleteDetailsViewController.setup(athlete: athlete)
        present(athleteDetailsViewController, animated: true)
    }
}
