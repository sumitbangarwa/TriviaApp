//
//  ViewController.swift
//  Trivia App
//
//  Created by Sumit Bangarwa on 14/07/20.
//  Copyright © 2020 Sumit Bangarwa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nameTF: UITextField!
    @IBOutlet var nextBTN: UIButton!
    
    //creating a Dictionary for keeping the Records
    var currentDict = [String:Any]()
    
    var finalDate  = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextBTN.layer.cornerRadius = 15
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        let d = formatter.string(from: Date())
        
        formatter.dateFormat = "MMMM hh:mm a"
        formatter.amSymbol = "am"
        formatter.pmSymbol = "pm"
        let now = formatter.string(from: Date())
        
        finalDate = d + "th " + now //final format of the date Required
        print("Date:",finalDate)
    }
    
    
    
    @IBAction func nextBTN(_ sender: Any) {
        
        //check Validation
        if nameTF.text!.isEmpty {
            self.showToast(controller: self, message : "Please enter your name", seconds: 1.4)
        }
        else {
            
            currentDict["name"] = nameTF.text
            currentDict["date"] = finalDate
            
            //saving the name & the date, time
            UserDefaults.standard.set( currentDict, forKey: "CurrentDict")
            
            //Navigating to the questionView
            let newVC = self.storyboard?.instantiateViewController(withIdentifier: "questionVC") as! questionVC
            self.navigationController?.pushViewController(newVC, animated: true)
        }
    }
    
}

