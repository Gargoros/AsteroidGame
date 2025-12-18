//
//  AsteroidsClassicStoreView.swift
//  AsteroidsClassicGame
//
//  Created by MIKHAIL ZHACHKO on 29.09.25.
//

import SwiftUI

struct AsteroidsClassicStoreView: View {
    //MARK: - Properties
    @Binding private var showStore: Bool
    @State private var storeItems: [AsteroidsClassicStoreItemModel] = []
    @State private var currentCrystals: UInt = 0
    
    //MARK: - Init
    init(showStore: Binding<Bool>) {
        self._showStore = showStore
    }
    
    //MARK: - View
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            AsteroidsClassicBGView()
            
            VStack(spacing: height * 0.02) {
                // Header with crystals and close button
                headerView(width: width, height: height)
                
                // Store items grid
                ScrollView(showsIndicators: false)  {
                    LazyVGrid(columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ], spacing: width * 0.05) {
                        ForEach(storeItems) { item in
                            shipCardView(item: item, width: width, height: height)
                        }
                    }
                    .padding(.horizontal, width * 0.05)
                }
            }
        }
        .onAppear {
            loadStoreData()
        }
    }
    
    //MARK: - Header View
    private func headerView(width: CGFloat, height: CGFloat) -> some View {
        HStack {
            // Crystals display
            HStack(spacing: width * 0.02) {
                Image("CristalIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: width * 0.08)
                
                Text("\(currentCrystals)")
                    .font(.custom(AsteroidsClassicAppConstants.fonts.regular, size: width * 0.06))
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            // Close button
            AsteroidsClassicButtonView(
                bImage: Image("CloseButton"),
                action: { showStore = false }
            )
            .frame(width: width * 0.12, height: width * 0.12)
        }
        .padding(.horizontal, width * 0.05)
        .padding(.top, height * 0.02)
    }
    
    //MARK: - Ship Card View
    private func shipCardView(item: AsteroidsClassicStoreItemModel, width: CGFloat, height: CGFloat) -> some View {
        VStack(spacing: width * 0.02) {
            // Ship image
            ZStack {
                RoundedRectangle(cornerRadius: width * 0.03)
                    .fill(Color.black.opacity(0.2))
                    .frame(height: width * 0.3)
                
                item.storeItemImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: width * 0.25)
            }
            
            // Ship info
            VStack(spacing: width * 0.01) {
                Text(item.storeItemTitle)
                    .font(.custom(AsteroidsClassicAppConstants.fonts.regular, size: width * 0.04))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Text(item.storeItemDescription)
                    .font(.custom(AsteroidsClassicAppConstants.fonts.regular, size: width * 0.03))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                
                // Price or status
                if item.isPurchased {
                    if item.isSelected {
                        Text("SELECTED")
                            .font(.custom(AsteroidsClassicAppConstants.fonts.regular, size: width * 0.035))
                            .foregroundColor(.green)
                    } else {
                        AsteroidsClassicButtonView(
                            bImage: Image("SelectButton"),
                            action: { selectShip(item) }
                        )
                        .frame(width: width * 0.2, height: width * 0.08)
                    }
                } else {
                    HStack {
                        Image("CristalIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: width * 0.04)
                        
                        Text("\(item.storeItemCrystal)")
                            .font(.custom(AsteroidsClassicAppConstants.fonts.regular, size: width * 0.035))
                            .foregroundColor(item.canAfford ? .white : .red)
                    }
                    
                    if item.canAfford {
                        AsteroidsClassicButtonView(
                            bImage: Image("BuyButton"),
                            action: { purchaseShip(item) }
                        )
                        .frame(width: width * 0.2, height: width * 0.08)
                    } else {
                        Text("NOT ENOUGH")
                            .font(.custom(AsteroidsClassicAppConstants.fonts.regular, size: width * 0.03))
                            .foregroundColor(.red)
                    }
                }
            }
            .padding(.horizontal, width * 0.02)
        }
        .background(
            RoundedRectangle(cornerRadius: width * 0.03)
                .fill(Color.black.opacity(0.5))
                .overlay(
                    RoundedRectangle(cornerRadius: width * 0.03)
                        .stroke(item.isSelected ? Color.green : Color.clear, lineWidth: 2)
                )
        )
    }
    
    //MARK: - Actions
    private func loadStoreData() {
        storeItems = AsteroidsClassicStoreItemModel.createAllShips()
        currentCrystals = AsteroidsClassicUserDefaults.gameWhiteCrystal
    }
    
    private func purchaseShip(_ item: AsteroidsClassicStoreItemModel) {
        if AsteroidsClassicUserDefaults.purchaseAndSelectStoreItem(index: item.index) {
            // Play success sound
            AsteroidsClassicSoundManager.shared.incorporateSoundEffects("purchase_success")
            
            // Update UI
            loadStoreData()
        } else {
            // Play error sound
            AsteroidsClassicSoundManager.shared.incorporateSoundEffects("purchase_error")
        }
    }
    
    private func selectShip(_ item: AsteroidsClassicStoreItemModel) {
        if AsteroidsClassicUserDefaults.changeSelectedShip(to: item.index) {
            // Play selection sound
            AsteroidsClassicSoundManager.shared.incorporateSoundEffects("selection_success")
            
            // Update UI
            loadStoreData()
        }
    }
}

#Preview {
    AsteroidsClassicStoreView(showStore: .constant(true))
}
