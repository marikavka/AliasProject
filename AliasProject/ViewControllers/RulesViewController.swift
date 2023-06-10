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
        label.text = "В игру ALIAS играют командами из двух или более человек. \nГлавная идея игры заключается в том, чтобы объяснить слова своим товарищам по команде другими словами, используя, например, синонимы, антонимы и подсказки так, чтобы члены вашей команды смогли отгадать как можно больше слов прежде чем истечет время. \nКаждой команде предоставляется 30 секунд за раунд на объяснение слов. \nКол-во раундов не ограничено, главное - набрать 20 очков первыми и стать победителями!"
        label.font = .systemFont(ofSize: 20)
        label.textColor = UIColor(red: 0.17, green: 0.08, blue: 0, alpha: 1)
        label.textAlignment = .justified
        label.numberOfLines = 0
        return label
    }()
    
    private let labelPicture: UILabel = {
        let label = UILabel().prepare()
        label.text = "🧐"
        label.font = .systemFont(ofSize: 100)
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.4, green: 0.5, blue: 0.3, alpha: 1)
        view.addSubview(label)
        view.addSubview(labelPicture)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            
            labelPicture.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30),
            labelPicture.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            labelPicture.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
        ])
        
       
    }
  
}
