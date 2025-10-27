//
//  AsteroidsClassicStoreItemModel.swift
//  AsteroidsClassicGame
//
//  Created by MIKHAIL ZHACHKO on 25.10.25.
//

import SwiftUI

struct AsteroidsClassicStoreItemModel: Identifiable {
    let id = UUID()
    let storeItemImage: Image
    let storeItemTitle: String
    let storeItemDescription: String
    let storeItemCrystal: Int
    let index: Int
    
    //MARK: - Computed Properties
    var isPurchased: Bool { 
        AsteroidsClassicUserDefaults.isStoreItemPurchased(index: index) 
    }
    
    var isSelected: Bool { 
        AsteroidsClassicUserDefaults.isStoreItemSelected(index: index) 
    }
    
    var canAfford: Bool {
        AsteroidsClassicUserDefaults.canAffordStoreItem(index: index)
    }
    
    //MARK: - Legacy Properties (for backward compatibility)
    var storeStatus: Bool { isPurchased }
    var storeItemSelected: Bool { isSelected }
    
    //MARK: - Static Factory Method
    static func createAllShips() -> [AsteroidsClassicStoreItemModel] {
        return AsteroidsClassicAppConstants.storeItems.allShips.enumerated().map { index, ship in
            AsteroidsClassicStoreItemModel(
                storeItemImage: Image(ship.image),
                storeItemTitle: ship.title,
                storeItemDescription: ship.description,
                storeItemCrystal: ship.crystal,
                index: index
            )
        }
    }
}


