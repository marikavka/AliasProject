//
//  Extension.swift
//  AliasProject
//
//  Created by Белинский Владислав on 11.06.2023.
//

import UIKit

extension UIButton {
    func formatButton(_ button: UIButton, title: String) {
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor(named: "backgroundColor"), for: .normal)
        button.backgroundColor = UIColor(named: "buttonColor")
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 15
    }
}

extension UILabel {
    func formatLabel(_ label: UILabel, title: String, size: CGFloat) {
        label.text = title
        label.font = .systemFont(ofSize: size)
        label.textColor = UIColor(named: "buttonColor")
        label.textAlignment = .center
        label.numberOfLines = 0
    }
}
