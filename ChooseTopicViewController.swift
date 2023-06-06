//
//  ThirdViewController.swift
//  AliasProject
//
//  Created by Белинский Владислав on 03.06.2023.
//

import UIKit

final class ChooseTopicViewController: UIViewController {
    
    private let label: UILabel = {
        let label = UILabel().prepare()
        label.text = "Выбирайте тему"
        label.font = .systemFont(ofSize: 30)
        label.textColor = UIColor(named: "buttonColor")
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var celebritiesButton: UIButton = {
        let button = UIButton().prepare()
        formatButton(button, title: "Знаменитости")
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var travelButton: UIButton = {
        let button = UIButton().prepare()
        formatButton(button, title: "Путешествия")
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var sportButton: UIButton = {
        let button = UIButton().prepare()
        formatButton(button, title: "Спорт")
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var moviesButton: UIButton = {
        let button = UIButton().prepare()
        formatButton(button, title: "Фильмы")
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var mixButton: UIButton = {
        let button = UIButton().prepare()
        formatButton(button, title: "Без темы")
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var ownWordsButton: UIButton = {
        let button = UIButton().prepare()
        formatButton(button, title: "Свои слова")
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    let buttonStack = UIStackView()
    
    var actualWords: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "backgroundColor")
        view.addSubview(label)
        view.addSubview(celebritiesButton)
        
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonStack)
        
        buttonStack.addArrangedSubview(celebritiesButton)
        buttonStack.addArrangedSubview(travelButton)
        buttonStack.addArrangedSubview(sportButton)
        buttonStack.addArrangedSubview(moviesButton)
        buttonStack.addArrangedSubview(mixButton)
        buttonStack.addArrangedSubview(ownWordsButton)
        buttonStack.axis = .vertical
        buttonStack.spacing = 30
        
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            
            buttonStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStack.topAnchor.constraint(equalTo: label.topAnchor, constant: 100),
            buttonStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100)
        ])

    }
    @objc func buttonTapped(_ sender: UIButton) {
        if sender == ownWordsButton {
            let ownWordsVC = OwnWordsViewController()
            navigationItem.backButtonTitle = ""
            navigationController?.pushViewController(ownWordsVC, animated: true)
            ownWordsVC.words = actualWords
        } else {
            let timerVC = TimerViewController()
            navigationItem.backButtonTitle = ""
            navigationController?.pushViewController(timerVC, animated: true)
            
            switch sender {
            case celebritiesButton:
                actualWords = celebrities
            case travelButton:
                actualWords = travel
            case sportButton:
                actualWords = sport
            case moviesButton:
                actualWords = movies
            case mixButton:
                actualWords = mixTheme
            default:
                break
            }
            timerVC.words = actualWords
        }
    }
}


