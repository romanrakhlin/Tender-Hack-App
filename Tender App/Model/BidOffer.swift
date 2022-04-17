//
//  Offer.swift
//  Tender App
//
//  Created by Roman Rakhlin on 4/16/22.
//

import Foundation

struct BidOffer: Encodable {
    let username: String
    let sessionId: Int
    
    enum CodingKeys: String, CodingKey {
        case username
        case sessionId = "session_id"
    }
}
