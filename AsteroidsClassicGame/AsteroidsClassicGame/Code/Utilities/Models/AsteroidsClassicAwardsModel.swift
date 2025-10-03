//
//  AsteroidsClassicAwardsModel.swift
//  AsteroidsClassicGame
//
//  Created by MIKHAIL ZHACHKO on 3.10.25.
//

import SwiftUI

struct AsteroidsClassicAwardsModel: Identifiable {
    let id = UUID()
    let awardImage: Image
    let awardTitle: String
    let awardDescription: String
    let awardCrystal: Int
    var awardStatus: Bool { AsteroidsClassicUserDefaults.isAwardUnlocked(index: index) }
    let index: Int
}

struct AsteroidsClassicGameEvents {
    var diedInFirst5Seconds: Bool = false
    var hit10WithoutMiss: Bool = false
    var bossDefeatedNoDamage: Bool = false
    var collected50CrystalsNoDeath: Bool = false
    var defeatedBossWith1HP: Bool = false
}


let allAwards: [AsteroidsClassicAwardsModel] = [
    // SCORE
    AsteroidsClassicAwardsModel(awardImage: Image(.award01), awardTitle: "First Step", awardDescription: "Score 1,000 points", awardCrystal: 10, index: 0 ),
    AsteroidsClassicAwardsModel(awardImage: Image(.award02), awardTitle: "On the Way", awardDescription: "Score 5,000 points", awardCrystal: 20, index: 1),
    AsteroidsClassicAwardsModel(awardImage: Image(.award03), awardTitle: "Skilled Pilot", awardDescription: "Score 10,000 points", awardCrystal: 30, index: 2),
    AsteroidsClassicAwardsModel(awardImage: Image(.award04), awardTitle: "Arcade Legend", awardDescription: "Score 50,000 points", awardCrystal: 50, index: 3),
    AsteroidsClassicAwardsModel(awardImage: Image(.award05), awardTitle: "Living Comet", awardDescription: "Score 100,000 points", awardCrystal: 100, index: 4),
    // ASTEROIDS
    AsteroidsClassicAwardsModel(awardImage: Image(.award01), awardTitle: "First Blood", awardDescription: "Destroy your first asteroid", awardCrystal: 5, index: 5),
    AsteroidsClassicAwardsModel(awardImage: Image(.award02), awardTitle: "Space Cleaner", awardDescription: "Destroy 100 asteroids", awardCrystal: 15, index: 6),
    AsteroidsClassicAwardsModel(awardImage: Image(.award03), awardTitle: "Orbit Sweeper", awardDescription: "Destroy 500 asteroids", awardCrystal: 30, index: 7),
    AsteroidsClassicAwardsModel(awardImage: Image(.award04), awardTitle: "World Breaker", awardDescription: "Destroy 1,000 asteroids", awardCrystal: 50, index: 8),
    AsteroidsClassicAwardsModel(awardImage: Image(.award05), awardTitle: "Star Terminator", awardDescription: "Destroy 5,000 asteroids", awardCrystal: 100, index: 9),
    // BOSSES
    AsteroidsClassicAwardsModel(awardImage: Image(.award01), awardTitle: "First Boss", awardDescription: "Defeat your first boss", awardCrystal: 20, index: 10),
    AsteroidsClassicAwardsModel(awardImage: Image(.award02), awardTitle: "Bounty Hunter", awardDescription: "Defeat 5 bosses", awardCrystal: 50, index: 11),
    AsteroidsClassicAwardsModel(awardImage: Image(.award03), awardTitle: "Galactic Threat", awardDescription: "Defeat 10 bosses", awardCrystal: 80, index: 12),
    AsteroidsClassicAwardsModel(awardImage: Image(.award04), awardTitle: "Tyrant Slayer", awardDescription: "Defeat 25 bosses", awardCrystal: 120, index: 13),
    AsteroidsClassicAwardsModel(awardImage: Image(.award05), awardTitle: "Cosmic Hero", awardDescription: "Defeat 50 bosses", awardCrystal: 200, index: 14),
    // CRYSTALS
    AsteroidsClassicAwardsModel(awardImage: Image(.award01), awardTitle: "White Energy", awardDescription: "Collect 100 white crystals", awardCrystal: 20, index: 15),
    AsteroidsClassicAwardsModel(awardImage: Image(.award02), awardTitle: "Red Energy", awardDescription: "Collect 100 red crystals", awardCrystal: 20, index: 16),
    AsteroidsClassicAwardsModel(awardImage: Image(.award03), awardTitle: "Greedy Collector", awardDescription: "Collect 500 crystals of any type", awardCrystal: 50, index: 17),
    AsteroidsClassicAwardsModel(awardImage: Image(.award04), awardTitle: "Captain’s Treasure", awardDescription: "Collect 5,000 crystal", awardCrystal: 100, index: 18),
    AsteroidsClassicAwardsModel(awardImage: Image(.award05), awardTitle: "Artifact Keeper", awardDescription: "Collect 5,000 crystal", awardCrystal: 250, index: 19),
    // SURVIVAL
    AsteroidsClassicAwardsModel(awardImage: Image(.award01), awardTitle: "First Life", awardDescription: "Survive for 1 minute", awardCrystal: 5, index: 20),
    AsteroidsClassicAwardsModel(awardImage: Image(.award02), awardTitle: "Patient Pilot", awardDescription: "Survive for 5 minutes", awardCrystal: 15, index: 21),
    AsteroidsClassicAwardsModel(awardImage: Image(.award03), awardTitle: "Long Flight", awardDescription: "Survive for 15 minutes", awardCrystal: 40, index: 22),
    AsteroidsClassicAwardsModel(awardImage: Image(.award04), awardTitle: "Unbreakable", awardDescription: "Survive for 30 minutes", awardCrystal: 100, index: 23),
    AsteroidsClassicAwardsModel(awardImage: Image(.award05), awardTitle: "Eternal Warrior", awardDescription: "Survive for 1 hour in a single run", awardCrystal: 200, index: 24),
    // FUN / SECRET
    AsteroidsClassicAwardsModel(awardImage: Image(.award01), awardTitle: "Kamikaze", awardDescription: "Lose within the first 5 seconds", awardCrystal: 10, index: 25),
    AsteroidsClassicAwardsModel(awardImage: Image(.award02), awardTitle: "Sharpshooter", awardDescription: "Hit 10 asteroids in a row without missing", awardCrystal: 25, index: 26),
    AsteroidsClassicAwardsModel(awardImage: Image(.award03), awardTitle: "Untouchable", awardDescription: "Defeat a boss without taking damage", awardCrystal: 50, index: 27),
    AsteroidsClassicAwardsModel(awardImage: Image(.award04), awardTitle: "Black Hole", awardDescription: "Collect 50 crystals in a row without dying", awardCrystal: 50, index: 28),
    AsteroidsClassicAwardsModel(awardImage: Image(.award05), awardTitle: "Last Hero", awardDescription: "Survive with 1 HP and defeat a boss", awardCrystal: 100, index: 29)
]
