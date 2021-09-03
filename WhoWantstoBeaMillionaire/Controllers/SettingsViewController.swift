//
//  SettingsViewController.swift
//  WhoWantstoBeaMillionaire
//
//  Created by Кирилл Копытин on 01.09.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var difficultyControl: UISegmentedControl!
    
    private var selectedDifficulty: Difficulty {
        switch self.difficultyControl.selectedSegmentIndex {
        case 0:
            return .random
        case 1:
            return .sequential
        default:
            return .random
        }
    }
    
    @IBAction func changeDifficult(_ sender: Any) {
        Game.shared.difficulty = selectedDifficulty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        difficultyControl.selectedSegmentIndex = Game.shared.difficulty.rawValue
    }
}
