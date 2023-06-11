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
        label.text = "Выберите тему"
        label.font = .systemFont(ofSize: 30)
        label.textColor = UIColor(named: "buttonColor")
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let labelMoreOpportunites: UILabel = {
        let label = UILabel().prepare()
        label.text = "Выберите тему 'общая' и добавьте свои собственные слова в игру! "
        label.font = .systemFont(ofSize: 15)
        label.textColor = UIColor(named: "buttonColor")
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var celebritiesButton: UIButton = {
        let button = UIButton().prepare()
        formatButton(button, title: "\(Category.celebrities.rawValue)")
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var travelButton: UIButton = {
        let button = UIButton().prepare()
        formatButton(button, title: "\(Category.travel.rawValue)")
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var sportButton: UIButton = {
        let button = UIButton().prepare()
        formatButton(button, title: "\(Category.sport.rawValue)")
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var moviesButton: UIButton = {
        let button = UIButton().prepare()
        formatButton(button, title: "\(Category.movies.rawValue)")
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var mixButton: UIButton = {
        let button = UIButton().prepare()
        formatButton(button, title: "\(Category.mixTheme.rawValue)")
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private let buttonStack = UIStackView().prepare()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "backgroundColor")
        view.addSubview(label)
        view.addSubview(celebritiesButton)
        view.addSubview(labelMoreOpportunites)
        view.addSubview(buttonStack)
        
        buttonStack.addArrangedSubview(celebritiesButton)
        buttonStack.addArrangedSubview(travelButton)
        buttonStack.addArrangedSubview(sportButton)
        buttonStack.addArrangedSubview(moviesButton)
        buttonStack.addArrangedSubview(mixButton)
        buttonStack.axis = .vertical
        buttonStack.spacing = 30
        
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            
            labelMoreOpportunites.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            labelMoreOpportunites.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            labelMoreOpportunites.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            
            buttonStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStack.topAnchor.constraint(equalTo: label.topAnchor, constant: 100),
            buttonStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 70)
        ])
        
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        if sender == mixButton {
            let mixButtonVC = AdditionalWordsViewController()
            navigationItem.backButtonTitle = ""
            navigationController?.pushViewController(mixButtonVC, animated: true)
        } else {
            switch sender {
            case celebritiesButton:
                Game.shared.setCategory(.celebrities)
            case travelButton:
                Game.shared.setCategory(.travel)
            case sportButton:
                Game.shared.setCategory(.sport)
            case moviesButton:
                Game.shared.setCategory(.movies)
            default:
                break
            }
            let startgameVC = StartGameAndPointsViewController()
            
            navigationItem.backButtonTitle = ""
            navigationController?.pushViewController(startgameVC, animated: true)
            
            print("Выбрана тема: \(Game.shared.category!)")
        }
    }
}


