//
//  historyTableViewCell.swift
//  Trivia App
//
//  Created by Sumit Bangarwa on 14/07/20.
//  Copyright © 2020 Sumit Bangarwa. All rights reserved.
//

import UIKit

class historyTableViewCell: UITableViewCell {

    @IBOutlet var Q_A_table: UITableView!
    @IBOutlet var gameNo: UILabel!
    @IBOutlet var dateTime: UILabel!
    @IBOutlet var name: UILabel!
 
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


extension historyTableViewCell {
    
    
    func setTableViewDelegateDataSource<D:UITableViewDelegate & UITableViewDataSource>(_ dataSourceDelegate: D, forRow row: Int) {
        Q_A_table.delegate = dataSourceDelegate
        Q_A_table.dataSource = dataSourceDelegate
    }
    
    
}

