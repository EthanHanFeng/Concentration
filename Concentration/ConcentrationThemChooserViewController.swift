//
//  ConcentrationThemChooserViewController.swift
//  Concentration
//
//  Created by Han Feng on 12/14/19.
//  Copyright © 2019 Han Feng. All rights reserved.
//

import UIKit

class ConcentrationThemChooserViewController: UIViewController {

    let themes = [
        "Sports": "🏈⚽️🏀⚾️🏸🎾🏓🏊‍♂️🚴‍♀️🏐🏄‍♂️🏌️‍♂️", // 🎳🏹
        "Animals": "🐭🐮🐯🐰🐲🐍🐴🐑🐵🐔🐶🐷", //
        "Faces": "😃😂🤗😱☹️🤮💀🤐😎😘😍😭"
    ]

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme" {
            if let themeName = (sender as? UIButton)?.currentTitle,  let theme = themes[themeName] {
                if let cvc = segue.destination as? ConcentrationViewController {
                    cvc.theme = theme
                    
                }
            }
        }
        
    }

}
