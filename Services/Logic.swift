//
//  Logic.swift
//  AliasProject
//
//  Created by Владислав Белинский on 06.06.2023.
//



let celebrities = DataStore.shared.celebrities.shuffled()
let travel = DataStore.shared.travel.shuffled()
let sport = DataStore.shared.sport.shuffled()
let movies = DataStore.shared.movies.shuffled()
let commonThemeWords = DataStore.shared.celebrities + DataStore.shared.movies + DataStore.shared.sport + DataStore.shared.travel
let mixTheme = commonThemeWords.shuffled()


