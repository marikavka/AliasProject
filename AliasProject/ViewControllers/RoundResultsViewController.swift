//
//  RoundResultsViewController.swift
//  AliasProject
//
//  Created by Белинский Владислав on 07.06.2023.
//

import UIKit

final class RoundResultsViewController: UIViewController {
    
    private let roundTopicLabel: UILabel = {
        let label = UILabel().prepare()
        label.font = .systemFont(ofSize: 45, weight: .bold)
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
    
    private let teamLogo = UIImageView()
    
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
    
    private let vStack = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "backgroundColor")
        
        vStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(vStack)
        
        vStack.addArrangedSubview(roundTopicLabel)
        vStack.addArrangedSubview(scoreLabel)
        vStack.addArrangedSubview(numberOfPoints)
        vStack.addArrangedSubview(teamLogo)
        
        vStack.addArrangedSubview(doneButton)
        
        vStack.axis = .vertical
        vStack.spacing = 45
        vStack.alignment = .center
        
        checkWinner()
        
        NSLayoutConstraint.activate([
            
            doneButton.widthAnchor.constraint(equalToConstant: 230),
            
            vStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            vStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
        ])
    }
    
    @objc func doneButtonTapped() {
        if Game.shared.isGameOver == true {
            let startVC = ViewController()
            let navVC = UINavigationController(rootViewController: startVC)
            navVC.navigationBar.tintColor = .black
            navVC.modalTransitionStyle = .flipHorizontal
            navVC.modalPresentationStyle = .fullScreen
            present(navVC, animated: true)
            
        } else {
            let timerVC = TimerViewController()
            let navVC = UINavigationController(rootViewController: timerVC)
            navVC.navigationBar.tintColor = .black
            navVC.modalTransitionStyle = .flipHorizontal
            navVC.modalPresentationStyle = .fullScreen
            present(navVC, animated: true)
        }
    }
    
    private func checkWinner() {
        if Game.shared.isGameOver {
            let winners = Game.shared.getWinners()
            if winners.count == 1 {
                let winner = winners[0]
                roundTopicLabel.text = "Победа!🌟"
                teamLogo.image = UIImage(named: winner.colorImageName)
            } else {
                roundTopicLabel.text = "Поздравляем, в игре ничья!"
            }
            scoreLabel.text = "Итоговый счет \n" + getScoreLabelText()
            doneButton.setTitle("новая игра", for: .normal)
        } else {
            if let curentTeam = Game.shared.currentTeam {
                scoreLabel.text = getScoreLabelText() + "Cледующий ход команды \(curentTeam.name), готовы?"
                teamLogo.image = UIImage(named: curentTeam.colorImageName)
                doneButton.setTitle("продолжить", for: .normal)
            }
        }
    }
    
    private func getScoreLabelText() -> String {
        var labelText = ""
        let sortedTeams = Game.shared.teams.sorted { $0.points > $1.points }
        for team in sortedTeams {
            labelText += "\(team.name) : \(team.points)\n"
        }
        return labelText
    }
}
