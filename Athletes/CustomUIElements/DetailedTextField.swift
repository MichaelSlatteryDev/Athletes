//
//  DetailedTextField.swift
//  Athletes
//
//  Created by Michael Slattery on 10/17/20.
//

import UIKit

class DetailedTextField: UITextField {
    
    private let textFieldPadding = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textFieldPadding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textFieldPadding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textFieldPadding)
    }
}
