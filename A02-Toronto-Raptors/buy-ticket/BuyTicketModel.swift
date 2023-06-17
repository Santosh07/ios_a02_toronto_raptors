//
//  BuyTicketModel.swift
//  A02-Toronto-Raptors
//
//  Created by Santosh - Humber on 2023-06-13.
//

import Foundation
import UIKit

class BuyTicketModel {
    
    let tickets = (UIApplication.shared.delegate as! AppDelegate).tickets
    
    var selectedTicketIndex = 0
    var selectedQuantity = 0
    
    var currentTicketLabel: String {
        get {
            return tickets[selectedTicketIndex].ticketType.rawValue
        }
    }
    
    var calcualtedPrice: Float {
        get {
            let perTicketPrice = tickets[selectedTicketIndex].price
            return perTicketPrice * Float(selectedQuantity)
        }
    }
    
    func buyTickets() throws {
        guard selectedQuantity > 0 else {
            throw BuyTicketError.ticketQuantityIsZero
        }
        
        let ticketInfo = (UIApplication.shared.delegate as! AppDelegate).tickets[selectedTicketIndex]
        
        if ticketInfo.availableQuantity >= selectedQuantity {
            (UIApplication.shared.delegate as! AppDelegate)
                .tickets[selectedTicketIndex].sellTicket(quantity: selectedQuantity)
            let ticketOrder = TicketOrder(ticketType: ticketInfo.ticketType,
                               purchasedQuantitiy: selectedQuantity,
                               totalPrice: calcualtedPrice,
                               purchasedDate: Date() )
            (UIApplication.shared.delegate as! AppDelegate).orderHistory.append(ticketOrder)
        } else {
            throw BuyTicketError.ticketNotAvailable(availableTicket: ticketInfo.availableQuantity)
        }
    }
}

enum BuyTicketError: Error {
    case ticketQuantityIsZero
    case ticketNotAvailable(availableTicket: Int)
}
