//
//  FilterViewController.swift
//  Athletes
//
//  Created by Michael Slattery on 10/17/20.
//

import UIKit

protocol FilterDelegate {
    func filter(squadId: Int?)
}

class FilterViewController: UIViewController {
    
    var delegate: FilterDelegate?
    var squads: [Squad]?
    var chosenSquad: Squad? = nil
    
    var filterView: FilterView = {
        let f = FilterView(frame: UIScreen.main.bounds)
        return f
    }()
    
    override func viewDidLoad() {
        view = filterView
        
        filterView.closeButton.addTarget(self, action: #selector(close), for: .touchUpInside)
        filterView.okButton.addTarget(self, action: #selector(setFilter), for: .touchUpInside)
        
        filterView.squadPickerView.delegate = self
        filterView.squadPickerView.dataSource = self
        
        filterView.squadNameTextField.inputView = filterView.squadPickerView
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(closePickerView))
        filterView.toolbar.setItems([doneButton], animated: false)
        filterView.squadNameTextField.inputAccessoryView = filterView.toolbar
        
        Api.shared.getSquads() { [weak self] response in
            self?.squads = response?.squads
            DispatchQueue.main.async {
                self?.filterView.squadPickerView.reloadAllComponents()
            }
        }
    }
    
    @objc func close() {
        dismiss(animated: true)
    }
    
    @objc func setFilter() {
        dismiss(animated: true) { [weak self] in
            self?.delegate?.filter(squadId: self?.chosenSquad?.id)
        }
    }
    
    @objc func closePickerView() {
        filterView.endEditing(true)
    }
}

extension FilterViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guard let squads = squads else { return 0 }
        
        return squads.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard let squads = squads else { return "" }
        
        return squads[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard let squads = squads else { return }
        
        let squad = squads[row]
        filterView.squadNameTextField.text = squad.name
        chosenSquad = squad
    }
}
