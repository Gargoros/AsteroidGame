//
//  AsteroidsClassicAppStorage.swift
//  AsteroidsClassicGame
//
//  Created by MIKHAIL ZHACHKO on 29.09.25.
//

import Foundation

final class AsteroidsClassicUserDefaults {
    
    private static let storage = UserDefaults.standard
    static let zeroValue = AsteroidsClassicAppConstants.appNumb.zeroValue
    static let maxValue = AsteroidsClassicAppConstants.appNumb.maxValue
    //MARK: - Sound and vibro
    static var isSoundOn: Bool {
        get { storage.value(forKey: AsteroidsClassicAppConstants.dataKeys.sounds.rawValue) as? Bool ?? AsteroidsClassicAppConstants.initBools.initOnStatus }
        set { storage.set(newValue, forKey: AsteroidsClassicAppConstants.dataKeys.sounds.rawValue) }
    }
    static var isMusicOn: Bool {
        get { storage.value(forKey: AsteroidsClassicAppConstants.dataKeys.music.rawValue) as? Bool ?? AsteroidsClassicAppConstants.initBools.initOnStatus }
        set { storage.set(newValue, forKey: AsteroidsClassicAppConstants.dataKeys.music.rawValue) }
    }
    static var isHapticOn: Bool {
        get { storage.value(forKey: AsteroidsClassicAppConstants.dataKeys.haptic.rawValue) as? Bool ?? AsteroidsClassicAppConstants.initBools.initOnStatus }
        set { storage.set(newValue, forKey: AsteroidsClassicAppConstants.dataKeys.haptic.rawValue) }
    }
    //MARK: - Game Score
    static var bestScore: UInt {
        get { storage.value(forKey: AsteroidsClassicAppConstants.dataKeys.bestScore.rawValue) as? UInt ?? zeroValue }
        set {
            if newValue <= maxValue {
                storage.set(newValue, forKey: AsteroidsClassicAppConstants.dataKeys.bestScore.rawValue)
            }
        }
    }
    //MARK: - Game crystal
    static var gameWhiteCrystal: UInt {
        get { storage.value(forKey: AsteroidsClassicAppConstants.dataKeys.whiteCrystal.rawValue) as? UInt ?? zeroValue }
        set {
            if newValue <= maxValue {
                storage.set(newValue, forKey: AsteroidsClassicAppConstants.dataKeys.whiteCrystal.rawValue)
            }
        }
    }
    static var gameRedCrystal: UInt {
        get { storage.value(forKey: AsteroidsClassicAppConstants.dataKeys.redCrystal.rawValue) as? UInt ?? zeroValue }
        set {
            if newValue <= maxValue {
                storage.set(newValue, forKey: AsteroidsClassicAppConstants.dataKeys.redCrystal.rawValue)
            }
        }
    }
    //MARK: - Upgrades
    //MARK: - Store
    static func isStoreItemPurchased(index: Int) -> Bool {
        storage.bool(forKey: AsteroidsClassicAppConstants.appString.storeItemStatus + "\(index)")
    }
    static func isStoreItemSelected(index: Int) -> Bool {
        storage.bool(forKey: AsteroidsClassicAppConstants.appString.storeItemSelected + "\(index)")
    }
    
    //MARK: - Store Management
    static func purchaseStoreItem(index: Int) {
        storage.set(true, forKey: AsteroidsClassicAppConstants.appString.storeItemStatus + "\(index)")
    }
    
    static func selectStoreItem(index: Int) {
        for i in 0..<AsteroidsClassicAppConstants.storeItems.allShips.count {
            storage.set(false, forKey: AsteroidsClassicAppConstants.appString.storeItemSelected + "\(i)")
        }
        storage.set(true, forKey: AsteroidsClassicAppConstants.appString.storeItemSelected + "\(index)")
    }
    
    static func canAffordStoreItem(index: Int) -> Bool {
        guard index < AsteroidsClassicAppConstants.storeItems.allShips.count else { return false }
        let itemCrystal = AsteroidsClassicAppConstants.storeItems.allShips[index].crystal
        return gameWhiteCrystal >= UInt(itemCrystal)
    }
    
    static func purchaseAndSelectStoreItem(index: Int) -> Bool {
        guard canAffordStoreItem(index: index) else { return false }
        
        let itemCrystal = AsteroidsClassicAppConstants.storeItems.allShips[index].crystal
        
        if itemCrystal > 0 {
            gameWhiteCrystal -= UInt(itemCrystal)
        }
        
        purchaseStoreItem(index: index)
        selectStoreItem(index: index)
        
        return true
    }
    
    static func changeSelectedShip(to index: Int) -> Bool {
        guard isStoreItemPurchased(index: index) else { return false }
        selectStoreItem(index: index)
        return true
    }
    
    static func initializeDefaultShip() {
        if !isStoreItemPurchased(index: 0) {
            purchaseStoreItem(index: 0)
            selectStoreItem(index: 0)
        }
    }
    
    static func getSelectedShipIndex() -> Int {
        for i in 0..<AsteroidsClassicAppConstants.storeItems.allShips.count {
            if isStoreItemSelected(index: i) {
                return i
            }
        }
        return 0
    }
    
    static func getAllStoreItems() -> [AsteroidsClassicStoreItemModel] {
        return AsteroidsClassicStoreItemModel.createAllShips()
    }
    //MARK: - Awards
    static var destroyedAsteroids: UInt {
        get { storage.value(forKey: AsteroidsClassicAppConstants.dataKeys.asteroids.rawValue) as? UInt ?? zeroValue }
        set {
            if newValue <= maxValue {
                storage.set(newValue, forKey: AsteroidsClassicAppConstants.dataKeys.asteroids.rawValue)
            }
        }
    }
    static var defeatedBosses: UInt {
        get { storage.value(forKey: AsteroidsClassicAppConstants.dataKeys.boss.rawValue) as? UInt ?? zeroValue }
        set {
            if newValue <= maxValue {
                storage.set(newValue, forKey: AsteroidsClassicAppConstants.dataKeys.boss.rawValue)
            }
        }
    }
    static var survivingMinutes: UInt {
        get { storage.value(forKey: AsteroidsClassicAppConstants.dataKeys.minutes.rawValue) as? UInt ?? zeroValue }
        set {
            if newValue <= maxValue {
                storage.set(newValue, forKey: AsteroidsClassicAppConstants.dataKeys.minutes.rawValue)
            }
        }
    }
    static func isAwardUnlocked(index: Int) -> Bool {
        storage.bool(forKey: AsteroidsClassicAppConstants.appString.awardsStatus + "\(index)")
    }
    
    static func unlockAward(index: Int) {
        storage.set(true, forKey: AsteroidsClassicAppConstants.appString.awardsStatus + "\(index)")
    }
    
    static func resetAwards() {
        for i in 0..<allAwards.count {
            storage.set(false, forKey: AsteroidsClassicAppConstants.appString.awardsStatus + "\(i)")
        }
    }
}
