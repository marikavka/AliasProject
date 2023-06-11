//
//  AliasViewController.swift
//  AliasProject
//
//  Created by Мария Купчинская on 10.06.2023.
//

import UIKit

extension UIView {
    
    func prepare() -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        return self
    }
}

final class ViewController: UIViewController {
    
    private lazy var rulesButton = UIBarButtonItem(title: "Как играть?", style: .plain, target: self, action: #selector(rulesButtonTapped))
    
    private lazy var infoButton = UIBarButtonItem(title: "Авторы", style: .plain, target: self, action: #selector(infoButtonTapped))
    
    private let label: UILabel = {
        let label = UILabel().prepare()
        Game.shared.formatLabel(label, title: "A L I A S", size: 70)
        return label
    }()
    
    private let labelPicture: UILabel = {
        let label = UILabel().prepare()
        Game.shared.formatLabel(label, title: "🚀", size: 150)
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton().prepare()
        Game.shared.formatButton(button, title: "начать игру")
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "backgroundColor")
        view.addSubview(label)
        view.addSubview(button)
        view.addSubview(labelPicture)
        
        navigationItem.rightBarButtonItem = rulesButton
        navigationItem.leftBarButtonItem = infoButton
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            labelPicture.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            labelPicture.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70),
            button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 70),
            button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -70),
        ])
    }
    
    @objc func buttonTapped() {
        Game.shared.startNewGame()
        let vc = ChooseTeamViewController()
        let navVC = UINavigationController(rootViewController: vc)
        navVC.navigationBar.tintColor = .black
        navVC.modalTransitionStyle = .flipHorizontal
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
    
    @objc func rulesButtonTapped() {
        let vc = RulesViewController()
        navigationItem.backButtonTitle = ""
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func infoButtonTapped() {
        let vc = InfoViewController()
        navigationItem.backButtonTitle = ""
        navigationController?.pushViewController(vc, animated: true)
    }
}


