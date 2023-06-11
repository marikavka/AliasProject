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
        label.text = "Хотите добавить свои слова?"
        label.font = .systemFont(ofSize: 30)
        label.textColor = UIColor(red: 0.17, green: 0.08, blue: 0, alpha: 1)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let labelPicture: UILabel = {
        let label = UILabel().prepare()
        label.text = "📲"
        label.font = .systemFont(ofSize: 150)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var buttonAddWords: UIButton = {
        let button = UIButton().prepare()
        button.setTitle("добавить слова", for: .normal)
        
        button.setTitleColor(UIColor(red: 0.4, green: 0.5, blue: 0.3, alpha: 1), for: .normal)
        button.backgroundColor = UIColor(red: 0.17, green: 0.08, blue: 0, alpha: 1)
        button.addTarget(self, action: #selector(buttonTappedAddWords), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return button
    }()
    
    private lazy var buttonStartGame: UIButton = {
        let button = UIButton().prepare()
        button.setTitle("начать игру", for: .normal)
        
        button.setTitleColor(UIColor(red: 0.4, green: 0.5, blue: 0.3, alpha: 1), for: .normal)
        button.backgroundColor = UIColor(red: 0.17, green: 0.08, blue: 0, alpha: 1)
        button.addTarget(self, action: #selector(buttonTappedStartGame), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.4, green: 0.5, blue: 0.3, alpha: 1)
        view.addSubview(label)
        view.addSubview(labelPicture)
        view.addSubview(buttonAddWords)
        view.addSubview(buttonStartGame)
        
        buttonStartGame.layer.cornerRadius = 15
        buttonAddWords.layer.cornerRadius = 15
        
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
