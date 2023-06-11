//
//  GameLogic.swift
//  AliasProject
//
//  Created by Мария Купчинская on 09.06.2023.
//

import Foundation
import UIKit

final class Game {
    
    static let shared = Game()
    
    let time = 30
    let winScore = 20
    
    private(set) var isGameOver = false
    private(set) var isRoundOver = false
    
    private(set) var teams: [Team] = []
    private(set) var category: Category?
    var ownWords: [String] = []
    private(set) var round = 1
    var currentTeam: Team? {
        if currentTeamIndex < teams.count {
            return teams[currentTeamIndex]
        } else {
            return nil
        }
    }
    var remainingWords: [String] = []
    
    private init() {}
    
    func startNewGame() {
        self.teams = []
        self.currentTeamIndex = 0
        self.category = nil
        self.remainingWords = []
        self.round = 1
        self.ownWords = []
        self.isGameOver = false
        self.isRoundOver = false
    }
    
    func setTeams(_ teams: [Team]) {
        self.teams = teams
        self.currentTeamIndex = 0
    }
    
    func setCategory(_ category: Category) {
        self.category = category
        self.remainingWords = (category.words + ownWords).shuffled()
    }
    
    func getNextWord() -> String? {
        isRoundOver = false
        return remainingWords.popLast()?.capitalized
        
    }
    
    func checkArray() {
        if remainingWords.isEmpty {
            isGameOver = true
        }
    }
    
    private var currentTeamIndex = 0
    
    func finishTeamStep() {
        if currentTeamIndex == teams.count - 1 {
            currentTeamIndex = 0
            round += 1
            isRoundOver = true
            for team in teams {
                if team.points >= winScore {
                    isGameOver = true
                }
            }
        } else {
            currentTeamIndex += 1
        }
    }
    
    func setAnswer(isCorrect: Bool) {
        if currentTeamIndex < teams.count {
            if isCorrect {
                teams[currentTeamIndex].points += 1
            } else {
                teams[currentTeamIndex].points -= 1
            }
        }
    }
    
    func getWinners() -> [Team] {
        var winners: [Team] = []
        var maxPoints = 0
        for team in teams {
            if maxPoints < team.points {
                maxPoints = team.points
            }
        }
        
        if maxPoints >= winScore {
            for team in teams {
                if team.points == maxPoints {
                    winners.append(team)
                }
            }
            return winners
        } else {
            return []
        }
    }
    
    func formatButton(_ button: UIButton, title: String) {
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor(named: "backgroundColor"), for: .normal)
        button.backgroundColor = UIColor(named: "buttonColor")
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 15
    }
    
    func formatLabel(_ label: UILabel, title: String, size: CGFloat) {
        label.text = title
        label.font = .systemFont(ofSize: size)
        label.textColor = UIColor(named: "buttonColor")
        label.textAlignment = .center
        label.numberOfLines = 0
    }
}
