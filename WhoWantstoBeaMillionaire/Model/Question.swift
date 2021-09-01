//
//  Question.swift
//  WhoWantstoBeaMillionaire
//
//  Created by Кирилл Копытин on 29.08.2021.
//

import Foundation

struct Question {
    let question: String
    let answers: [String]
    var correctAnswer: Int
    var cashPrize: Int
    
    var resultWhenUseHintCallFriend: String {
        get {
            return "Привет! Я думаю, что правильный вариант: \(answers[correctAnswer])"
        }
    }
    
    var resultWhenUseHintAuditoryHelp: [Int] {
        get {
            var resultsArray: [Int] = []
            var totalResult = 100
            
            for index in 0..<answers.count {
                var result = 0
                
                if index == correctAnswer {
                    result = Int.random(in: 26...50)
                } else {
                    result = Int.random(in: 1..<25)
                }
                
                totalResult -= result
                
                resultsArray.append(result)
            }
            
            if totalResult != 0 {
                resultsArray[correctAnswer] += totalResult
            }
            
            return resultsArray
        }
    }
}
