//
//  HistoryVC.swift
//  Trivia App
//
//  Created by Sumit Bangarwa on 14/07/20.
//  Copyright © 2020 Sumit Bangarwa. All rights reserved.
//

import UIKit

class HistoryVC: UIViewController {
    
    @IBOutlet var historyTable: UITableView!
    @IBOutlet var Donebtn: UIButton!
    @IBOutlet var question: UILabel!
    @IBOutlet var answer: UILabel!
    
    var histData = HistoryModel.historyDict

    var gameCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Donebtn.layer.cornerRadius = 15
        
        
        
    }
    
    
    @IBAction func doneAction(_ sender: Any) {
        let firstPage = self.storyboard?.instantiateViewController(identifier: "firstPage") as! ViewController
        self.navigationController?.pushViewController(firstPage, animated: true)
    }
    
}


extension HistoryVC: UITableViewDelegate, UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return histData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        gameCount += 1
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyTableViewCell") as! historyTableViewCell
        cell.name.text = histData[indexPath.row]["name"] as? String
        cell.gameNo.text = "GAME " + "\(gameCount)"
        cell.dateTime.text = histData[indexPath.row]["date"] as? String
        
        
        if let QQ = (histData[indexPath.row]["Q&A"]) as? Array<Any> {
            print("QQQQ",QQ)
            for i in 0..<QQ.count {
                cell.question.text = (QQ[0] as AnyObject)["Question"] as! String
                cell.answer.text = (QQ[0] as AnyObject)["Answer"] as! String
                cell.question2.text = (QQ[1] as AnyObject)["Question"] as! String
                cell.answer2.text = (QQ[1] as AnyObject)["Answer"] as! String
            }
        }
        
        return cell
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 120
    }
    
    
    
}
