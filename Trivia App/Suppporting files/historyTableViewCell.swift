//
//  historyTableViewCell.swift
//  Trivia App
//
//  Created by Sumit Bangarwa on 14/07/20.
//  Copyright © 2020 Sumit Bangarwa. All rights reserved.
//

import UIKit

class historyTableViewCell: UITableViewCell {


    @IBOutlet var gameNo: UILabel!
    @IBOutlet var dateTime: UILabel!
    @IBOutlet var name: UILabel!
    @IBOutlet var question: UILabel!
    @IBOutlet var answer: UILabel!
    @IBOutlet var question2: UILabel!
    @IBOutlet var answer2: UILabel!
    
    
 
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


