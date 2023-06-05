//
//  StartGameAndPointsViewController.swift
//  AliasProject
//
//  Created by Мария Купчинская on 05.06.2023.
//

import UIKit

class StartGameAndPointsViewController: UIViewController {
    
    private let label: UILabel = {
        let label = UILabel().prepare()
        label.text = "Ход команды + интерполяция"
        label.font = .systemFont(ofSize: 30)
        label.textColor = UIColor(red: 0.17, green: 0.08, blue: 0, alpha: 1)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let numberOfPoints: UILabel = {
        let numberOfPoints = UILabel().prepare()
        numberOfPoints.text = "Количество очков"
        numberOfPoints.font = .systemFont(ofSize: 30)
        numberOfPoints.textColor = UIColor(red: 0.17, green: 0.08, blue: 0, alpha: 1)
        numberOfPoints.textAlignment = .center
        numberOfPoints.numberOfLines = 0
        return numberOfPoints
    }()
    
    private lazy var doneButton: UIButton = {
        let button = UIButton().prepare()
        button.setTitle("готово", for: .normal)
        button.setTitleColor(UIColor(red: 0.4, green: 0.5, blue: 0.3, alpha: 1), for: .normal)
        button.backgroundColor = UIColor(red: 0.17, green: 0.08, blue: 0, alpha: 1)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
        button.layer.cornerRadius = 15
        return button
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.4, green: 0.5, blue: 0.3, alpha: 1)
        view.addSubview(label)
        view.addSubview(numberOfPoints)
        view.addSubview(doneButton)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            
            numberOfPoints.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            numberOfPoints.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 50),
            
            doneButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70),
            doneButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            doneButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -70)
            ])
    }
    @objc func doneButtonTapped() {
        let vc = ThirdViewController()
        let navVC = UINavigationController(rootViewController: vc)
        navVC.navigationBar.tintColor = .black
        navVC.modalTransitionStyle = .flipHorizontal
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
        
    }
}
