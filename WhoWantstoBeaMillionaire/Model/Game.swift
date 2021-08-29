//
//  Game.swift
//  WhoWantstoBeaMillionaire
//
//  Created by Кирилл Копытин on 29.08.2021.
//

import Foundation

final class Game {
    static let shared = Game()
    
    var gameSession: GameSession?
    
    private(set) var records: [Record] {
        didSet {
            recordsCaretaker.save(records: self.records)
        }
    }
    
    let questions = [
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
    
    private let recordsCaretaker = RecordsCaretaker()
        
    private init() {
        self.records = self.recordsCaretaker.retrieveRecords()
    }
    
    func endGame() {
        guard let gameSession = self.gameSession else { return }
        
        let percentOfCorrectAnswers = Double(gameSession.countCorrectAnswers) / Double(gameSession.countQuestions)
        let record = Record(date: Date(), cashPrize: gameSession.cashPrize, percentOfCorrectAnswers: percentOfCorrectAnswers)
        self.addRecord(record)
        self.gameSession = nil
    }
    
    func addRecord(_ record: Record) {
        self.records.append(record)
    }
}
