//
//  Team.swift
//  AliasProject
//
//  Created by Мария Купчинская on 07.06.2023.
//

//import Foundation
//
//struct Team {
//    var imageName = ""
//    var name = ""
//    var points = 0
//}

struct Team {
    let imageName: String
    let colorImageName: String
    let name: String
    var points = 0
    
    static func getTeam() -> [Team] {
        [
            Team(
                imageName: "gribok",
                colorImageName: "colorgribok",
                name: "Грибы"
            ),
            Team(
                imageName: "vishni",
                colorImageName: "colorvishni",
                name: "Вишни"
            ),
            Team(
                imageName: "olivka",
                colorImageName: "colorOlivka",
                name: "Оливки"
            ),
            Team(
                imageName: "baklaz",
                colorImageName: "colorBaklaz",
                name: "Баклажаны"
            )
        ]
    }
}
