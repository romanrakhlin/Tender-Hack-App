//
//  Session.swift
//  Tender App
//
//  Created by Roman Rakhlin on 4/16/22.
//

import Foundation

typealias Sessions = [Session]

struct Session: Codable, Hashable {
    let sessionId: Int
    let step: Double
    let startPrice: Int
    let startTime: Double
    let length: Int
    let authorUsername: String
    let active: Bool
    
    enum CodingKeys: String, CodingKey {
        case sessionId = "session_id"
        case step
        case startPrice = "start_price"
        case startTime = "start_time"
        case length
        case authorUsername = "author_username"
        case active
    }
}
