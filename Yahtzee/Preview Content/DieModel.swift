//
//  DieModel.swift
//  Yahtzee
//
//  Created by Arvid Axelsson on 2022-11-28.
//

import Foundation

class DieModel: ObservableObject, Identifiable {
    
    let id = UUID().uuidString
    
    @Published var value: Int
    @Published var isActive = true
    
    init() {
        value = Int.random(in: 1...6)
    }
    
    func roll() {
        if isActive {
            value = Int.random(in: 1...6)
        }
    }
}
