//
//  AsteroidsClassicConstants.swift
//  AsteroidsClassicGame
//
//  Created by MIKHAIL ZHACHKO on 29.09.25.
//

import Foundation

enum AsteroidsClassicAppConstants {
    //MARK: - Data Keys
    enum dataKeys: String {
        //MARK: Score
        case bestScore
        //MARK: - Sounds and Haptics
        case sounds
        case music
        case haptic
        //MARK: - Orientation
        case orientation
        //MARK: - Game
        case spaceShip
        case mine
        case asteroids
        //MARK: - Crystal
        case whiteCrystal
        case redCrystal
    }
    //MARK: - Fonts
    enum fonts {
        static let regular: String = "Hi Jack"
    }
    //MARK: - Bools
    enum initBools {
        static let initOnStatus: Bool = true
    }
    //MARK: - Strings
    enum appString {}
    //MARK: - Numbers
    enum appNumb {
        static let zeroValue: UInt = 0
        static let maxValue: UInt = 9999999
    }
    
}
