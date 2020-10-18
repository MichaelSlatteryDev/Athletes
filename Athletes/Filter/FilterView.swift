//
//  FilterView.swift
//  Athletes
//
//  Created by Michael Slattery on 10/17/20.
//

import UIKit

class FilterView: UIView {
    
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
        addSubview(closeButton)
        addSubview(okButton)
        addSubview(squadNameTextField)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            squadNameTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            squadNameTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            closeButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            closeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            closeButton.trailingAnchor.constraint(equalTo: self.centerXAnchor),
            
            okButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            okButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            okButton.leadingAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
    
    let closeButton: UIButton = {
        let b = UIButton()
        b.setTitle("Close", for: .normal)
        b.setTitleColor(.systemBlue, for: .normal)
        b.backgroundColor = .white
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    let okButton: UIButton = {
        let b = UIButton()
        b.setTitle("OK", for: .normal)
        b.setTitleColor(.systemBlue, for: .normal)
        b.backgroundColor = .white
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    let squadNameTextField: DetailedTextField = {
        let t = DetailedTextField()
        t.textAlignment = .center
        t.placeholder = "Choose a Squad"
        t.layer.borderWidth = Constants.borderWidth
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    
    let squadPickerView: UIPickerView = {
        let p = UIPickerView()
        return p
    }()
    
    let toolbar: UIToolbar = {
        let t = UIToolbar()
        t.sizeToFit()
        t.isUserInteractionEnabled = true
        return t
    }()
}
