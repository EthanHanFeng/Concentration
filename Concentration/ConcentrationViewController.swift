//
//  ViewController.swift
//  Concentration
//
//  Created by Han Feng on 11/24/19.
//  Copyright © 2019 Han Feng. All rights reserved.
//

import UIKit

class ConcentrationViewController: UIViewController {
    private lazy var game: Concentration = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {
       return (cardButtons.count+1)/2
    }

    private(set) var flipCount: Int = 0 {
        didSet {
            //flipCountLabel.text = "Flips: \(flipCount)"
            updateFlipCountLabel()
        }
    }
    private func updateFlipCountLabel() {
        let attributes: [NSAttributedString.Key: Any] = [
            .strokeWidth: 5.0,
            .strokeColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        ]
        let attributedString = NSAttributedString(
            string: "Flips: \(flipCount)",
            attributes: attributes
        )
        flipCountLabel.attributedText = attributedString
    }
    
    
    @IBOutlet private var cardButtons: [UIButton]!
    

    @IBOutlet private weak var flipCountLabel: UILabel!
    
    @IBAction private func touchCard(_ sender: UIButton){
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
//            print("cardNumber = \(String(describing: cardNumber))")
//            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        } else {
            print("ErrorButton!")
        }
        
    }
    
    private func updateViewFromModel() {
        if cardButtons != nil {
            for index in cardButtons.indices {
                let button = cardButtons[index]
                let card = game.cards[index]
                
                if card.isFaceUp {
                    button.setTitle(emoji(for: card), for: UIControl.State.normal)
                    button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                } else {
                    button.setTitle("", for: UIControl.State.normal)
                    button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763240457, blue: 0, alpha: 0) : #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
                }
            }
        }
    }
    
    var theme: String? {
        didSet {
            emojiChoices = theme ?? ""
            emoji = [:]
            updateViewFromModel()

        }
    }
    private var emojiChoices = "👻🙈☠️🎃😸🐷🦀🦋"
    //var emoji = Dictionary<Int, String>()
    private var emoji = [Card: String]()
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            let stringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
            emoji[card] = String(emojiChoices.remove(at: stringIndex))
        }
       
        return emoji[card] ?? "?"
    }
    
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}

