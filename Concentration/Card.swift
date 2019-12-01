//
//  Card.swift
//  Concentration
//
//  Created by Han Feng on 11/25/19.
//  Copyright © 2019 Han Feng. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    private static var indentifierFactory = 0
    
    private static func getUniqueId() -> Int {
        indentifierFactory += 1
        return indentifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueId()
    }
    
    
}
