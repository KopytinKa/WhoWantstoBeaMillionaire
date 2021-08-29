//
//  MainMenuViewController.swift
//  WhoWantstoBeaMillionaire
//
//  Created by Кирилл Копытин on 27.08.2021.
//

import UIKit

class MainMenuViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "StartGameIdentifier":
            guard let destination = segue.destination as? GameViewController else { return }
            let gameSession = GameSession()
            Game.shared.gameSession = gameSession
            destination.delegate = gameSession
        default:
            break
        }
    }
}

