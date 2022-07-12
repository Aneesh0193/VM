//
//  Rooms.swift
//  VM
//
//  Created by Aneesh on 12/05/22.
//

import Foundation

typealias Rooms = [RoomsList]

// MARK: - RoomsList
struct RoomsList: Codable {
    let createdAt: String?
    let isOccupied: Bool?
    let maxOccupancy: Int?
    let id: String?
}

