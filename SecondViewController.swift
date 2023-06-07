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
        button.setImage(UIImage(named:team[0].imageName), for: .normal)
        button.addTarget(self, action: #selector(chooseTeam), for: .touchUpInside)
        return button
    }()
    
    private lazy var vishniButton: UIButton = {
        let button = UIButton().prepare()
        button.setImage(UIImage(named:team[1].imageName), for: .normal)
        button.addTarget(self, action: #selector(chooseTeamTwo), for: .touchUpInside)
        return button
    }()
    
    private lazy var olivkaButton: UIButton = {
        let button = UIButton().prepare()
        button.setImage(UIImage(named:team[2].imageName), for: .normal)
        button.addTarget(self, action: #selector(chooseTeamThree), for: .touchUpInside)
        return button
    }()
    
    private lazy var baklazButton: UIButton = {
        let button = UIButton().prepare()
        button.setImage(UIImage(named:team[3].imageName), for: .normal)
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
    
    var choosenTeamsIndexAndScore: [Int: Int] = [:]
    
    private let team = Team.getTeam()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.4, green: 0.5, blue: 0.3, alpha: 1)
        view.addSubview(label)
        view.addSubview(doneButton)
        view.addSubview(hStack)
        
        vStack1.addArrangedSubview(gribokButton)
        vStack1.addArrangedSubview(olivkaButton)
        vStack1.axis = .vertical
        vStack1.spacing = 30
        
        vStack2.addArrangedSubview(vishniButton)
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
        let index = 0
        buttonActions(sender, index)
    }
    
    @objc func chooseTeamTwo(_ sender: UIButton) {
        let index = 1
        buttonActions(sender, index)
    }
    
    @objc func chooseTeamThree(_ sender: UIButton) {
        let index = 2
        buttonActions(sender, index)
    }
    
    @objc func chooseTeamFour(_ sender: UIButton) {
        let index = 3
        buttonActions(sender, index)
    }
    
    
    @objc func doneButtonTapped() {
        if choosenTeamsIndexAndScore.count >= 2 {
            let vc = ChooseTopicViewController()
            vc.choosenTeamsIndexAndScore = choosenTeamsIndexAndScore
            navigationItem.backButtonTitle = ""
            navigationController?.pushViewController(vc, animated: true)
            print("buttonTapped")
            for (teamIndex, score) in choosenTeamsIndexAndScore {
                print("\(teamIndex) : \(score)")
            }
        }
        else {
            print("NO")
        }
    }
    
    func buttonActions(_ sender: UIButton, _ index: Int) {
        if sender.currentImage == UIImage(named: team[index].colorImageName) {
            sender.setImage(UIImage(named:team[index].imageName), for: .normal)
            for (key, _) in choosenTeamsIndexAndScore {
                if key == index {
                    choosenTeamsIndexAndScore.removeValue(forKey: key)
                }
            }
        } else {
                    sender.setImage( UIImage(named: team[index].colorImageName), for: .normal)
                    choosenTeamsIndexAndScore[index] = 0
                }
            }
            
        }
    


