//
//  Offer.swift
//  Tender App
//
//  Created by Roman Rakhlin on 4/17/22.
//

import Foundation

struct Offer: Codable {
    let result: [Bid]
}

struct Bid: Codable {
    let price: Int
    let timestamp: Double
}
