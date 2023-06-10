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
        "Гаврило Принцип",
        "Анджелина Джоли",
        "Ариана Гранде",
        "Аманда Сейфрид",
        "Алёна Долецкая",
        "Алёна Шишкова",
        "Анастасия Волконская",
        "Белла Хадид",
        "Бейонсе",
        "Блейк Лайвли",
        "Брэд Питт",
        "Белла Потемкина",
        "Боб Дилан",
        "Валерия",
        "Вера Брежнева",
        "Валерий Меладзе",
        "Виктория Исакова",
        "Владимир Машков",
        "Виктория Лопырева",
        "Григорий Лепс",
        "Глафира Тарханова",
        "Гвинет Пэлтроу",
        "Глеб Матвейчук",
        "Гарик Мартиросян",
        "Григорий Антипенко",
        "Ева Грин",
        "Ева Мендэс",
        "Ева Польна",
        "Евгений Плющенко",
        "Егор Дружинин",
        "Егор Крид",
        "Джиджи Хадид",
        "Джастин Бибер",
        "Дрейк",
        "Джейсон Стэтхем",
        "Дженнифер Энистон",
        "Данила Козловский"
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
        "Плацкарт",
        "авиакомпания",
        "автобус",
        "агентство",
        "аэропорт",
        "багаж",
        "бензин",
        "билет",
        "валюта",
        "велосипед",
        "взлетать",
        "виза",
        "внутренний туризм",
        "вокзал",
        "временная миграция",
        "город",
        "гостевой дом",
        "гостиница",
        "граница",
        "достопримечательности",
        "европейские страны",
        "ежегодный отпуск",
        "ехать за границу",
        "железная дорога",
        "за границей",
        "загорать",
        "загорелый",
        "Западная Европа",
        "индустрия туризма",
        "иностранец",
        "иностранный",
        "каникулы",
        "карта",
        "корабль",
        "курорт",
        "пароход",
        "паспорт",
        "перевозка",
        "пляж",
        "побережье",
        "поезд "
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
        "Двойной тулуп",
        "Клюшка",
        "Мяч",
        "Ворота",
        "Шайба",
        "Кий",
        "Булавы",
        "Хулахуп",
        "Манеж",
        "Спортзал",
        "Велосипед",
        "Сапборд",
        "Байдарка",
        "Фехтование",
        "Футбол",
        "Матч",
        "Соревнования",
        "Лыжи",
        "Сноуборд",
        "Бобслей",
        "Эллипсоид",
        "Беговая дорожка",
        "Ролики",
        "Коньки",
        "Экипировка",
        "Боксерская груша",
        "Боксерские перчатки",
        "Чемпионат",
        "Чемпион",
        "Олимпийские игры",
        "Гравитрон",
        "Ленты",
        "Гиперэкстензия"
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
        "17 мгновений весны",
        "Престиж",
        "Начало",
        "Иллюзия обмана",
        "Тело",
        "Метро",
        "Поиск",
        "Исходный код",
        "Черная орхидея",
        "Падение Луны",
        "Операция «Мясной фарш»",
        "Лулу и Бриггс",
        "Смерть на Ниле",
        "Папы",
        "Мистер Нокаут",
        "Молодой человек",
        "Невидимый убийца",
        "Я хочу! Я буду!",
        "Профессор и призрачный убийца",
        "Бюро магических услуг",
        "Блуждающая Земля 2",
        "Беспринципные в деревне",
        "Моё прекрасное несчастье",
        "На солнце, вдоль рядов кукурузы",
        "Родители строгого режима",
        "Быть Сальвадором Дали",
        "Беглец",
        "Хитровка. Знак четырёх",
        "14+: Продолжение",
        "Непосредственно Каха",
        "Мой пёс Руни",
        "Три разбойника и лев",
        "Иллюзия побега",
        "Как отделаться от парня за 10 дней",
        "Элвин и бурундуки 2",
        "Пара из будущего",
        "Блондинка в законе",
        "Битва шефов",
        "Помогите, я уменьшил свою училку!",
        "выбор Иви Приключения Паддингтона 2",
        "Дедушка НЕлегкого поведения"
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
    case mixTheme = "Общая"
    
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
        }
    }
}
