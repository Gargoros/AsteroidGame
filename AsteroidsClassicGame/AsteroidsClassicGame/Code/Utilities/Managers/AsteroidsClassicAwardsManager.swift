//
//  AsteroidsClassicAwardsManager.swift
//  AsteroidsClassicGame
//
//  Created by MIKHAIL ZHACHKO on 3.10.25.
//

import Foundation

final class AwardsManager {
    // MARK: - Score Awards
    static func checkScoreAwards(score: UInt) {
        if score >= 1000    { AsteroidsClassicUserDefaults.unlockAward(index: 0) }
        if score >= 5000    { AsteroidsClassicUserDefaults.unlockAward(index: 1) }
        if score >= 10000   { AsteroidsClassicUserDefaults.unlockAward(index: 2) }
        if score >= 50000   { AsteroidsClassicUserDefaults.unlockAward(index: 3) }
        if score >= 100000  { AsteroidsClassicUserDefaults.unlockAward(index: 4) }
    }
    // MARK: - Asteroid Awards
    static func checkAsteroidAwards(count: UInt) {
        if count >= 1       { AsteroidsClassicUserDefaults.unlockAward(index: 5) }
        if count >= 100     { AsteroidsClassicUserDefaults.unlockAward(index: 6) }
        if count >= 500     { AsteroidsClassicUserDefaults.unlockAward(index: 7) }
        if count >= 1000    { AsteroidsClassicUserDefaults.unlockAward(index: 8) }
        if count >= 5000    { AsteroidsClassicUserDefaults.unlockAward(index: 9) }
    }
    // MARK: - Boss Awards
    static func checkBossAwards(count: UInt) {
        if count >= 1       { AsteroidsClassicUserDefaults.unlockAward(index: 10) }
        if count >= 5       { AsteroidsClassicUserDefaults.unlockAward(index: 11) }
        if count >= 10      { AsteroidsClassicUserDefaults.unlockAward(index: 12) }
        if count >= 25      { AsteroidsClassicUserDefaults.unlockAward(index: 13) }
        if count >= 50      { AsteroidsClassicUserDefaults.unlockAward(index: 14) }
    }
    // MARK: - Crystal Awards
    static func checkCrystalAwards(white: UInt, red: UInt) {
        if white >= 100     { AsteroidsClassicUserDefaults.unlockAward(index: 15) }
        if red >= 100       { AsteroidsClassicUserDefaults.unlockAward(index: 16) }
        if (white + red) >= 500   { AsteroidsClassicUserDefaults.unlockAward(index: 17) }
        if (white + red) >= 1000  { AsteroidsClassicUserDefaults.unlockAward(index: 18) }
        if (white + red) >= 5000  { AsteroidsClassicUserDefaults.unlockAward(index: 19) }
    }
    // MARK: - Survival Awards
    static func checkSurvivalAwards(minutes: UInt) {
        if minutes >= 1     { AsteroidsClassicUserDefaults.unlockAward(index: 20) }
        if minutes >= 5     { AsteroidsClassicUserDefaults.unlockAward(index: 21) }
        if minutes >= 15    { AsteroidsClassicUserDefaults.unlockAward(index: 22) }
        if minutes >= 30    { AsteroidsClassicUserDefaults.unlockAward(index: 23) }
        if minutes >= 60    { AsteroidsClassicUserDefaults.unlockAward(index: 24) }
    }
    // MARK: - Fun / Secret Awards
    static func checkFunAwards(events: AsteroidsClassicGameEvents) {
        if events.diedInFirst5Seconds        { AsteroidsClassicUserDefaults.unlockAward(index: 25) }
        if events.hit10WithoutMiss           { AsteroidsClassicUserDefaults.unlockAward(index: 26) }
        if events.bossDefeatedNoDamage       { AsteroidsClassicUserDefaults.unlockAward(index: 27) }
        if events.collected50CrystalsNoDeath { AsteroidsClassicUserDefaults.unlockAward(index: 28) }
        if events.defeatedBossWith1HP        { AsteroidsClassicUserDefaults.unlockAward(index: 29) }
    }
}
