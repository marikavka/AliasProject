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
        label.text = "01:00"
        label.font = .monospacedDigitSystemFont(ofSize: 80, weight: .bold)
        label.textColor = UIColor(named: "buttonColor")
        label.textAlignment = .center
        return label
    }()
    
    private let wordLabel: UILabel = {
        let label = UILabel().prepare()
        label.font = .systemFont(ofSize: 40)
        label.textColor = UIColor(named: "buttonColor")
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var yesButton: UIButton = {
        let button = UIButton().prepare()
        button.setImage(UIImage(named:"yesColor"), for: .normal)
        button.addTarget(self, action: #selector(buttonTappedYes), for: .touchUpInside)
        return button
    }()
    
    private lazy var noButton: UIButton = {
        let button = UIButton().prepare()
        button.setImage(UIImage(named:"noColor"), for: .normal)
        button.addTarget(self, action: #selector(buttonTappedNo), for: .touchUpInside)
        return button
    }()
    
    let buttonStack = UIStackView()
    let vStack = UIStackView()
    
    var timer: Timer?
    var seconds = 60
    
    var words: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "backgroundColor")
        
        startTimer()
        
        wordLabel.text = words[currentWordIndex]
        
        vStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(vStack)
        
        buttonStack.addArrangedSubview(yesButton)
        buttonStack.addArrangedSubview(noButton)
        buttonStack.axis = .horizontal
        buttonStack.spacing = UIScreen.main.bounds.width * 0.1
        
        vStack.addArrangedSubview(timerLabel)
        vStack.addArrangedSubview(wordLabel)
        vStack.addArrangedSubview(buttonStack)
        vStack.axis = .vertical
        vStack.spacing = UIScreen.main.bounds.width * 0.1
        vStack.distribution = .fill
        
        NSLayoutConstraint.activate([
            
            yesButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.33),
            yesButton.widthAnchor.constraint(equalTo: yesButton.heightAnchor, multiplier: 1),
            
            noButton.widthAnchor.constraint(equalTo: yesButton.widthAnchor, multiplier: 1),
            noButton.widthAnchor.constraint(equalTo: noButton.heightAnchor, multiplier: 1),
            
            vStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
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
    
    
    var currentWordIndex = 0
    
    @objc func buttonTappedYes() {
        currentWordIndex += 1
        if currentWordIndex == (words.count) {
            wordLabel.text = "КОНЕЦ РАУНДА, НАЖМИТЕ ЛЮБУЮ КНОПКУ"
            wordLabel.font = .systemFont(ofSize: 20)
        } else if currentWordIndex < (words.count) {
            wordLabel.text = words[currentWordIndex]
        } else {
            goToTheNextScreen()
        }
    }
    
    @objc func buttonTappedNo() {
        currentWordIndex += 1
        if currentWordIndex == (words.count) {
            wordLabel.text = "КОНЕЦ РАУНДА, НАЖМИТЕ ЛЮБУЮ КНОПКУ"
            wordLabel.font = .systemFont(ofSize: 20)
        } else if currentWordIndex < (words.count) {
            wordLabel.text = words[currentWordIndex]
        } else {
            goToTheNextScreen()
        }
        
    }
    
    private func goToTheNextScreen() {
        let vc = StartGameAndPointsViewController()
        let navVC = UINavigationController(rootViewController: vc)
        navVC.navigationBar.tintColor = .black
        navVC.modalTransitionStyle = .flipHorizontal
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
}
    
    
    
    
    
    
    // 1 shuffle array (take it from DataStore)
    // 2 create iterator var (currentWordIndex)
    // 3 take item
    // 4 go next (increment(+1) currentWordIndex and take next item)
    
    // 1 shuffle array
    // 2 take word from array
    // 3 remove word from array
    // Example:
    //    var words =  [1, 2, 3]
    //    let elem = words.popFirst()
    // elem 1
    // words [2, 3]
    
    
    
