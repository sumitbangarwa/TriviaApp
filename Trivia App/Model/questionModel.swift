//
//  questionModel.swift
//  Trivia App
//
//  Created by Sumit Bangarwa on 14/07/20.
//  Copyright © 2020 Sumit Bangarwa. All rights reserved.
//

import UIKit
import Foundation


struct questionModel {
    
    var questionNumber = 0
    
    let quiz = [
        Question(text: "Who is the best cricketer in the world?", optionA: "Sachin Tendulkar", ButtonA: 1, optionB: "Virat kohli", ButtonB: 2, optionC: "Adam Gilchrist", ButtonC: 3, optionD: "Jacques Kallis", ButtonD: 4),
        Question(text: "What are the colors in the Indian national flag? Select all:", optionA: "white", ButtonA: 1, optionB: "Yellow", ButtonB: 2, optionC: "Orange", ButtonC: 3, optionD: "Green", ButtonD: 4),
    ]
    
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    func getOptionA() -> String {
          return quiz[questionNumber].optionA
      }
    
    func getOptionB() -> String {
        return quiz[questionNumber].optionB
    }
    
    func getOptionC() -> String {
        return quiz[questionNumber].optionC
    }
    
    func getOptionD() -> String {
        return quiz[questionNumber].optionD
    }
    
    
    mutating func nextQuestion() {

        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
    }
    
    
    
}
