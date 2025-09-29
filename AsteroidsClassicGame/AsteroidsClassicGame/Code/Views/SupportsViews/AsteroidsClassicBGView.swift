//
//  AsteroidsClassicBGView.swift
//  AsteroidsClassicGame
//
//  Created by MIKHAIL ZHACHKO on 29.09.25.
//

import SwiftUI

struct AsteroidsClassicBGView: View {
    //MARK: - Properties
    private let bgImage: Image
    //MARK: - Init
    init(bgImage: Image) {
        self.bgImage = bgImage
    }
    //MARK: - Views
    var body: some View {
        GeometryReader { geometry in
            bgImage
                .resizable()
                .scaledToFill()
                .frame(width: geometry.size.width, height: geometry.size.height)
        }
        .mainModifier()
    }
}

#Preview {
    AsteroidsClassicBGView(bgImage: Image(.appBG))
}
