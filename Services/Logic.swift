//
//  Logic.swift
//  AliasProject
//
//  Created by Владислав Белинский on 06.06.2023.
//

import UIKit

enum Words {
    static let celebrities = [
        "Дмитрий Маликов",
        "Эми Уайнхаус",
        "Барак Обама",
        "Гомер",
        "Виктор Цой",
        "Бейонсе",
        "Петр III",
        "Криштиану Роналду",
        "Илон Маск",
        "Гаврило Принцип"
    ]
    
    static let travel = [
        "Берлин",
        "Шопинг",
        "Пляж",
        "Боинг",
        "Кемпинг",
        "Maps.me",
        "Эверест",
        "City Sightseeing",
        "Колесо обозрения",
        "Плацкарт"
    ]
    
    static let sport = [
        "Шайба",
        "Скелетон",
        "Эстафетная палочка",
        "Прыжки в высоту",
        "Финиш",
        "Нокаут",
        "Допинг",
        "Болельщики",
        "Олимпийский огонь",
        "Двойной тулуп"
    ]
    
    static let movies = [
        "Аватар",
        "Евротур",
        "Левиафан",
        "Омерзительная восьмерка",
        "Форрест Гамп",
        "Бриллиантовая рука",
        "Интерстеллар",
        "Игра престолов",
        "Бойцовский клуб",
        "17 мгновений весны"
    ]
    
    static let commonThemeWords = Words.celebrities + Words.movies + Words.sport + Words.travel
    
    static let mixTheme = Words.commonThemeWords.shuffled()
}

func formatButton(_ button: UIButton, title: String) {
    button.setTitle(title, for: .normal)
    button.setTitleColor(UIColor(named: "backgroundColor"), for: .normal)
    button.backgroundColor = UIColor(named: "buttonColor")
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    button.layer.cornerRadius = 15
}

enum Category: String {
    case celebrities = "Знаменитости"
    case travel = "Путешествия"
    case sport = "Спорт"
    case movies = "Фильмы"
    case mixTheme = "Без темы"
    case ownTheme = "Свои слова"
    
    var words: [String] {
        switch self {
        case .celebrities:
            return Words.celebrities
        case .travel:
            return Words.travel
        case .sport:
            return Words.sport
        case .movies:
            return Words.movies
        case .mixTheme:
            return Words.mixTheme
        case .ownTheme:
            return Game.shared.ownWords
        }
    }
}

