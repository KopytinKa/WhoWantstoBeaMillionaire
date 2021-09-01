//
//  Record.swift
//  WhoWantstoBeaMillionaire
//
//  Created by Кирилл Копытин on 29.08.2021.
//

import Foundation

struct Record: Codable {
    let date: Date
    let cashPrize: Int
    let percentOfCorrectAnswers: Double
}
