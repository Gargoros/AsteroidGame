//
//  AsteroidsClassicAwardCardView.swift
//  AsteroidsClassicGame
//
//  Created by MIKHAIL ZHACHKO on 4.10.25.
//

import SwiftUI

struct AsteroidsClassicAwardCardView: View {
    //MARK: - Properties
    private let size: CGFloat
    private let award: AsteroidsClassicAwardsModel
    //MARK: - Init
    init(size: CGFloat, award: AsteroidsClassicAwardsModel) {
        self.size = size
        self.award = award
    }
    //MARK: - View
    var body: some View {
        AsteroidsClassicUIView(image: Image(.table02), width: size)
            .overlay {
                HStack(alignment: .center, spacing: size * 0.02) {
                    AsteroidsClassicUIView(image: award.awardImage, width: size * 0.15)
                        .opacity(award.awardStatus ? 1 : 0.4)
                        .grayscale(award.awardStatus ? 0 : 1)
                    
                    VStack(alignment: .leading, spacing: size * 0.02) {
                        Text(award.awardTitle)
                            .textNameSettings(textSize: size * 0.07)
                            .foregroundColor(award.awardStatus ? .white : .gray)
                        Text(award.awardDescription)
                            .textSetting(textSize: size * 0.05)
                            .foregroundColor(award.awardStatus ? .white : .gray)
                    }
                }
                .padding(size * 0.05)
                .offset(y: -size * 0.01)
            }
    }
}

#Preview {
    AsteroidsClassicAwardCardView(size: 300, award: allAwards[0])
}
