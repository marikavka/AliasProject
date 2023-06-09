//
//  RoundResultsViewController.swift
//  AliasProject
//
//  Created by Белинский Владислав on 07.06.2023.
//

import UIKit

class RoundResultsViewController: UIViewController {
    
    private let roundTopicLabel: UILabel = {
        let label = UILabel().prepare()
        label.font = .systemFont(ofSize: 30)
        label.textColor = UIColor(red: 0.17, green: 0.08, blue: 0, alpha: 1)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let scoreLabel: UILabel = {
        let label = UILabel().prepare()
        label.font = .systemFont(ofSize: 30)
        label.textColor = UIColor(red: 0.17, green: 0.08, blue: 0, alpha: 1)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let teamLogo = UIImageView()
    
    private let numberOfPoints: UILabel = {
        let numberOfPoints = UILabel().prepare()
        numberOfPoints.font = .systemFont(ofSize: 30)
        numberOfPoints.textColor = UIColor(red: 0.17, green: 0.08, blue: 0, alpha: 1)
        numberOfPoints.textAlignment = .center
        numberOfPoints.numberOfLines = 0
        return numberOfPoints
    }()
    
    private lazy var doneButton: UIButton = {
        let button = UIButton().prepare()
        
        button.setTitleColor(UIColor(red: 0.4, green: 0.5, blue: 0.3, alpha: 1), for: .normal)
        button.backgroundColor = UIColor(red: 0.17, green: 0.08, blue: 0, alpha: 1)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
        button.layer.cornerRadius = 15
        return button
    }()
    
    var score: Int!
    
    let vStack = UIStackView()
    
    var roundCounter: Int!
    
    var words: [String]!
    
    var choosenTeams: [Team]!
    
    var teamIndex: Int!
    var yesButtonTapCounter: Int!
    var shownWordsCounter: Int!
    
    var maxScore = 0
    var winner = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "backgroundColor")
        
        if let logo = UIImage(named: "\(choosenTeams[teamIndex].colorImageName)") {
            teamLogo.image = logo
        }
        
        vStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(vStack)
        
        vStack.addArrangedSubview(roundTopicLabel)
        vStack.addArrangedSubview(teamLogo)
        vStack.addArrangedSubview(scoreLabel)
        vStack.addArrangedSubview(numberOfPoints)
        vStack.addArrangedSubview(doneButton)
        
        vStack.axis = .vertical
        vStack.spacing = 30
        vStack.alignment = .center
        
        getTheWinner()
        
        getLabelsText()
        
        
        
        
        NSLayoutConstraint.activate([
            
            doneButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            
            vStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            vStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
        ])
    }
    @objc func doneButtonTapped() {
        
        if teamIndex == 0 {
            roundCounter += 1
        }
        if maxScore < winScore {
            let timerVC = TimerViewController()
            let navVC = UINavigationController(rootViewController: timerVC)
            navVC.navigationBar.tintColor = .black
            navVC.modalTransitionStyle = .flipHorizontal
            navVC.modalPresentationStyle = .fullScreen
            present(navVC, animated: true)
            timerVC.words = words
            timerVC.choosenTeams = choosenTeams
            timerVC.teamIndex = teamIndex
            timerVC.roundCounter = roundCounter
        } else {
            let startVC = ViewController()
            let navVC = UINavigationController(rootViewController: startVC)
            navVC.navigationBar.tintColor = .black
            navVC.modalTransitionStyle = .flipHorizontal
            navVC.modalPresentationStyle = .fullScreen
            present(navVC, animated: true)
        }
        
    }
    
    
    
    private func getTeamIndex() -> Int {
        if teamIndex < choosenTeams.count - 1 {
            teamIndex += 1
        } else {
            teamIndex = 0
        }
        return teamIndex
    }
    
    private func getTheWinner() {
        if teamIndex == choosenTeams.count - 1 {
            for team in choosenTeams {
                if team.points > maxScore {
                    maxScore = team.points
                    winner = team.name
                    print("После \(roundCounter!) раунда максимальный результат - \(maxScore) очков у команды \(winner)")
                    
                    if maxScore >= winScore {
                        print("Победили \(winner)")
                    }
                }
            }
        }
    }
    
    private func getLabelsText() {
        if maxScore < winScore {
            roundTopicLabel.text = """
        В раунде № \(roundCounter!) \(choosenTeams[teamIndex].name) угадали \(yesButtonTapCounter!) слов из \(shownWordsCounter!)
        """
            teamIndex = getTeamIndex()
            scoreLabel.text = getScoreLabelText() + "Cледующий ход команды \(choosenTeams[teamIndex].name), готовы?"
            doneButton.setTitle("СТАРТ", for: .normal)
        } else {
            roundTopicLabel.text = "Победила команда \(winner) набрав \(maxScore) очков!"
            teamIndex = getTeamIndex()
            scoreLabel.text = "Итоговый счет \n" + getScoreLabelText()
            doneButton.setTitle("НОВАЯ ИГРА", for: .normal)
        }
    }
    
    private func getScoreLabelText() -> String {
        var labelText = ""
        for team in choosenTeams {
            labelText += "\(team.name) : \(team.points)\n"
        }
        return labelText
    }
}
