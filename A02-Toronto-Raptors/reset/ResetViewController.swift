//
//  ResetViewController.swift
//  A02-Toronto-Raptors
//
//  Created by Santosh - Humber on 2023-06-13.
//

import UIKit

class ResetViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var amoutTextField: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var errorLabel: UILabel!
    
    let resetModel = ResetModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = resetModel.currentTitle
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return (UIApplication.shared.delegate as! AppDelegate).tickets.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let tickets = (UIApplication.shared.delegate as! AppDelegate).tickets
        resetModel.currentTicket = row
        return tickets[row].description
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        navigationItem.title = resetModel.currentTitle
    }
    
    @IBAction func okClicked(_ sender: Any) {
        do {
            try resetModel.updateTicket(amountString: amoutTextField.text)
            pickerView.reloadAllComponents()
            amoutTextField.text = ""
            errorLabel.text = ""
        } catch ResetModelError.invalidAmount {
            errorLabel.text = "Value is invalid"
        } catch {
            errorLabel.text = "Unknown Error"
        }
    }
    
    @IBAction func cancelClicked(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
