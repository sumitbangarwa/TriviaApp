//
//  SummaryVC.swift
//  Trivia App
//
//  Created by Sumit Bangarwa on 14/07/20.
//  Copyright © 2020 Sumit Bangarwa. All rights reserved.
//

import UIKit

class SummaryVC: UIViewController {
    
    @IBOutlet var userName: UILabel!
    
    @IBOutlet var summaryTable: UITableView!
    @IBOutlet var histBtn: UIButton!
    @IBOutlet var finishBtn: UIButton!
    
    //Fecthing the Details
    var currentDict = UserDefaults.standard.dictionary(forKey: "CurrentDict")
    
    var arrayQues = [String]()
    var arrayAns = [String]()
    
    //created a globalVariable to store the History Data
    var histData = HistoryModel.historyDict
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("current", currentDict)
        
        print("HIstory", histData)
        
        histBtn.layer.cornerRadius = 15
        finishBtn.layer.cornerRadius = 15
        
        //Assigning the Delegate & DataSource
        summaryTable.delegate = self
        summaryTable.dataSource = self
        
        userName.text = (currentDict!["name"] as! String)
        
        let QU = currentDict!["Q&A"] as! Array<Any>
        
        for i in 0..<QU.count {
            let ques = (QU[i] as AnyObject)["Question"] as! String
            let ans = (QU[i] as AnyObject)["Answer"] as! String
            
            arrayQues.append(ques)
            arrayAns.append(ans)
            
          
        }
       
        
    }
    
    
    
    @IBAction func finishAction(_ sender: Any) {
        //Adding Data to the Aray each time
        histData.append(currentDict!)
        HistoryModel.historyDict = histData

        let firstPage = self.storyboard?.instantiateViewController(identifier: "firstPage") as! ViewController
        self.navigationController?.pushViewController(firstPage, animated: true)
    }
    
    //User wish to See the History
    @IBAction func historyAction(_ sender: Any) {
        histData.append(currentDict!)
        HistoryModel.historyDict = histData
         let firstPage = self.storyboard?.instantiateViewController(identifier: "HistoryVC") as! HistoryVC
               self.navigationController?.pushViewController(firstPage, animated: true)
    }
    
}


//Delegates for the TableView
extension SummaryVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayQues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = summaryTable.dequeueReusableCell(withIdentifier: "summaryTableCell") as! summaryTableCell
        
        cell.question.text = arrayQues[indexPath.row]
        cell.answer.text = "Answer: " + arrayAns[indexPath.row]
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}
