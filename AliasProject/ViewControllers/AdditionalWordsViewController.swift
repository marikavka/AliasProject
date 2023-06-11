//
//  AdditionalWordsViewController.swift
//  AliasProject
//
//  Created by Мария Купчинская on 10.06.2023.
//

import UIKit

final class AdditionalWordsViewController: UIViewController {
    
    private let label: UILabel = {
        let label = UILabel().prepare()
        label.formatLabel(label, title: "Хотите добавить свои слова?", size: 30)
        return label
    }()
    
    private let labelPicture: UILabel = {
        let label = UILabel().prepare()
        label.formatLabel(label, title: "📲", size: 150)
        return label
    }()
    
    private lazy var buttonAddWords: UIButton = {
        let button = UIButton().prepare()
        button.formatButton(button, title: "добавить слова")
        button.addTarget(self, action: #selector(buttonTappedAddWords), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonStartGame: UIButton = {
        let button = UIButton().prepare()
        button.formatButton(button, title: "начать игру")
        button.addTarget(self, action: #selector(buttonTappedStartGame), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "backgroundColor")
        view.addSubview(label)
        view.addSubview(labelPicture)
        view.addSubview(buttonAddWords)
        view.addSubview(buttonStartGame)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            
            labelPicture.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 50),
            labelPicture.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            labelPicture.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            
            buttonStartGame.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70),
            buttonStartGame.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 70),
            buttonStartGame.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -70),
            
            buttonAddWords.bottomAnchor.constraint(equalTo: buttonStartGame.bottomAnchor, constant: -70),
            buttonAddWords.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -70),
            buttonAddWords.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 70)
        ])
        
    }
    @objc func buttonTappedAddWords() {
        let vc = OwnWordsViewController()
        let navVC = UINavigationController(rootViewController: vc)
        navVC.navigationBar.tintColor = .black
        navVC.modalTransitionStyle = .flipHorizontal
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
    
    @objc func buttonTappedStartGame() {
        Game.shared.setCategory(.mixTheme)
        let vc = StartGameAndPointsViewController()
        let navVC = UINavigationController(rootViewController: vc)
        navVC.navigationBar.tintColor = .black
        navVC.modalTransitionStyle = .flipHorizontal
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
        
    }
}
