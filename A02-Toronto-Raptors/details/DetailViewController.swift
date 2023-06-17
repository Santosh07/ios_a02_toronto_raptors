//
//  DetailViewController.swift
//  A02-Toronto-Raptors
//
//  Created by Santosh - Humber on 2023-06-13.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let ticketOrderSafe = ticketOrder {
            ticketLabel.text = ticketOrderSafe.ticketType.rawValue
            quantityLabel.text = "\(ticketOrderSafe.purchasedQuantitiy)"
            totalPriceLabel.text = "\(ticketOrderSafe.totalPrice)"
            purchaseDateLabel.text = ticketOrderSafe.formattedDate ?? "N/A"
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //for partical curl bug, remove gestures
        isModalInPresentation = true
        if let gestures = self.view.gestureRecognizers as? [UIGestureRecognizer] {
            for gesture in gestures {
              self.view.removeGestureRecognizer(gesture)
            }
        }
    }
    
    var ticketOrder: TicketOrder?
    
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var purchaseDateLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var ticketLabel: UILabel!
    
    @IBAction func backClicked(_ sender: UIButton) {
        dismiss(animated: false)
    }
}
