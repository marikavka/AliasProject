//
//  SecondViewController.swift
//  AliasProject
//
//  Created by Мария Купчинская on 03.06.2023.
//

import UIKit


class SecondViewController: UIViewController {
    
    private lazy var rulesButton = UIBarButtonItem(title: "Как играть?", style: .plain, target: self, action: #selector(rulesButtonTapped))
    
    private let label: UILabel = {
        let label = UILabel().prepare()
        label.text = "Выбирайте команды!"
        label.font = .systemFont(ofSize: 30)
        label.textColor = UIColor(red: 0.17, green: 0.08, blue: 0, alpha: 1)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var gribokButton: UIButton = {
        let button = UIButton().prepare()
        button.setImage(UIImage(named:"gribok"), for: .normal)
        button.addTarget(self, action: #selector(chooseTeam), for: .touchUpInside)
        return button
    }()
    
    private lazy var vishniButton: UIButton = {
        let button = UIButton().prepare()
        button.setImage(UIImage(named:"vishni"), for: .normal)
        button.addTarget(self, action: #selector(chooseTeamTwo), for: .touchUpInside)
        return button
    }()
    
    private lazy var olivkaButton: UIButton = {
        let button = UIButton().prepare()
        button.setImage(UIImage(named:"olivka"), for: .normal)
        button.addTarget(self, action: #selector(chooseTeamThree), for: .touchUpInside)
        return button
    }()
    
    private lazy var baklazButton: UIButton = {
        let button = UIButton().prepare()
        button.setImage(UIImage(named:"baklaz"), for: .normal)
        button.addTarget(self, action: #selector(chooseTeamFour), for: .touchUpInside)
        return button
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
        view.addSubview(gribokButton)
        view.addSubview(vishniButton)
        view.addSubview(olivkaButton)
        view.addSubview(baklazButton)
        view.addSubview(doneButton)
        
        
        
        navigationItem.rightBarButtonItem = rulesButton
        
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            
            gribokButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 100),
            gribokButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            
            vishniButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 100),
            vishniButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            
            olivkaButton.topAnchor.constraint(equalTo: gribokButton.bottomAnchor, constant: 10),
            olivkaButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            
            baklazButton.topAnchor.constraint(equalTo: vishniButton.bottomAnchor, constant: 10),
            baklazButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            
            doneButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            doneButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            doneButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100)
            
        ])
        
    }
    
    @objc func rulesButtonTapped() {
        let vc = RulesViewController()
        navigationItem.backButtonTitle = ""
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func chooseTeam(_ sender: UIButton) {
        
        if sender.currentImage == UIImage(named: "colorgribok") {
            sender.setImage(UIImage(named:"gribok"), for: .normal)
        }
        else {
            sender.setImage( UIImage(named:"colorgribok"), for: .normal)
        }
    }
    @objc func chooseTeamTwo(_ sender: UIButton) {
        
        if sender.currentImage == UIImage(named: "colorvishni") {
            sender.setImage(UIImage(named:"vishni"), for: .normal)
        }
        else {
            sender.setImage( UIImage(named:"colorvishni"), for: .normal)
        }
    }
    @objc func chooseTeamThree(_ sender: UIButton) {
        
        if sender.currentImage == UIImage(named: "colorOlivka") {
            sender.setImage(UIImage(named:"olivka"), for: .normal)
        }
        else {
            sender.setImage( UIImage(named:"colorOlivka"), for: .normal)
        }
    }
    @objc func chooseTeamFour(_ sender: UIButton) {
        
        if sender.currentImage == UIImage(named: "colorBaklaz") {
            sender.setImage(UIImage(named:"baklaz"), for: .normal)
        }
        else {
            sender.setImage( UIImage(named:"colorBaklaz"), for: .normal)
        }
    }
    @objc func doneButtonTapped() {
        let vc = ThirdViewController()
        navigationItem.backButtonTitle = ""
        navigationController?.pushViewController(vc, animated: true)
    }
}
