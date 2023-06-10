//
//  GameLogic.swift
//  AliasProject
//
//  Created by Мария Купчинская on 09.06.2023.
//

import Foundation

final class Game {
    
    static let shared = Game()
    
    let time = 10
    let winScore = 10
    
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
    private var remainingWords: [String] = []
    
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
        self.remainingWords = category.words.shuffled()
    }
    
    func getNextWord() -> String? {
        isRoundOver = false
        return remainingWords.popLast()
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
        
    
    // update curr team
    // finishTeamStep -> State ?
    // add to answers counter
    
}
