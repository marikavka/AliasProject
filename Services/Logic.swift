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
}

let commonThemeWords = Words.celebrities + Words.movies + Words.sport + Words.travel
let mixTheme = commonThemeWords.shuffled()

func formatButton(_ button: UIButton, title: String) {
    button.setTitle(title, for: .normal)
    button.setTitleColor(UIColor(named: "backgroundColor"), for: .normal)
    button.backgroundColor = UIColor(named: "buttonColor")
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    button.layer.cornerRadius = 15
}

let time = 30

func getRusTopicName(_ array: [String]) -> String {
    switch array {
    case Words.celebrities:
        return "Знаменитости"
    case Words.travel:
        return "Путешествия"
    case Words.sport:
        return "Спорт"
    case Words.movies:
        return "Фильмы"
    case mixTheme:
        return "Без темы"
    default:
        return "Свои слова"
    }
}
