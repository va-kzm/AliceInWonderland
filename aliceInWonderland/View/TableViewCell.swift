//
//  TableViewCell.swift
//  aliceInWonderland
//
//  Created by Mokhamad Valid Kazimi on 28.03.2018.
//  Copyright © 2018 Mokhamad Valid Kazimi. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    // Outlets
    @IBOutlet weak var characterLbl: UILabel!
    @IBOutlet weak var countLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // Methods
    func configureCell(withCharacters character: Character, andCountOfOccurence count: Int) {
        characterLbl.text = "'\(character)'"
        countLbl.text = "\(count)"
    }
}
