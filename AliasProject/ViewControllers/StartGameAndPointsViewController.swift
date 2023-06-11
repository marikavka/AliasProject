//
//  StartGameAndPointsViewController.swift
//  AliasProject
//
//  Created by Мария Купчинская on 05.06.2023.
//

import UIKit

final class StartGameAndPointsViewController: UIViewController {
    
    private let roundTopicLabel: UILabel = {
        let label = UILabel().prepare()
        Game.shared.formatLabel(label, title: "", size: 30)
        return label
    }()
    
    private let warningLabel: UILabel = {
        let label = UILabel().prepare()
        Game.shared.formatLabel(label, title: "", size: 30)
        return label
    }()
    
    private let teamLogo = UIImageView().prepare()
    
    private let numberOfPoints: UILabel = {
        let label = UILabel().prepare()
        Game.shared.formatLabel(label, title: "", size: 30)
        return label
    }()
    
    private lazy var doneButton: UIButton = {
        let button = UIButton().prepare()
        Game.shared.formatButton(button, title: "старт")
        button.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private var rusTopicName: String?
    
    private let vStack = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "backgroundColor")
        
        rusTopicName = Game.shared.category?.rawValue
        
        vStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(vStack)
        view.addSubview(doneButton)
        
        vStack.addArrangedSubview(teamLogo)
        vStack.addArrangedSubview(warningLabel)
        vStack.addArrangedSubview(numberOfPoints)
        
        vStack.axis = .vertical
        vStack.spacing = 30
        vStack.alignment = .center
        
        if let currentTeam = Game.shared.currentTeam {
            
            roundTopicLabel.text = """
            Играет команда: \(currentTeam.name)
            Тема: \(rusTopicName!)
            """
            
            warningLabel.text = """
    У вас будет \(Game.shared.time) секунд, чтобы угадать максимальное количество слов, готовы?
    """
            teamLogo.image = UIImage(named: "\(currentTeam.colorImageName)")
        }
        
        NSLayoutConstraint.activate([
            vStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            vStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            
            teamLogo.widthAnchor.constraint(equalToConstant: 150),
            teamLogo.heightAnchor.constraint(equalToConstant: 150),
            
            doneButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70),
            doneButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 70),
            doneButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -70)
        ])
    }
    
    @objc func doneButtonTapped() {
        let timerVC = TimerViewController()
        let navVC = UINavigationController(rootViewController: timerVC)
        navVC.navigationBar.tintColor = .black
        navVC.modalTransitionStyle = .flipHorizontal
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }

}
