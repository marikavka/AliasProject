//
//  OwnWordsViewController.swift
//  AliasProject
//
//  Created by Белинский Влвдислав on 06.06.2023.
//

import UIKit

final class OwnWordsViewController: UIViewController {
    
    private let label: UILabel = {
        let label = UILabel().prepare()
        label.formatLabel(label, title: "Загадайте свои слова", size: 30)
        return label
    }()
    
    private let newWordTF: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите слово"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor(named: "textFieldColor")
        return textField
    }()
    
    private lazy var enterButton: UIButton = {
        let button = UIButton().prepare()
        button.formatButton(button, title: "добавить")
        button.addTarget(self, action: #selector(enterButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var readyButton: UIButton = {
        let button = UIButton().prepare()
        button.formatButton(button, title: "готово")
        button.addTarget(self, action: #selector(readyButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let vStack = UIStackView()
    
    var actualWords: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "backgroundColor")
        
        vStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(vStack)
        vStack.addArrangedSubview(label)
        vStack.addArrangedSubview(newWordTF)
        vStack.addArrangedSubview(enterButton)
        vStack.addArrangedSubview(readyButton)
        vStack.axis = .vertical
        vStack.alignment = .center
        vStack.spacing = 15
        
        NSLayoutConstraint.activate([

            vStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vStack.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            vStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            
            newWordTF.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            
            enterButton.widthAnchor.constraint(equalToConstant: 230),
            
            readyButton.widthAnchor.constraint(equalToConstant: 230)
        ])
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @objc func enterButtonTapped(_ sender: UIButton) {
        guard let inputText = newWordTF.text, !inputText.isEmpty else { return }
        actualWords.append(inputText)
        newWordTF.placeholder = inputText
        newWordTF.text = ""
        
    }
    
    @objc func readyButtonTapped(_ sender: UIButton) {
        Game.shared.ownWords = actualWords
        Game.shared.setCategory(.mixTheme)
        let vc = StartGameAndPointsViewController()
        let navVC = UINavigationController(rootViewController: vc)
        navVC.navigationBar.tintColor = .black
        navVC.modalTransitionStyle = .flipHorizontal
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }

}
