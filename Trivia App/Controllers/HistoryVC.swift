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
    
    var histData = HistoryModel.historyDict
    
    var arrayOfNames = [String]()
    var arrayOfDates = [String]()
    var gameCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Donebtn.layer.cornerRadius = 15
        
        
        for i in 0..<histData.count {
             let name = histData[i]["Q&A"]
            print("hisNAME",name)
            
//            for i in 0..<name.count {
//                
//            }
       
        }
        
        
        
    }
    
    
    @IBAction func doneAction(_ sender: Any) {
        let firstPage = self.storyboard?.instantiateViewController(identifier: "firstPage") as! ViewController
        self.navigationController?.pushViewController(firstPage, animated: true)
    }
    
}


extension HistoryVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return histData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return histData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Q_A_TableViewCell") as! Q_A_TableViewCell
        
//        cell.question.text  = histData[indexPath.item]["Question"]![indexPath.row] as! String
        //        cell.answer.text    = histData[indexPath.row]["Answer"] as! String
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        gameCount += 1
        
        print("INDSIDE", arrayOfDates, arrayOfNames)
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyTableViewCell") as! historyTableViewCell
        cell.name.text = histData[section]["name"] as! String
        cell.gameNo.text = "GAME " + "\(gameCount)"
        cell.dateTime.text = histData[section]["date"] as! String
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 120
    }
    
    
    
}
