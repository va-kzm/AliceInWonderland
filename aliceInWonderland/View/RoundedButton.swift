//
//  RoundedButton.swift
//  aliceInWonderland
//
//  Created by Mokhamad Valid Kazimi on 27.03.2018.
//  Copyright © 2018 Mokhamad Valid Kazimi. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        
        layer.cornerRadius = 5
        clipsToBounds = true
    }
}
