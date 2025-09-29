//
//  AsteroidsClassicBGView.swift
//  AsteroidsClassicGame
//
//  Created by MIKHAIL ZHACHKO on 29.09.25.
//

import SwiftUI

struct AsteroidsClassicBGView: View {
    //MARK: - Views
    var body: some View {
        GeometryReader { geometry in
            Image(.appBG)
                .resizable()
                .scaledToFill()
                .frame(width: geometry.size.width, height: geometry.size.height)
        }
        .mainModifier()
    }
}

#Preview {
    AsteroidsClassicBGView()
}
