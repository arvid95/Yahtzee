//
//  YahtzeeModel.swift
//  Yahtzee
//
//  Created by Arvid Axelsson on 2022-11-28.
//

import Foundation

class YahtzeeModel: ObservableObject {
    
    enum Section: Int, CaseIterable {
        case aces = 1, twos, threes, fours, fives, sixes, threeOfAKind, fourOfAKind, fullHouse, smallStraight, largeStraight, yahtzee, change
        
        func getPoints(dice: [DieModel]) -> Int {
            switch self {
            case .aces, .twos, .threes, .fours, .fives, .sixes:
                return dice.reduce(0, { $1.value == self.rawValue ? $0 + $1.value : $0 })
            default:
                return 0
            }
        }
    }
    
    var dice: [DieModel] = []
    @Published var sections: [Section: Int] = [:]
    @Published var rolls = 1
    
    init() {
        for _ in 0..<5 {
            dice.append(DieModel())
        }
        Section.allCases.forEach{ section in
            sections[section] = 0
        }
        print(sections)
    }
    
    func roll() {
        
        guard rolls < 3 else {
            return
        }
        dice.forEach { dieModel in
            dieModel.roll()
        }
        rolls += 1
    }
    
    func reset() {
        dice.forEach { dieModel in
            dieModel.isActive = true
            dieModel.roll()
        }
        rolls = 1
    }
    
    func check(section: Section) {
        sections[section] = section.getPoints(dice: dice)
    }
    
}
