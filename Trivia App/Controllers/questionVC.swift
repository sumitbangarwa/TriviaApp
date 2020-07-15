//
//  questionVC.swift
//  Trivia App
//
//  Created by Sumit Bangarwa on 14/07/20.
//  Copyright © 2020 Sumit Bangarwa. All rights reserved.
//

import UIKit

class questionVC: UIViewController {
    
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var optionA: UIButton!
    @IBOutlet var optionB: UIButton!
    @IBOutlet var optionC: UIButton!
    @IBOutlet var optionD: UIButton!
    
    @IBOutlet var nextBTn: UIButton!
    
    var quesMD = questionModel()
    
    var Question = String()
    var AnsSelected = String()
    
    var question: [String:Any] = [:]
    
    var answerDict = [String:Any]()
    
    var ansArray = Array<Any>()
    
    var touchcount: Int = 0
    
    var currentDict = UserDefaults.standard.dictionary(forKey: "CurrentDict")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ansArray.removeAll()
        nextBTn.layer.cornerRadius = 15
        optionA.layer.cornerRadius = 12
        optionB.layer.cornerRadius = 12
        optionC.layer.cornerRadius = 12
        optionD.layer.cornerRadius = 12
        
        updateUI()
    }


    @IBAction func answerBtnPressed(_ sender: UIButton) {
        // Highlight the current selected
        sender.isHighlighted = false
        
        updateSelection()
        
         //getting the userInput
        AnsSelected = sender.currentTitle!
        Question = questionLabel.text!
        
    }
    
    @IBAction func nextBTN(_ sender: Any) {

        touchcount += 1
        
        updateSelection()
        quesMD.nextQuestion() //fetching the question from the question model
        updateUI()
        answerDict["Question"] = Question
        answerDict["Answer"] = AnsSelected
        ansArray.append(answerDict)
        print("ARRAY", ansArray)
        

          if touchcount >= 2 {
            currentDict!["Q&A"] = ansArray  //storing all the Ques & Ans into Dictionary
            UserDefaults.standard.set(currentDict, forKey: "CurrentDict")
                let summaryV = self.storyboard?.instantiateViewController(identifier: "SummaryVC") as! SummaryVC
                       self.navigationController?.pushViewController(summaryV, animated: true)
           }
        
       
    }
    
    //Updating the Ui after Each Question
    @objc func updateUI() {
        
        questionLabel.text = quesMD.getQuestionText()
        optionA.setTitle(quesMD.getOptionA(), for: .normal)
        optionB.setTitle(quesMD.getOptionB(), for: .normal)
        optionC.setTitle(quesMD.getOptionC(), for: .normal)
        optionD.setTitle(quesMD.getOptionD(), for: .normal)
        
    }
    
    
    // updating the Selection of the BTN
    func updateSelection() {
        for subView in view.subviews {
               // Set all the other buttons as normal state
               if let button: UIButton = subView as? UIButton {
                   button.isHighlighted = true
               }
           }
        
    }
    
    
}

