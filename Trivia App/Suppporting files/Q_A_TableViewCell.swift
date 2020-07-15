//
//  Q_A_TableViewCell.swift
//  Trivia App
//
//  Created by Sumit Bangarwa on 15/07/20.
//  Copyright © 2020 Sumit Bangarwa. All rights reserved.
//

import UIKit

class Q_A_TableViewCell: UITableViewCell {

    @IBOutlet var question: UILabel!
    @IBOutlet var answer: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
