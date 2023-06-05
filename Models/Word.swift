//
//  Word.swift
//  AliasProject
//
//  Created by Белинский Владислав on 04.06.2023.
//

var usedWords: [String] = []

func getWord(_ array: [String]) -> String {
    
    let words = array.shuffled()
    var index = 0
    
    if usedWords.contains(words[index]) {
        repeat {
            index += 1
        } while usedWords.contains(words[index])
    }
        usedWords.append(words[index])
    
    return words[index]
}


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
