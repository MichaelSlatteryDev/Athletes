//
//  AthleteDetailsView.swift
//  Athletes
//
//  Created by Michael Slattery on 10/17/20.
//

import UIKit
import SDWebImage

class AthleteDetailsView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addSubview(usernameTextView)
        addSubview(usernameLabel)
        addSubview(firstNameTextView)
        addSubview(firstNameLabel)
        addSubview(lastNameTextView)
        addSubview(lastNameLabel)
        addSubview(imageView)
    }
    
    func addConstraints() {
        
        let defaultSpacing = Constants.defaultSpacing
        
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            usernameTextView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: defaultSpacing),
            usernameTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: defaultSpacing),
            usernameTextView.heightAnchor.constraint(equalTo: usernameLabel.heightAnchor),
            
            usernameLabel.topAnchor.constraint(equalTo: usernameTextView.topAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: usernameTextView.trailingAnchor, constant: defaultSpacing),
            self.trailingAnchor.constraint(equalTo: usernameLabel.trailingAnchor, constant: defaultSpacing),
            
            firstNameTextView.topAnchor.constraint(equalTo: usernameTextView.bottomAnchor, constant: defaultSpacing),
            firstNameTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: defaultSpacing),
            firstNameTextView.heightAnchor.constraint(equalTo: firstNameLabel.heightAnchor),
            
            firstNameLabel.topAnchor.constraint(equalTo: firstNameTextView.topAnchor),
            firstNameLabel.leadingAnchor.constraint(equalTo: firstNameTextView.trailingAnchor, constant: defaultSpacing),
            self.trailingAnchor.constraint(equalTo: firstNameLabel.trailingAnchor, constant: defaultSpacing),
            
            lastNameTextView.topAnchor.constraint(equalTo: firstNameTextView.bottomAnchor, constant: defaultSpacing),
            lastNameTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: defaultSpacing),
            lastNameTextView.heightAnchor.constraint(equalTo: lastNameLabel.heightAnchor),
            
            lastNameLabel.topAnchor.constraint(equalTo: lastNameTextView.topAnchor),
            lastNameLabel.leadingAnchor.constraint(equalTo: lastNameTextView.trailingAnchor, constant: defaultSpacing),
            self.trailingAnchor.constraint(equalTo: lastNameLabel.trailingAnchor, constant: defaultSpacing),
        ])
    }
    
    func setup(athlete: Athlete) {
        usernameLabel.text = athlete.username
        firstNameLabel.text = athlete.firstName
        lastNameLabel.text = athlete.lastName
        DispatchQueue.main.async { [weak self] in
            self?.imageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
            self?.imageView.sd_setImage(with: URL(string: athlete.image.url), placeholderImage: UIImage(named: "placeholder"))
        }
    }
    
    let usernameTextView: UITextView = {
        let t = UITextView()
        t.text = "Username: "
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    
    let usernameLabel: UILabel = {
        let l = UILabel()
        l.textAlignment = .center
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    let firstNameTextView: UITextView = {
        let t = UITextView()
        t.text = "First Name: "
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    
    let firstNameLabel: UILabel = {
        let l = UILabel()
        l.textAlignment = .center
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    let lastNameTextView: UITextView = {
        let t = UITextView()
        t.text = "Last Name: "
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    
    let lastNameLabel: UILabel = {
        let l = UILabel()
        l.textAlignment = .center
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    let imageView: UIImageView = {
        let i = UIImageView()
        i.translatesAutoresizingMaskIntoConstraints = false
        return i
    }()
}
