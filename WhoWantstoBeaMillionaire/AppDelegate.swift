//
//  AppDelegate.swift
//  WhoWantstoBeaMillionaire
//
//  Created by Кирилл Копытин on 27.08.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if Game.shared.questions.count <= 0 {
            Game.shared.questions = [
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
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

