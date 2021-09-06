//
//  GameViewController.swift
//  WhoWantstoBeaMillionaire
//
//  Created by Кирилл Копытин on 29.08.2021.
//

import UIKit

protocol GameViewControllerDelegate: AnyObject {
    func gameViewController(_ viewController: GameViewController, chooseRightAnswerIn question: Question)
}

class GameViewController: UIViewController {
    
    weak var delegate: GameViewControllerDelegate?
    
    @IBOutlet weak var questionTableView: UITableView!
    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var countQuestionsLabel: UILabel!
    
    var questions: [Question] = []
    
    private var orderOfQuestionsStrategy: OrderOfQuestionsStrategy {
        switch Game.shared.difficulty {
        case .random:
            return RandomOrderOfQuestionsStrategy()
        case .sequential:
            return SequentialOrderOfQuestionsStrategy()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setQuestion()
        
        questionTableView.delegate = self
        questionTableView.dataSource = self
        
        if let gameSession = Game.shared.gameSession {
            gameSession.countCorrectAnswers.addObserver(
                self,
                options: [.new, .initial],
                closure: { [weak self] (countCorrectAnswers, _) in
                    guard let self = self else { return }
                    //let percentOfCorrectAnswers = Double(countCorrectAnswers) / Double(gameSession.countQuestions)
                    self.countQuestionsLabel.text = "Вопрос №\(countCorrectAnswers + 1). Прогресс: \(String(format:"%.2f", gameSession.percentOfCorrectAnswers * 100))%"
            })
        }
    }
    
    func setQuestion() {
        self.questions = self.orderOfQuestionsStrategy.getQuestions()
    }
    
    @IBAction func useHintCallFriend(_ sender: Any) {
        //TODO: написать реализацию подсказки
    }
    @IBAction func useHintAuditoryHelp(_ sender: Any) {
        //TODO: написать реализацию подсказки
    }
    @IBAction func useHint50to50(_ sender: Any) {
        //TODO: написать реализацию подсказки
    }
}

extension GameViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions[section].answers.count
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 150
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UITableViewHeaderFooterView()
        headerView.tintColor = #colorLiteral(red: 0.9917969108, green: 0.8497249484, blue: 0.2601756454, alpha: 1)

        let label = createHeaderLabel(section)
        label.autoresizingMask = [.flexibleHeight]
        headerView.addSubview(label)
        
        return headerView
    }

    func createHeaderLabel(_ section: Int) -> UILabel {
        let widthPadding: CGFloat = 15.0
        let label: UILabel = UILabel(frame: CGRect(x: widthPadding, y: 0, width: self.view.frame.width - widthPadding * 2, height: 0))
        label.text = questions[section].question
        label.numberOfLines = 0;
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.textColor = #colorLiteral(red: 0.6924729347, green: 0.09291707724, blue: 0.7302101851, alpha: 1)
        return label
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return questionTableView.dequeueReusableCell(withIdentifier: "AnswerCellIdentifier", for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let question = questions[indexPath.section]
        cell.textLabel?.text = question.answers[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let question = questions[indexPath.section]
        
        if question.correctAnswer == indexPath.row {
            self.delegate?.gameViewController(self, chooseRightAnswerIn: question)
            questions.remove(at: indexPath.section)
            
            if questions.count > 0 {
                tableView.reloadData()
            } else {
                self.endGame()
            }
        } else {
            self.endGame()
        }
    }
    
    func endGame() {
        Game.shared.endGame()
        self.dismiss(animated: true, completion: nil)
    }
}
