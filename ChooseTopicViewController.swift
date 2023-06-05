//
//  ThirdViewController.swift
//  AliasProject
//
//  Created by Белинский Владислав on 03.06.2023.
//

import UIKit

final class ChooseTopicViewController: UIViewController {
    
    private let label: UILabel = {
        let label = UILabel().prepare()
        label.text = "Выбирайте тему"
        label.font = .systemFont(ofSize: 30)
        label.textColor = UIColor(red: 0.17, green: 0.08, blue: 0, alpha: 1)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var celebritiesButton: UIButton = {
        let button = UIButton().prepare()
        formatButton(button, title: "Знаменитости")
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var travelButton: UIButton = {
        let button = UIButton().prepare()
        formatButton(button, title: "Путешествия")
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var sportButton: UIButton = {
        let button = UIButton().prepare()
        formatButton(button, title: "Спорт")
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var moviesButton: UIButton = {
        let button = UIButton().prepare()
        formatButton(button, title: "Фильмы")
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var mixButton: UIButton = {
        let button = UIButton().prepare()
        formatButton(button, title: "Без темы")
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var ownWordsButton: UIButton = {
        let button = UIButton().prepare()
        formatButton(button, title: "Свои слова")
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    let buttonStack = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.4, green: 0.5, blue: 0.3, alpha: 1)
        view.addSubview(label)
        view.addSubview(celebritiesButton)
        
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonStack)
        
        buttonStack.addArrangedSubview(celebritiesButton)
        buttonStack.addArrangedSubview(travelButton)
        buttonStack.addArrangedSubview(sportButton)
        buttonStack.addArrangedSubview(moviesButton)
        buttonStack.addArrangedSubview(mixButton)
        buttonStack.addArrangedSubview(ownWordsButton)
        buttonStack.axis = .vertical
        buttonStack.spacing = 30
        
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            
            buttonStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStack.topAnchor.constraint(equalTo: label.topAnchor, constant: 100),
            buttonStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            buttonStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100)
        ])

    }
    @objc func buttonTapped() {
        let vc = TimerViewController()
        navigationItem.backButtonTitle = ""
        navigationController?.pushViewController(vc, animated: true)
    }
        

}

private func formatButton(_ button: UIButton, title: String) {
    button.setTitle(title, for: .normal)
    button.setTitleColor(UIColor(red: 0.4, green: 0.5, blue: 0.3, alpha: 1), for: .normal)
    button.backgroundColor = UIColor(red: 0.17, green: 0.08, blue: 0, alpha: 1)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    button.layer.cornerRadius = 15
}
