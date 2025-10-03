//
//  AsteroidsClassicAwardsView.swift
//  AsteroidsClassicGame
//
//  Created by MIKHAIL ZHACHKO on 29.09.25.
//

import SwiftUI

struct AsteroidsClassicAwardsView: View {
    //MARK: - Properties
    @Binding private var showAwards: Bool
    private let asteroidAppAwards = allAwards
    //MARK: - Init
    init(showAwards: Binding<Bool>) {
        self._showAwards = showAwards
    }
    //MARK: - View
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let columns = [
                GridItem(.flexible(), spacing: width * 0.04),
                GridItem(.flexible(), spacing: width * 0.04)
            ]
            AsteroidsClassicBGView()
            
            ScrollView(showsIndicators: false) {
                HStack(spacing: width * 0.165) {
                    AsteroidsClassicButtonView(bImage: Image(.backwardButton)) { goToMenu() }
                        .frame(height: height * 0.07)
                    Text(AsteroidsClassicAppConstants.appString.awardsTitle)
                        .textNameSettings(textSize: width * 0.07)
                    Spacer()
                }
                .padding(width * 0.05)
                LazyVGrid(columns: columns, spacing: width * 0.05) {
                    ForEach(asteroidAppAwards) { award in
                        AsteroidsClassicAwardCardView(size: width * 0.4, award: award)
                    }
                }
                .padding(width * 0.05)
            }
            
            .position(x: width * 0.5, y: height * 0.5)
        }
    }
    private func goToMenu() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            showAwards = false
        }
    }
}

#Preview {
    AsteroidsClassicAwardsView(showAwards: .constant(true))
}
