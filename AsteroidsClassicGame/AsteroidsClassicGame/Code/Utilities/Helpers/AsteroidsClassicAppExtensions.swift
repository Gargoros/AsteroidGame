//
//  AsteroidsClassicAppExtensions.swift
//  AsteroidsClassicGame
//
//  Created by MIKHAIL ZHACHKO on 29.09.25.
//

import SwiftUI

extension View {
    //MARK: - SafeArea + Status bar
    func mainModifier() -> some View{
        self
            .modifier(AsteroidsClassicMainViewModifier())
    }
    //MARK: - Text
    func textSetting(textColor: Color = .asteroidsClassicWhite01, textSize: CGFloat = 32, shadowColor: Color = .asteroidsClassicDark02) -> some View {
        self.modifier(AsteroidsClassicTextViewModifiers(textColor: textColor, textSize: textSize, shadowColor: shadowColor))
    }
}
