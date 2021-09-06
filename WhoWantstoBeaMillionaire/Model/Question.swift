//
//  Question.swift
//  WhoWantstoBeaMillionaire
//
//  Created by Кирилл Копытин on 29.08.2021.
//

import Foundation

struct Question: Codable {
    var question: String = ""
    var answers: [String] = []
    var correctAnswer: Int = 0
    var cashPrize: Int = 100
    
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
    
    static func getCommonQuestions() -> [Question] {
        return [
            Question(
                question: "Какое растение существует на самом деле?",
                answers: [
                    "Лох чилийский",
                    "Лох индийский",
                    "Лох греческий",
                    "Лох русский"
                ],
                correctAnswer: 1,
                cashPrize: 100
            ),
            Question(
                question: "Что за место, попав в которое, человек делает селфи на кухне, которую не может себе позволить?",
                answers: [
                    "Рим",
                    "Париж",
                    "Лондон",
                    "ИКЕА"
                ],
                correctAnswer: 3,
                cashPrize: 200
            ),
            Question(
                question: "Какой город объявлен официальной родиной русского Деда Мороза?",
                answers: [
                    "Малая Вишера",
                    "Великий Устюг",
                    "Вышний Волочек",
                    "Нижний Новгород"
                ],
                correctAnswer: 1,
                cashPrize: 300
            ),
            Question(
                question: "Что проводит боксер, наносящий удар противнику снизу?",
                answers: [
                    "Свинг",
                    "Хук",
                    "Апперкот",
                    "Джэб"
                ],
                correctAnswer: 2,
                cashPrize: 400
            ),
            Question(
                question: "К кому первому обратились за помощью дед и бабка, не справившись с репкой?",
                answers: [
                    "К Жучке",
                    "К дочке",
                    "К внучке",
                    "К залу"
                ],
                correctAnswer: 2,
                cashPrize: 500
            ),
            Question(
                question: "Кого нет среди смешариков?",
                answers: [
                    "Барана",
                    "Свиньи",
                    "Коня",
                    "Лося"
                ],
                correctAnswer: 2,
                cashPrize: 600
            ),
            Question(
                question: "Как называется ближайшая к Земле звезда?",
                answers: [
                    "Проксиома Центавра",
                    "Солнце",
                    "Полярная",
                    "Сириус"
                ],
                correctAnswer: 1,
                cashPrize: 700
            ),
            Question(
                question: "Что помогает запомнить мнемоническое правило «Это я знаю и помню прекрасно»?",
                answers: [
                    "Число Пи",
                    "Ряд активности металлов",
                    "Цвета радуги",
                    "Порядок падежей"
                ],
                correctAnswer: 0,
                cashPrize: 800
            ),
            Question(
                question: "Какую площадь имеет клетка стандартной школьной тетради?",
                answers: [
                    "0.25 кв.см",
                    "1 кв.см",
                    "0.5 кв.см",
                    "1.25 кв. см"
                ],
                correctAnswer: 0,
                cashPrize: 900
            ),
            Question(
                question: "Что происходит на соревнованиях по стрельбе, если соперники набрали одинаковое количество очков?",
                answers: [
                    "Перевербовка",
                    "Перепалка",
                    "Перебранка",
                    "Перестрелка"
                ],
                correctAnswer: 3,
                cashPrize: 1000
            ),
        ]
    }
}
