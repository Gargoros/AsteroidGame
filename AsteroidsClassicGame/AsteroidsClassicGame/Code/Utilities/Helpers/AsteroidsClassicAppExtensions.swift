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
    func textNameSettings(textColors: [Color] = [.asteroidsClassicWhite01, .asteroidsClassicBlue01, .asteroidsClassicWhite02], textSize: CGFloat = 32, shadowColor: Color = .asteroidsClassicDark01) -> some View {
        self.modifier(AsteroidsClassicNameTextViewModifiers(textColors: textColors, textSize: textSize, shadowColor: shadowColor))
    }
}
