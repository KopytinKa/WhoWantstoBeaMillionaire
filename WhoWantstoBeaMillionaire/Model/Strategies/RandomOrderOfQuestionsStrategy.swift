//
//  RandomOrderOfQuestionsStrategy.swift
//  WhoWantstoBeaMillionaire
//
//  Created by Кирилл Копытин on 01.09.2021.
//

import Foundation

final class RandomOrderOfQuestionsStrategy: OrderOfQuestionsStrategy {
    func getQuestions() -> [Question] {
        return Game.shared.questions.shuffled()
    }
}
