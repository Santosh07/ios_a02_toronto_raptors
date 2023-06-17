//
//  TicketOrder.swift
//  A02-Toronto-Raptors
//
//  Created by Santosh - Humber on 2023-06-12.
//
import Foundation

struct TicketOrder {
    let ticketType: TicketType
    let purchasedQuantitiy: Int
    let totalPrice: Float
    let purchasedDate: Date
    
    var formattedDate: String? {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE MMMM d, yyyy hh:mm:ss a"
            return dateFormatter.string(from: purchasedDate)
        }
    }
}
