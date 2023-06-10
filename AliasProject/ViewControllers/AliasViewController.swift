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
    
    private let label: UILabel = {
        let label = UILabel().prepare()
        label.text = "A L I A S"
        label.font = .systemFont(ofSize: 70)
        label.textColor = UIColor(red: 0.17, green: 0.08, blue: 0, alpha: 1)
        label.textAlignment = .center
        return label
    }()
    
    private let labelPicture: UILabel = {
        let label = UILabel().prepare()
        label.text = "🚀"
        label.font = .systemFont(ofSize: 150)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton().prepare()
        button.setTitle("начать игру", for: .normal)
        
        button.setTitleColor(UIColor(red: 0.4, green: 0.5, blue: 0.3, alpha: 1), for: .normal)
        button.backgroundColor = UIColor(red: 0.17, green: 0.08, blue: 0, alpha: 1)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.4, green: 0.5, blue: 0.3, alpha: 1)
        view.addSubview(label)
        view.addSubview(button)
        view.addSubview(labelPicture)
        
        navigationItem.rightBarButtonItem = rulesButton
        
        button.layer.cornerRadius = 15
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            
            labelPicture.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 70),
            labelPicture.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            labelPicture.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70),
            button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100),
            
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
}


