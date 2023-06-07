//
//  SecondViewController.swift
//  AliasProject
//
//  Created by Мария Купчинская on 03.06.2023.
//

import UIKit

private struct TeamContainer {
    let team: Team
    var isSelected = false
}

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
    
    let vStack1 = UIStackView()
    let vStack2 = UIStackView()
    let hStack = UIStackView().prepare()
    
    private var teams = [
        TeamContainer(team: Team(imageName: "colorgribok", name: "Грибы")),
        TeamContainer(team: Team(imageName: "colorOlivka", name: "Оливки")),
        TeamContainer(team: Team(imageName: "colorvishni", name: "Вишни")),
        TeamContainer(team: Team(imageName: "colorBaklaz", name: "Баклажаны"))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.4, green: 0.5, blue: 0.3, alpha: 1)
        view.addSubview(label)
        view.addSubview(doneButton)
        view.addSubview(hStack)
        
        vStack1.addArrangedSubview(gribokButton)
        vStack1.addArrangedSubview(vishniButton)
        vStack1.axis = .vertical
        vStack1.spacing = 30
        
        vStack2.addArrangedSubview(olivkaButton)
        vStack2.addArrangedSubview(baklazButton)
        vStack2.axis = .vertical
        vStack2.spacing = 30
        
        hStack.addArrangedSubview(vStack1)
        hStack.addArrangedSubview(vStack2)
        hStack.axis = .horizontal
        hStack.spacing = 30
        
        navigationItem.rightBarButtonItem = rulesButton
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            
            hStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            hStack.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 100),
            
            doneButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70),
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
            teams[0].isSelected = false
        }
        else {
            sender.setImage(UIImage(named:"colorgribok"), for: .normal)
            teams[0].isSelected = true
        }
    }
    
    @objc func chooseTeamTwo(_ sender: UIButton) {
        
        if sender.currentImage == UIImage(named: "colorvishni") {
            sender.setImage(UIImage(named:"vishni"), for: .normal)
            teams[1].isSelected = false
        }
        else {
            sender.setImage( UIImage(named:"colorvishni"), for: .normal)
            teams[1].isSelected = true
        }
    }
    
    @objc func chooseTeamThree(_ sender: UIButton) {
        
        if sender.currentImage == UIImage(named: "colorOlivka") {
            sender.setImage(UIImage(named:"olivka"), for: .normal)
            teams[2].isSelected = false
        }
        else {
            sender.setImage( UIImage(named:"colorOlivka"), for: .normal)
            teams[2].isSelected = true
        }
    }
    
    @objc func chooseTeamFour(_ sender: UIButton) {
        
        if sender.currentImage == UIImage(named: "colorBaklaz") {
            sender.setImage(UIImage(named:"baklaz"), for: .normal)
            teams[3].isSelected = false
        }
        else {
            sender.setImage( UIImage(named:"colorBaklaz"), for: .normal)
            teams[3].isSelected = true
        }
    }
    
    
    @objc func doneButtonTapped() {
        var selectedTeams: [Team] = []
        for team in teams {
            if team.isSelected == true {
                selectedTeams.append(team.team)
            }
        }
        if selectedTeams.count >= 2 {
            let vc = ChooseTopicViewController()
            navigationItem.backButtonTitle = ""
            navigationController?.pushViewController(vc, animated: true)}
        else {
            print("NO")
        }
    }
    
}

