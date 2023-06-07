//
//  StartGameAndPointsViewController.swift
//  AliasProject
//
//  Created by Мария Купчинская on 05.06.2023.
//

import UIKit

class StartGameAndPointsViewController: UIViewController {
    
    private let label: UILabel = {
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
    
    var choosenTeamsIndexAndScore: [Int: Int]!
    
    var words: [String]!
    
    let vStack = UIStackView()
    
    let team = Team.getTeam()
    
    var roundCounter = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.4, green: 0.5, blue: 0.3, alpha: 1)
        
        let teamIndex = (choosenTeamsIndexAndScore.first?.key)!
        
        if let logo = UIImage(named: "\(team[teamIndex].colorImageName)") {
            teamLogo.image = logo
        }
        
        vStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(vStack)
        
        vStack.addArrangedSubview(teamLogo)
        vStack.addArrangedSubview(label)
        vStack.addArrangedSubview(numberOfPoints)
        vStack.addArrangedSubview(doneButton)
        
        vStack.axis = .vertical
        vStack.spacing = 30
        vStack.alignment = .center
        
        label.text = """
Раунд № \(roundCounter).
\(team[teamIndex].name), у вас будет \(seconds) секунд, чтобы угадать максимальное количество слов, готовы?
"""
        
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
        timerVC.words = words
        roundCounter += 1
        
    }
}
