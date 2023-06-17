//
//  ResetModel.swift
//  A02-Toronto-Raptors
//
//  Created by Santosh - Humber on 2023-06-13.
//

import Foundation
import UIKit

class ResetModel {
    
    var currentTicket: Int = 0
    
    var currentTitle: String {
        get {
            return (UIApplication.shared.delegate as! AppDelegate)
                .tickets[currentTicket].ticketType.rawValue
        }
    }
    
    func updateTicket(amountString: String?) throws {
        if let amountStringSafe = amountString {
            let amount = Int(amountStringSafe)
            
            if amount != nil && amount! > 0 {
                (UIApplication.shared.delegate as! AppDelegate)
                    .tickets[currentTicket].availableQuantity += amount!
            } else {
                throw ResetModelError.invalidAmount
            }
        }
    }
}

enum ResetModelError: Error {
    case invalidAmount
}
