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
        label.font = .systemFont(ofSize: 30)
        label.textColor = UIColor(red: 0.17, green: 0.08, blue: 0, alpha: 1)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let warningLabel: UILabel = {
        let label = UILabel().prepare()
        label.font = .systemFont(ofSize: 30)
        label.textColor = UIColor(red: 0.17, green: 0.08, blue: 0, alpha: 1)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let teamLogo = UIImageView().prepare()
    
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
    
    private var rusTopicName: String?
    
    let vStack = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.4, green: 0.5, blue: 0.3, alpha: 1)
        
        rusTopicName = Game.shared.category?.rawValue
        
        vStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(vStack)
        
        vStack.addArrangedSubview(roundTopicLabel)
        vStack.addArrangedSubview(teamLogo)
        vStack.addArrangedSubview(warningLabel)
        vStack.addArrangedSubview(numberOfPoints)
        vStack.addArrangedSubview(doneButton)
        
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
            
            doneButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            
            vStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            vStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            teamLogo.widthAnchor.constraint(equalToConstant: 70),
            teamLogo.heightAnchor.constraint(equalToConstant: 70)
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
