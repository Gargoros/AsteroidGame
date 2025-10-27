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
        case boss
        case minutes
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
    enum appString {
        static let loading: String = "LOADING..."
        static let appName: String = "ASTEROID GAME"
        static let bestScore: String = "BEST: "
        static let settingsTitle: String = "SETTINGS"
        static let awardsTitle: String = "AWARDS"
        static let storeTitle: String = "STORE"
        static let soundsTitle: String = "SOUNDS"
        static let musicTitle: String = "MUSIC"
        static let hapticsTitle: String = "HAPTICS"
        //MARK: - Helper strings
        static let awardsStatus: String = "award_status_"
        static let storeItemStatus: String = "store_item_status_"
        static let storeItemSelected: String = "store_item_selected_"
    }
    //MARK: - Numbers
    enum appNumb {
        static let zeroValue: UInt = 0
        static let maxValue: UInt = 9999999
    }
    
    //MARK: - Store Items
    enum storeItems {
        static let allShips: [(image: String, title: String, description: String, crystal: Int)] = [
            ("Spaceship_0", "Basic Ship", "Standard spaceship for beginners", 0),
            ("Spaceship_1", "Fast Ship", "Increased speed and maneuverability", 100),
            ("Spaceship_2", "Heavy Ship", "More durable with better armor", 250),
            ("Spaceship_3", "Stealth Ship", "Advanced stealth technology", 500),
            ("Spaceship_4", "Combat Ship", "Military-grade weaponry", 750),
            ("Spaceship_5", "Elite Ship", "Ultimate spaceship with all upgrades", 1000)
        ]
    }
    
}
