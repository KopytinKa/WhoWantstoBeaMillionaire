//
//  OrderOfQuestionsStrategy.swift
//  WhoWantstoBeaMillionaire
//
//  Created by Кирилл Копытин on 01.09.2021.
//

import Foundation

protocol OrderOfQuestionsStrategy {
    func getQuestions() -> [Question]
}
