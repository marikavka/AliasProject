//
//  RulesViewController.swift
//  AliasProject
//
//  Created by Мария Купчинская on 03.06.2023.
//

import UIKit

final class RulesViewController: UIViewController {
    
    private let label: UILabel = {
        let label = UILabel().prepare()
        Game.shared.formatLabel(
            label,
            title: "В игру ALIAS играют командами из двух или более человек. \nГлавная идея игры заключается в том, чтобы объяснить слова своим товарищам по команде другими словами, используя, например, синонимы, антонимы и подсказки так, чтобы члены вашей команды смогли отгадать как можно больше слов прежде чем истечет время. \nКаждой команде предоставляется 30 секунд за раунд на объяснение слов. \nКол-во раундов не ограничено, главное - набрать 20 очков первыми и стать победителями!",
            size: 20
        )
        label.textAlignment = .justified
        return label
    }()
    
    private let labelPicture: UILabel = {
        let label = UILabel().prepare()
        Game.shared.formatLabel(label, title: "🧐", size: 150)
        return label
    }()
    
    private let labelStack = UIStackView().prepare()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "backgroundColor")
        view.addSubview(labelStack)
        
        labelStack.addArrangedSubview(label)
        labelStack.addArrangedSubview(labelPicture)
        labelStack.axis = .vertical
        labelStack.spacing = 30
        
        NSLayoutConstraint.activate([
            
            labelStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            labelStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            labelStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            labelStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15)
//            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
//            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
//            label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
//
//            labelPicture.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30),
//            labelPicture.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
//            labelPicture.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
        ])
        
        
    }
    
}
