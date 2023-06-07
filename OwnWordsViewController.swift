//
//  OwnWordsViewController.swift
//  AliasProject
//
//  Created by Белинский Влвдислав on 06.06.2023.
//

import UIKit

class OwnWordsViewController: UIViewController {
    
    private let label: UILabel = {
        let label = UILabel().prepare()
        label.text = "Загадайте свои слова"
        label.font = .systemFont(ofSize: 30)
        label.textColor = UIColor(named: "buttonColor")
        label.textAlignment = .center
        label.numberOfLines = 0
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
        formatButton(button, title: "Добавить")
        button.addTarget(self, action: #selector(enterButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var readyButton: UIButton = {
        let button = UIButton().prepare()
        formatButton(button, title: "Готово")
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
        vStack.spacing = 30
        
        NSLayoutConstraint.activate([

            vStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vStack.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -60),
            vStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            
            newWordTF.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            
            enterButton.widthAnchor.constraint(equalTo: newWordTF.widthAnchor, multiplier: 1),
            
            readyButton.widthAnchor.constraint(equalTo: enterButton.widthAnchor, multiplier: 1)
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
        let timerVC = TimerViewController()
        navigationItem.backButtonTitle = ""
        navigationController?.pushViewController(timerVC, animated: true)
        timerVC.words = actualWords.shuffled()
    }

}
