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
        label.text = "Создано и протестировано \n \n Белинским Владиславом \n Купчинской Марией"
        label.font = .systemFont(ofSize: 25)
        label.textColor = UIColor(red: 0.17, green: 0.08, blue: 0, alpha: 1)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let labelPicture: UILabel = {
        let label = UILabel().prepare()
        label.text = "👩🏽‍💻👨🏽‍💻"
        label.font = .systemFont(ofSize: 150)
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.4, green: 0.5, blue: 0.3, alpha: 1)
        view.addSubview(label)
        view.addSubview(labelPicture)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            
            labelPicture.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 70),
            labelPicture.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            labelPicture.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15)
        ])
        
    }
}
