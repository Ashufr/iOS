//
//  Room.swift
//  HomeFurniture
//
//  Created by student on 15/04/24.
//

import Foundation

class Room {
    let name: String
    let furniture: [Furniture]
    
    init(name: String, furniture: [Furniture]) {
        self.name = name
        self.furniture = furniture
    }
}
