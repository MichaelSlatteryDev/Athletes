//
//  AthleteCell .swift
//  Athletes
//
//  Created by Michael Slattery on 10/17/20.
//

import UIKit
import SDWebImage

class AthleteCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        addSubview(usernameLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            
            usernameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            usernameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            usernameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(username: String, imageUrl: String) {
        usernameLabel.text = username
        DispatchQueue.main.async { [weak self] in
            self?.imageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
            self?.imageView.sd_setImage(with: URL(string: imageUrl), placeholderImage: UIImage(named: "placeholder"))
        }
    }
    
    var usernameLabel: UILabel = {
        let t = UILabel()
        t.textColor = .white
        t.backgroundColor = .systemBlue
        t.textAlignment = .center
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    
    var imageView: UIImageView = {
        let i = UIImageView()
        i.translatesAutoresizingMaskIntoConstraints = false
        return i
    }()
}
