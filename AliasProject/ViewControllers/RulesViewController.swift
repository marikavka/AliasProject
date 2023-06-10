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
        label.text = "В игру ALIAS играют командами из двух или более человек. Главная идея игры заключается в том, чтобы объяснить слова своим товарищам по команде другими словами, используя, например, синонимы, антонимы и подсказки так, чтобы члены вашей команды смогли отгадать как можно больше слов прежде чем истечет время."
        label.font = .systemFont(ofSize: 20)
        label.textColor = UIColor(red: 0.17, green: 0.08, blue: 0, alpha: 1)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.4, green: 0.5, blue: 0.3, alpha: 1)
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
        ])
        
       
    }
  
}
