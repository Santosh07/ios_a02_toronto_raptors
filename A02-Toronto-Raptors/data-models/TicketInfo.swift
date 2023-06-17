//
//  TicketType.swift
//  A02-Toronto-Raptors
//
//  Created by Santosh - Humber on 2023-06-12.
//

import Foundation

struct TicketInfo: CustomStringConvertible {
    let ticketType: TicketType
    var availableQuantity: Int
    let price: Float
    
    var description: String {
        return "\(ticketType.rawValue) \(availableQuantity) \(price)"
    }
    
    mutating func resetQuantity(by quantity: Int) {
        availableQuantity += quantity
    }
    
    mutating func sellTicket(quantity: Int) {
        availableQuantity -= quantity
    }
}
