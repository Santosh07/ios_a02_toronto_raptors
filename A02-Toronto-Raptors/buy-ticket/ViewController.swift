//
//  ViewController.swift
//  A02-Toronto-Raptors
//
//  Created by Santosh - Humber on 2023-06-11.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    let buyTicketModel = BuyTicketModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buyTicketModel.selectedTicketIndex = 0
        buyTicketModel.selectedQuantity = 1
        updatePrice()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        pickerView.reloadAllComponents()
    }
    
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var ticketQuantityLabel: UILabel!
    @IBOutlet weak var ticketTypeLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBAction func updateQuantity(_ sender: UIButton) {
        ticketQuantityLabel.text = sender.titleLabel?.text
        
        if let quantityText = ticketQuantityLabel.text,
            let quantity = Int(quantityText) {
            buyTicketModel.selectedQuantity = quantity
            updatePrice()
        }
    }
    
    
    @IBAction func buyTicketClicked(_ sender: UIButton) {
        do {
            try buyTicketModel.buyTickets()
        } catch BuyTicketError.ticketQuantityIsZero {
            errorLabel.text = "Please input number greater than 0."
        } catch BuyTicketError.ticketNotAvailable(let availableTicket) {
            if availableTicket == 0 {
                errorLabel.text = "Out of Tickets"
            } else if availableTicket > 0 {
                errorLabel.text = "Only \(availableTicket) tickets left."
            }
        } catch {
            errorLabel.text = "Unknown Error. Contact admin."
        }
        
        pickerView.reloadAllComponents()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return (UIApplication.shared.delegate as! AppDelegate).tickets.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let tickets = (UIApplication.shared.delegate as! AppDelegate).tickets
        return tickets[row].description
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        buyTicketModel.selectedTicketIndex = row
        ticketTypeLabel.text = buyTicketModel.currentTicketLabel
        updatePrice()
    }
    
    func updatePrice() {
        totalPriceLabel.text = "\(buyTicketModel.calcualtedPrice)"
        errorLabel.text = ""
    }
}

