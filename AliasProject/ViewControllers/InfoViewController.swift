//
//  ViewController.swift
//  AliasProject
//
//  Created by Мария Купчинская on 03.06.2023.
//

import UIKit

final class InfoViewController: UIViewController {
    
    private let label: UILabel = {
        let label = UILabel().prepare()
        Game.shared.formatLabel(
            label,
            title: "Создано и протестировано \n \n Белинским Владиславом \n Купчинской Марией",
            size: 25
        )
        return label
    }()
    
    private let labelPicture: UILabel = {
        let label = UILabel().prepare()
        Game.shared.formatLabel(label, title: "👩🏽‍💻👨🏼‍💻", size: 150)
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
            labelStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            labelStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15)
        ])
        
    }
}
