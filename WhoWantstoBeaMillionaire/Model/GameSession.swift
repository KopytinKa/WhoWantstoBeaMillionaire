//
//  GameSession.swift
//  WhoWantstoBeaMillionaire
//
//  Created by Кирилл Копытин on 29.08.2021.
//

import Foundation

class GameSession {
    var availabilityHintCallFriend: Bool = true
    var availabilityHintAuditoryHelp: Bool = true
    var availabilityHint50to50: Bool = true
    var countQuestions: Int = Game.shared.questions.count
    var countCorrectAnswers: Int = 0
    var cashPrize: Int = 0
}

extension GameSession: GameViewControllerDelegate {
    func gameViewController(_ viewController: GameViewController, chooseRightAnswerIn question: Question) {
        self.countCorrectAnswers += 1
        self.cashPrize += question.cashPrize
    }
}
