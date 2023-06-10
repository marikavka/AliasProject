//
//  ThirdViewController.swift
//  AliasProject
//
//  Created by Белинский Владислав on 04.06.2023.
//

import UIKit

final class TimerViewController: UIViewController {
    
    private let timerLabel: UILabel = {
        let label = UILabel().prepare()
        label.text = "00:\(Game.shared.time)"
        label.font = .monospacedDigitSystemFont(ofSize: 80, weight: .bold)
        label.textColor = UIColor(named: "buttonColor")
        label.textAlignment = .center
        return label
    }()
    
    private let wordLabel: UILabel = {
        let label = UILabel().prepare()
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textColor = UIColor(named: "buttonColor")
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var yesButton: UIButton = {
        let button = UIButton().prepare()
        button.setImage(UIImage(named:"yesColor"), for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var noButton: UIButton = {
        let button = UIButton().prepare()
        button.setImage(UIImage(named:"noColor"), for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    let teamLogo = UIImageView()
    
    let buttonStack = UIStackView()
    
    let vStack = UIStackView()
    
    var timer: Timer?
    
    var seconds = Game.shared.time
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "backgroundColor")
        
        if let currentTeam = Game.shared.currentTeam {
            let logo = UIImage(named: "\(currentTeam.colorImageName)")
            teamLogo.image = logo
        }
        
        startTimer()
        
        wordLabel.text = Game.shared.getNextWord()
        
        vStack.translatesAutoresizingMaskIntoConstraints = false
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(vStack)
            view.addSubview(wordLabel)
            
        buttonStack.addArrangedSubview(yesButton)
        buttonStack.addArrangedSubview(noButton)
        buttonStack.axis = .horizontal
        buttonStack.spacing = UIScreen.main.bounds.width * 0.1
        
        vStack.addArrangedSubview(teamLogo)
        vStack.addArrangedSubview(timerLabel)
        vStack.addArrangedSubview(buttonStack)
        vStack.axis = .vertical
        vStack.alignment = .center
        vStack.spacing = UIScreen.main.bounds.width * 0.1
        
        NSLayoutConstraint.activate([
            
            wordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            wordLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            wordLabel.bottomAnchor.constraint(equalTo: vStack.topAnchor, constant: -UIScreen.main.bounds.width * 0.1),
            
            yesButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.33),
            yesButton.widthAnchor.constraint(equalTo: yesButton.heightAnchor, multiplier: 1),

            noButton.widthAnchor.constraint(equalTo: yesButton.widthAnchor, multiplier: 1),
            noButton.widthAnchor.constraint(equalTo: noButton.heightAnchor, multiplier: 1),

            vStack.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: UIScreen.main.bounds.width * 0.1),
            vStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            teamLogo.widthAnchor.constraint(equalToConstant: 70),
            teamLogo.heightAnchor.constraint(equalToConstant: 70)
        ])
        
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(updateTimer),
            userInfo: nil,
            repeats: true)
    }
    
    @objc func updateTimer() {
        seconds -= 1
        timerLabel.text = timeString(from: seconds)
        
        if seconds == 0 {
            timer?.invalidate()
            goToTheNextScreen()
        }
    }
    
    private func timeString(from seconds: Int) -> String {
        let minutes = (seconds / 60) % 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        if sender == yesButton {
            Game.shared.setAnswer(isCorrect: true)
        } else {
            Game.shared.setAnswer(isCorrect: false)
        }
        
        if let word = Game.shared.getNextWord() {
            wordLabel.text = word
        } else {
            goToTheNextScreen()
        }
    }
    
    private func goToTheNextScreen() {
        Game.shared.finishTeamStep()
        let vc = RoundResultsViewController()
        let navVC = UINavigationController(rootViewController: vc)
        navVC.navigationBar.tintColor = .black
        navVC.modalTransitionStyle = .flipHorizontal
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
}
    
    
