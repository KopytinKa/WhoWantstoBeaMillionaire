//
//  RandowOrderOfQuestionsStrategy.swift
//  WhoWantstoBeaMillionaire
//
//  Created by Кирилл Копытин on 01.09.2021.
//

import Foundation

final class RandowOrderOfQuestionsStrategy: OrderOfQuestionsStrategy {
    func getQuestions() -> [Question] {
        return Game.shared.questions
    }
}
