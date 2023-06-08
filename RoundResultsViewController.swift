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
        button.setTitle("СТАРТ", for: .normal)
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
    
    var choosenTeams: [Team]!
    
    var teamIndex: Int!

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
        
        roundTopicLabel.text = """
        Раунд № \(roundCounter!)
        Результаты после игры команды \(choosenTeams[teamIndex].name)
        
        """
        
        scoreLabel.text = getLabelText() + "следующий ход команды \(choosenTeams[getTeamIndex()].name), готовы?"
        
        NSLayoutConstraint.activate([
            
            doneButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            
            vStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            vStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            ])
    }
    @objc func doneButtonTapped() {
        let timerVC = TimerViewController()
        let navVC = UINavigationController(rootViewController: timerVC)
        navVC.navigationBar.tintColor = .black
        navVC.modalTransitionStyle = .flipHorizontal
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
        //timerVC.words = words
        //timerVC.choosenTeams = choosenTeams
        timerVC.teamIndex = getTeamIndex()
        if teamIndex == 0 {
            roundCounter += 1
        }
        timerVC.roundCounter = roundCounter
    }

    private func getLabelText() -> String {
        var labelText = ""
        for team in choosenTeams {
            labelText += "\(team.name) : \(team.points)\n"
        }
        return labelText
    }
    
    private func getTeamIndex() -> Int {
        if teamIndex < choosenTeams.count {
            teamIndex += 1
        } else {
            teamIndex = 0
        }
        return teamIndex
    }
    
}
