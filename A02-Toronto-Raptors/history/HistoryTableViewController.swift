//
//  HistoryTableViewController.swift
//  A02-Toronto-Raptors
//
//  Created by Santosh - Humber on 2023-06-13.
//

import UIKit

class HistoryTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        isModalInPresentation = true
    }
    
    let orderHistory = (UIApplication.shared.delegate as! AppDelegate).orderHistory
    var selectedIndex: Int? = nil

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderHistory.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ticketOrder", for: indexPath)
        
        cell.textLabel?.text = orderHistory[indexPath.row].ticketType.rawValue
        cell.detailTextLabel?.text = "\(orderHistory[indexPath.row].purchasedQuantitiy)"

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toDetailVC":
            if let detailVC = segue.destination as? DetailViewController {
                if let index = tableView.indexPathForSelectedRow?.row {
                    detailVC.ticketOrder = orderHistory[index]
                }
            }
        default:
            print("No default Segue")
        }
    }
}
