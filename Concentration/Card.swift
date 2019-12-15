//
//  Card.swift
//  Concentration
//
//  Created by Han Feng on 11/25/19.
//  Copyright © 2019 Han Feng. All rights reserved.
//

import Foundation

struct Card: Hashable {
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    private static var indentifierFactory = 0
    
    private static func getUniqueId() -> Int {
        indentifierFactory += 1
        return indentifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueId()
    }
    
    
}
