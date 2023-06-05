//
//  DataStore.swift
//  AliasProject
//
//  Created by Белинский Владислав on 03.06.2023.
//

final class DataStore {
    static let shared = DataStore()
    
    let celebrities = [
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
    
    let travel = [
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
    
    let sport = [
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
    
    let movies = [
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
    
    let commonThemewords: [String]
    private init() {
        self.commonThemewords = celebrities + travel + sport + movies
    }
    
}
